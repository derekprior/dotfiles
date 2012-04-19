export GHI_PAGER=less

hub_path=$(which hub)
if [[ -f $hub_path ]]
then
  alias git=$hub_path
fi

alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias go='git checkout'
alias gl='git log'
alias gd='git diff'

