# alias f='find . -iname'

if [[ `uname` == 'Darwin' ]]; then
  alias ls='ls -lGh'
  alias la='ls -lGha'
  alias finder='open .'
  alias fixterm='sudo rm -rf /private/var/log/asl/*.asl'
  alias flushdns='dscacheutil -flushcache'
else
  alias ls='ls -lGh --color'
  alias la='ls -lGha --color'
fi

alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ...='../..'
