alias r='rails'
alias dbm='rake db:migrate'
alias be='bundle exec'

# JRuby
export JRUBY_OPTS=--1.9

# Use Zeus for rspec if it's running
rspec() {
  if [ -S .zeus.sock ]; then
    zeus rspec "$@"
  else
    command rspec "$@"
  fi
}
