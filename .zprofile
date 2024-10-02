
# Used by GPG for git commit signing
# Append the following to your ~/.bash_profile or ~/.bashrc or ~/.zshrc
export GPG_TTY=$(tty)

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

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Copilot CLI
# eval "$(github-copilot-cli alias -- "$0")"

# Add variables for Training Manual repo allowing to create GitHub developers training repos
export TOKEN_OWNER='rulasg'
# export TEACHER_PAT='' # will inject thi token through codespace secrets
export INSTANCE_URL='api.github.com'
export ROOT_URL='github.com'
export CLASS_ORG='ps-developers-sandbox'
eval "$(/opt/homebrew/bin/brew shellenv)"
