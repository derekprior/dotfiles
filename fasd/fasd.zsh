# load FASD. I dislike the default aliases. The gymnastics below
# load it up without the default aliases and cache the code for future
# shell initializations
# Return if requirements are not found.
if (( ! $+commands[fasd] )); then
  return 1
fi

fasd_cache="$HOME/.fasd-init-cache"
if [[ "${commands[fasd]}" -nt "$fasd_cache" || ! -s "$fasd_cache"  ]]; then
  # Set the base init arguments.
  init_args=(zsh-hook zsh-ccomp zsh-wcomp)

  # Cache init code.
  fasd --init "$init_args[@]" >! "$fasd_cache" 2> /dev/null
fi
source "$fasd_cache"
unset fasd_cache init_args

function fasd_cd() {
  local fasd_ret="$(fasd -d "$@")"
  if [[ -d "$fasd_ret" ]]; then
    cd "$fasd_ret"
  else
    print "$fasd_ret"
  fi
}

# the aliases I actually like:
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias j='fasd_cd -i'     # cd, same functionality as j in autojump
alias v='fasd -e vim'    # quick opening files with vim
