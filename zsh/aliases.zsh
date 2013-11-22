alias f='find . -iname'
alias ls='ls -lGh'
alias la='ls -lGha'
alias fixterm='sudo rm -rf /private/var/log/asl/*.asl'
alias flushdns='dscacheutil -flushcache'
alias tlf="tail -f"
alias less='less -R'
alias ln='ln -v'
alias mkdir='mkdir -p'
alias sed='sed -E'
alias ...='../..'

alias be='bundle exec'
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias r='rails'
alias rc='rails console'
alias rs='rails server'
alias rd='rails dbconsole'
alias rk='rake'
alias tu='ruby -Itest'

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

if type hub > /dev/null 2>&1; then alias git="hub"; fi
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias go='git checkout'
alias gl='git log'
alias gd='git diff'

alias h='heroku'
alias herok='heroku'

alias tmux="tmux -2"

alias dotfiles="cd $DOTFILES"
