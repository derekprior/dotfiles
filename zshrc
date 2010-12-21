# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="prioritized"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias la='ls -lGha'
alias finder='open .'

# Rails Commands
alias r='rails'
alias dbm='rake db:migrate'

# Postgres Stuff
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# MYSQL Stuff
alias mystart='sudo launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'
alias mystop='sudo launchctl unload -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'

# Perforce Settings
export P4CONFIG=.perforce

# Pubcookie Bypass User
export REMOTE_USER=dprior

# Set Editor
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  export VISUAL='mate -w'
  export EDITOR='mate -w'
  export P4EDITOR='mate -w'
else
  export VISUAL='pico'
  export EDITOR='pico'
  export P4EDITOR='pico'
fi

# Set Path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"