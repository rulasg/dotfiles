if ($PROFILE.CurrentUserAllHosts -ne $PSCommandPath) { "Tracing not matching Sprint name" | Write-Error }
# Write-Host (">> {0} ....... [{1}]" -f "PROFILE.CurrentUserAllHosts", $PROFILE.CurrentUserAllHosts ) -ForegroundColor DarkCyan
Write-Information (">> {0} ....... [{1}]" -f "PROFILE.CurrentUserAllHosts", $PROFILE.CurrentUserAllHosts ) 

# Local Paths
$global:USERPROFILE = $HOME
# $global:1db = "$UserHome\OneDrive - BiT21_eu"
$global:1dp = $home | Join-Path -ChildPath "OneDrive"
# $global:DropBox = "$USERPROFILE\Dropbox"
$global:code = $home | Join-Path -ChildPath "Code"
# Secret
$global:SecretsSessionKeyStore = "$Home/.secrets"

#region AUX FUNCTIONS
function Test-MyPath {
    [CmdletBinding()]
    param (
        [Parameter()][string]$Path
    )
    if (-not $Path) {
        return $false
    }
    Test-Path -Path $Path
}
#endregion

#region If 1dp
#Local 1dp
if (Test-MyPath -Path $global:1dp) {

    # $HOME | Join-Path -ChildPath "OneDrive" -AdditionalChildPath "Tools","PsModules","PsScripts","Modules","BaseSDK" | Import-Module 

    #Add $PROFILE.REMOTE Reference
    $RemoteProfilePath = $global:1dp | Join-Path -ChildPath "Tools" -AdditionalChildPath "PsModules","PsScripts","Profiles"
    $PROFILE | Add-Member -NotePropertyName RemoteProfilePath -NotePropertyValue $RemoteProfilePath -Force
    $PROFILE | Add-Member -NotePropertyName Remote -NotePropertyValue ($RemoteProfilePath | Join-Path -ChildPath "Microsoft.PowerShell_profile_remote.ps1" ) -Force

    ## Resent variables

    $global:Separacion_KarakaSeparacionCasa =  $global:1dp | Join-Path -ChildPath "Documentos" -AdditionalChildPath "karaka","Separacion.KarakaSeparacionCasa"
    $global:bit21Close = $global:1dp | Join-Path -ChildPath "Documentos" -AdditionalChildPath "/bit21.Close" 
    
    function ok {Goto $global:Separacion_KarakaSeparacionCasa }    
}
#endregion

#region Posh-git and prompt

#Prompt
# function Prompt { "PS $($executionContext.SessionState.Path.CurrentLocation)`n$('>' * ($nestedPromptLevel + 1)) " }

# posh-git

Import-Module posh-git

$GitPromptSettings.DefaultPromptPrefix.Text = 'PS '
# $GitPromptSettings.DefaultPromptPath =
# $GitPromptSettings.DefaultPromptPath.ForegroundColor = 0xFFA500
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
$GitPromptSettings.DefaultPromptBeforeSuffix = '`n'
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $false
#endregion


#Remote profile
if (Test-MyPath -Path $global:PROFILE.REMOTE) {
    Import-Module $PROFILE.REMOTE
}

# Write-Host ("<< {0} ....... [{1}]" -f "PROFILE.CurrentUserAllHosts", $PROFILE.CurrentUserAllHosts ) -ForegroundColor DarkCyan
Write-Information ("<< {0} ....... [{1}]" -f "PROFILE.CurrentUserAllHosts", $PROFILE.CurrentUserAllHosts )
