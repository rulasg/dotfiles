eval "$(/opt/homebrew/bin/brew shellenv)"

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Launch Powershell
pp(){
  pwsh
}

# Exit command
qq(){
  exit
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Copilot CLI
eval "$(github-copilot-cli alias -- "$0")"

