### ENV
export CLICOLOR=1
export VISUAL=vim
export EDITOR=vim
export CODE="$HOME"/src

### Custom completions
fpath=("$HOME"/.zsh/completion $fpath)
autoload -U compinit
compinit

### Custom functions
for file in $(find "$HOME"/.zsh/functions -maxdepth 1); do
  source $file
done

### Aliases
alias dotfiles='cd "$HOME"/dotfiles'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias be='bundle exec'
alias rc='rails console'
alias rs='rails server'
alias ivm='vim $(fzf -m --preview "bat {} --color=always")'
alias resource='source ~/.zshrc'

### Path
PATH="/opt/homebrew/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH=".git/safe/../../bin:$PATH"

### Version Management
if command -v frum &> /dev/null; then
  eval "$(frum init)"
fi

### fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --exclude .git . "$1"
}

### Prompt
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

### Yazi
if command -v yazi &> /dev/null; then
  function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  }
fi

### eza
if command -v eza &> /dev/null; then
  alias ls='eza --color=always --icons=always --long --all --git --no-permissions --no-filesize --no-time --no-user'
fi

### thefuck
if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

### Codespaces
if [[ -n "$CODESPACES" ]] ; then
  gh config set browser "rdm open"
  git config --global gpg.program "/.codespaces/bin/gh-gpgsign"

  alias pbcopy="rdm copy"
  alias open="rdm open"
  alias xdg-open="rdm open"
else
  if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
  fi
fi
