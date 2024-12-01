### Primary Contact

if ($PROFILE.CurrentUserAllHosts -ne $PSCommandPath) { "Tracing not matching Sprint name" | Write-Error }
Write-Information (">> {0} ....... [{1}]" -f "PROFILE.CurrentUserAllHosts", $PROFILE.CurrentUserAllHosts ) 

#region Local_Paths

$global:USERPROFILE = $HOME
# $global:1db = "$UserHome\OneDrive - BiT21_eu"
# $global:DropBox = "$USERPROFILE\Dropbox"
$global:1dp = $home | Join-Path -ChildPath "OneDrive"

#Code
$global:code = $home | Join-Path -ChildPath "code"
$global:dotFilesrepo = $home | Join-Path -ChildPath $global:code -AdditionalChildPath "dotfiles"

# Apps
$global:SecretsSessionKeyStore = "$Home/.secrets"
$global:AppleScripts = '/Users/rulasg/Library/Mobile Documents/com~apple~ScriptEditor2/Documents'

#Profile
$PROFILE | Add-Member -NotePropertyName LocalProfilePath -NotePropertyValue ($PROFILE | Split-Path -Parent) -Force

#endregion

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

#region AppleScripts
if (Test-MyPath -Path $global:AppleScripts) {
    function New-Desktop(){
        $script = $global:AppleScripts | Join-Path -ChildPath 'CreateDesktop.scpt'
        osascript $script
    }

    function Close-Desktop(){
        $script = $global:AppleScripts | Join-Path -ChildPath 'CloseLastDesktop.scpt'
        osascript $script
    }
}
#endregion

#region Prompt

# function Prompt { "PS $($executionContext.SessionState.Path.CurrentLocation)`n$('>' * ($nestedPromptLevel + 1)) " }

# posh-git

Import-Module posh-git

# $GitPromptSettings.DefaultPromptPrefix.ForegroundColor ='yellow' 
# $GitPromptSettings.DefaultPromptPrefix.Text = '[$(Get-DevUserShortString)] '
# $GitPromptSettings.DefaultPromptPrefix.Text = '[$(gh who)] '
# $GitPromptSettings.DefaultPromptPrefix.Text = '[$(gh api user --jq ".login")] '
# $GitPromptSettings.DefaultPromptPath =
# $GitPromptSettings.DefaultPromptPath.ForegroundColor = 0xFFA500
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'purple'
$GitPromptSettings.DefaultPromptBeforeSuffix = '`n'
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $false

#endregion

#Remote profile
if (Test-MyPath -Path $global:PROFILE.REMOTE) {
    Import-Module $PROFILE.REMOTE
}

# Set development profile
# Restore-DevUser -WarningAction SilentlyContinue -InformationAction SilentlyContinue

# check if brew is installed
if (Test-MyPath -Path "/opt/homebrew/bin/brew") {
    # Add brew to path

    if($env:PATH -like "*/opt/homebrew/bin*")
    {
        Write-Information "Brew already in path"
    }
    else
    {
        $(/opt/homebrew/bin/brew shellenv) | ForEach-Object{Invoke-Expression $_ }
    }
}

Write-Information ("<< {0} ....... [{1}]" -f "PROFILE.CurrentUserAllHosts", $PROFILE.CurrentUserAllHosts )
