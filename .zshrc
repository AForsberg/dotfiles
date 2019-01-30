export ZSH="~/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

plugins=(
  osx git npm vscode z yarn
)

source $ZSH/oh-my-zsh.sh
# . /usr/local/etc/profile.d/z.sh

alias gp="git pull"
alias push="git push"
alias gs="git status"
alias cob="git checkout -b"
alias commit="git commit -m"

autoload -U promptinit; promptinit
prompt spaceship
