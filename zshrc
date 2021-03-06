# makes color constants available
autoload -U colors
colors

export DOTFILES="$HOME/dotfiles"

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# Editor
export VISUAL=vim
export EDITOR=$VISUAL

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Erlang/Elixir shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# Never.
export DISABLE_SPRING=1

# Don't open new issues when project setup fails
export BOOTSTRAP_DISABLE_ISSUES=1

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# Used as base directory for my `c` command
export PROJECTS=~/src

# Load completions installed with the zsh-completions package
fpath=(/usr/local/share/zsh-completions $fpath)

# On ambiguous completion, show a list
setopt auto_list

# Immediately execute the command referenced from history expansion (e.g. !!)
unsetopt hist_verify

# use emacs keybindings on the command line
bindkey -e

# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}

setopt promptsubst
PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# completion
autoload -U compinit
compinit

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v rbenv >/dev/null; then
   eval "$(rbenv init - --no-rehash)"
fi

# ensure dotfiles bin directory is loaded first
PATH="$HOME/bin:/usr/local/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"
export -U PATH
