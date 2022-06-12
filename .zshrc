# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GOPATH=~/Workspace/Go

# Path to your oh-my-zsh installation.
export ZSH="/Users/artjom/.oh-my-zsh"
export WORKON_HOME="/Users/artjom/Workspace/Envs"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi


ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  virtualenvwrapper
  z
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/.aws-shipit

alias v="vim -b"
alias vi="vim -b"
alias gb="git branch"
alias gd="git diff"
alias gs="git status"
alias ll="exa -l --icons"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PYENV_ROOT="$HOME/.pyenv"
export PATH=$HOME/bin:$HOME/Workspace/Go/bin:/usr/local/bin:/usr/local/sbin:$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
