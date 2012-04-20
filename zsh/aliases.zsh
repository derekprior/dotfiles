alias f='find . -iname'

if [[ `uname` == 'Darwin' ]]; then
  alias ls='ls -lGh'
  alias la='ls -lGha'
  alias finder='open .'
  alias fixterm='sudo rm -rf /private/var/log/asl/*.asl'
else
  alias ls='ls -lGh --color'
  alias la='ls -lGha --color'
fi

