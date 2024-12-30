# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias be='bundle exec'
alias rc='rails console'
alias rs='rails server'
alias ivm='vim $(fzf -m --preview "bat {} --color=always")'
alias sourcerc='source ~/.zshrc'
alias cl='clear'
alias wezkeys='wezterm show-keys'

### Path
PATH="/opt/homebrew/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH=".git/safe/../../bin:$PATH"
PATH="$HOME/.bin:$PATH"

### History
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
HISTSIZE=4096
SAVEHIST=4096


### Editor
if command -v nvim &> /dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
  alias vim=nvim
fi

### Rust
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$CARGO_HOME"
export PATH="$CARGO_HOME/bin:$PATH"

### Version Management
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
  eval "$(mise completion zsh)"
  alias tools="mise ls --current"
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
if [[ -f /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
elif command -v starship &> /dev/null; then
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
  export EZA_ICON_SPACING=2
  export EZA_ICONS_AUTO=1
  alias ls='eza --oneline --all'
fi

### thefuck
if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

### cat -> bat
if command -v bat &> /dev/null; then
  alias cat=bat
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
