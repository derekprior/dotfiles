# Enable Colors in various scripts
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=gxhxxxxxbxxxxxBxBxGxGx
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CUCUMBER_FORMAT='pretty'

# Color Shorthand
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
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors

# Prompt Settings
if [ -f $HOME/.rvm/bin/rvm-prompt ]; then
  export PS1="\n\[${COLOR_CYAN}\][\$(~/.rvm/bin/rvm-prompt s i v p g)]\[${COLOR_CYAN}\] \w\n∴ \[${COLOR_NC}\]"
else
  export PS1="\n\[${COLOR_CYAN}\] \w\n∴ \[${COLOR_NC}\]"
fi
#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"' 

# Bash History
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:ls *:lsa:lsa *:sbx:lnx:dbm"

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
alias ls='ls -lGh'
alias la='ls -lGha'
alias finder='open .'

# Common CD commands
alias views='cd ~/code/ese-siebel-db/cmn_int/views/'
alias sbx='cd ~/code/sandbox/dprior/'
alias br='cd ~/code/bart-dev/akamai/bart-rails/'
alias ..='cd ..'
alias ...='cd .. ; cd ..'

# Rails Commands
alias r='rails'
alias dbm='rake db:migrate'

# Perforce Settings
export P4CONFIG=.perforce

# Rails\Bart Environment Settings
export REMOTE_USER=dprior

# Editors 
export VISUAL='mate -w'
export EDITOR='mate -w'

# Set Path
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH

# Oracle Client
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:~/bin/ohome/instantclient

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
  
# mkdir & cd to it
function mcd() { 
  mkdir -p "$1" && cd "$1"; 
}
