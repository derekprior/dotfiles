# Enable Colors in various scripts
export CLICOLOR=1
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CUCUMBER_FORMAT='pretty'

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\\w*'"  # lists all the colors

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

if [ -n "$SSH_CLIENT" ]; then
  host_info="\n\[${COLOR_YELLOW}\]\u@\h"
fi

if [ -d "$HOME/.rbenv/" ]; then
  ruby_version="\n\[${COLOR_RED}\][\$(rbenv version-name)] "
else
  ruby_version="\n\[${COLOR_RED}\][system] "
fi

directory="\[${COLOR_CYAN}\]\w"
git_branch="\[${COLOR_GREEN} \$(parse_git_branch) "
prompt_char="\n\[${COLOR_LIGHT_CYAN}\]➜  \[${COLOR_NC}\]"
export PS1=$host_info$ruby_version$directory$git_branch$prompt_char

# Bash History
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind is used instead of setting these in .inputrc.  This ignores case in bash completion
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Allow spelling mistakes in CD to be auto corrected
shopt -s cdspell

# Display Most Used Commands (Consider Aliases for any that aren't aliased)
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Common CD commands
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd ..'

# Rails Commands
# For the most part, I rely on rbenv-bundler to issue bundle exec
alias r='rails'
alias be='bundle exec'
alias dbm='rake db:migrate'
alias dbtp='rake db:test:prepare'

#rbenv aliases - typos and old habbits!
alias rb='rbenv'

# Git Aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gpush='git push'
alias gpull='git pull'

# other lazy aliases
alias t='tmux -u'
alias f='find . -iname'

# Postgres Stuff
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# MYSQL Stuff
alias mystart='sudo launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'
alias mystop='sudo launchctl unload -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'

# Oracle Stuff
if [ -d ~/bin/ohome ]; then
  export PATH=~/bin/ohome:$PATH
  export DYLD_LIBRARY_PATH=~/bin/ohome
  export TNS_ADMIN=~/bin/ohome/
fi

# Perforce Settings
export P4CONFIG=.perforce
export P4USER=dprior
export P4PORT='rsh:ssh -q -a -x -l p4ssh perforce /bin /true'
alias p4s='p4 submit'
alias p4a='p4 add'
alias p4e='p4 edit'
alias p4o='p4 opened'
alias p4d='p4 describe'
alias p4aa='find . -type f ! -name ".DS_Store" -print | p4 -x - add'

# Spoofed Pubcookie User for Local Development
export REMOTE_USER=dprior

# Check OS
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  # Mac OS X
  export VISUAL='mvim -f'
  export EDITOR='mvim -f'
  export P4EDITOR='mvim -f'
  alias ls='ls -lGh'
  alias la='ls -lGha'
  alias finder='open .'
  alias fixterm='sudo rm -rf /private/var/log/asl/*.asl'
else
  # Linux
  export VISUAL='vim'
  export EDITOR='vim'
  export P4EDITOR='vim'
  alias ls='ls -lGh --color'
  alias la='ls -lGha --color'
fi

# Set PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:~/bin:$PATH

# Initialize rbenv
eval "$(rbenv init -)"

# mkdir & cd to it
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# Source Machine Local Settings for overrides or additions
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

