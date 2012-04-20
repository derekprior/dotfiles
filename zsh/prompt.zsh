autoload -U colors && colors

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

function parse_ruby {
  if [ -d "$HOME/.rbenv/" ]; then
    echo "["$(rbenv version-name)"]"
  else
    echo "[system]"
  fi
}

if [ -n "$SSH_CLIENT" ]; then
  host_info="%m%n"
fi

export PROMPT='
%{$fg[red]%}$(parse_ruby) %{$fg[blue]%}%~ %{$fg[green]%}$(parse_git_branch) %{$reset_color%}
%{$fg[blue]%}➜  %{$reset_color%}'

