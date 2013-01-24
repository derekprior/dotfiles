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

# Some aliases I use in my projects
alias uidir="cd \`git rev-parse --git-dir\`/../src/main/webapp/ui/"
