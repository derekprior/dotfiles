autoload colors && colors

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

if [ -n "$SSH_CLIENT" ]; then
  host_info="\n%{$fg[yellow]%}%m%n"
fi

if [ -d "$HOME/.rbenv/" ]; then
  ruby_version="\n%{$fg[red]%}[\$(rbenv version-name)] "
else
  ruby_version="\n%{$fg[red]%}[system] "
fi

