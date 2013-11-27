export EDITOR=vim
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export GHI_PAGER=less

# GC Settings that made my tests go faster
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

fpath=($DOTFILES/zsh/functions $fpath)
fpath=($DOTFILES/zsh/completions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -U $DOTFILES/zsh/functions/*(:t)
autoload -U $DOTFILES/zsh/completions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt AUTO_CD

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# Automatically use pushd
setopt AUTOPUSHD
export DIRSTACKSIZE=8

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# Disable autocorrect
unsetopt correct_all
unsetopt correct

# Allow [ or ] whereever you want
unsetopt nomatch

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
