# Rails
alias r='rails'
alias tl='tail -f log/development.log'
alias dbm='rake db:migrate'

# Bundler
alias b='bundle'
alias be='bundle exec'

# JRuby
export JRUBY_OPTS=--1.9

# Tests
alias cuc="bundle exec cucumber"

# Use Zeus for rspec if it's running
rspec() {
  if [ -S .zeus.sock ]; then
    zeus rspec "$@"
  else
    command rspec "$@"
  fi
}
