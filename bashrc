# Enable Colors in various scripts
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS='gafxcxdxbxegedabagacad'
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CUCUMBER_FORMAT='pretty'

# Color Shorthand
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

if [ -n "$SSH_CLIENT" ]; then
  host_info="\n\[${bldylw}\]\u@\h"
fi

if [ -f $HOME/.rvm/bin/rvm-prompt ]; then
  ruby_version="\n\[${txtred}\][\$(~/.rvm/bin/rvm-prompt i v p g s)] "
else
  ruby_version="\n\[${txtred}\][system] "
fi
directory="\[${txtcyn}\]\w"
git_branch="\[${txtgrn} \$(parse_git_branch) "
prompt_char="\n\[${bldcyn}\]➜  \[${txtrst}\]"
export PS1=$host_info$ruby_version$directory$git_branch$prompt_char

# Bash History
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups
#export HISTIGNORE="&:ls:ls *:lsa:lsa *:sbx:lnx:dbm"

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

# Comman Aliases
alias systail='tail -f /var/log/system.log'

# Common CD commands
alias ..='cd ..'
alias ...='cd .. ; cd ..'

# Rails Commands
alias r='rails'
alias be='bundle exec'
alias dbm='bundle exec rake db:migrate'
alias dbtp='bundle exec rake db:test:prepare'
alias guard='bundle exec guard'

# Git Aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gpush='git push'
alias gpull='git pull'

# RVM Aliases
alias gemset='rvm gemset'
alias rgl='rvm gemset list'
alias rgu='rvm gemset use'

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

# Rails\Bart Environment Settings
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

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# mkdir & cd to it
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# Source Machine Local Settings for overrides or additions
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

