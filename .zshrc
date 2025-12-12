eval "$(starship init zsh)"
autoload -U promptinit; promptinit
prompt pure

export ZSH="/Users/artjom/.oh-my-zsh"
export ZSH_COLORIZE_STYLE="colorful"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

plugins=(
  colorize
  eza
  git
  gpg-agent
  keychain
  ngrok
  nvm
  sublime
  z
  zsh-autosuggestions
)

zstyle :omz:plugins:keychain agents ssh,gpg
zstyle :omz:plugins:keychain identities id_rsa 2D5E6F5DA8A297604917ADE7FFD5CFFEB3BFFC8A

source $ZSH/oh-my-zsh.sh

alias v="vim -b"
alias vi="vim -b"
alias gb="git branch"
alias gd="git diff"
alias gs="git status"

source $(brew --prefix nvm)/nvm.sh

export PYENV_ROOT=$HOME/.pyenv
export PATH="/Users/artjom/.local/bin:$PATH"

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/artjom/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by Antigravity
export PATH="/Users/artjom/.antigravity/antigravity/bin:$PATH"
