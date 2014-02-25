autoload -U colors && colors

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

function parse_ruby {
  if which rbenv > /dev/null; then
    echo "[`rbenv version | sed -e 's/ .*//'`]"
  else
    echo "[unsure]"
  fi
}

function parse_client {
  if [[ -n "$SSH_CLIENT" ]]; then
    echo "$(hostname -s) "
  fi
}

if [ -n "$SSH_CLIENT" ]; then
  host_info="%m%n"
fi

export PROMPT='
%{$fg[red]%}$(parse_ruby) %{$fg[blue]%}%~ %{$fg[green]%}$(parse_git_branch) %{$reset_color%}
%{$fg[green]%}$(parse_client)%{$fg[blue]%}➜  %{$reset_color%}'
