function rvm () {
  if [[ $1 == 'use' ]]; then
    rbenv shell $2
  fi
}
