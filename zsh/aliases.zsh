alias f='find . -iname'
alias ls='ls -lGh'
alias la='ls -lGha'
alias finder='open .'
alias fixterm='sudo rm -rf /private/var/log/asl/*.asl'
alias flushdns='dscacheutil -flushcache'
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ...='../..'

alias be='bundle exec'
alias migrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"
alias m="migrate"
alias r='rails'
alias rk="rake"
alias s="rspec"
alias z="zeus"

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias go='git checkout'
alias gl='git log'
alias gd='git diff'

alias tmux="tmux -2"

