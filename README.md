# Dotfiles

This is a collection of dotfiles that I use to configure my shell and other
command-line tools. I use [rcm] to manage installation, which I should probably
take advantage of a bit more for host or tag-specific configuration.

[rcm]: https://github.com/thoughtbot/rcm

## What's in here?

At any given, point, there is likely to be a mix of things that are critical to
my every day workflow and things that I saw on the internet and thought were
cool and would become my next favorite thing.

### Stalwarts

- `zsh` - Not because there's nothing better, but because I'm used to it. If I
  were really cool, I'd probably be using `fish` or something.
- `vim` - As the kids would say, I'm mid at Vim. Everyone else seems to be using
  Code, especially at GitHub. I've tried to assimilate but I can't make it
  stick.
- `tmux` - In some universe, I use arch with i3, but in this Universe I'm on a
  mac and I approximate this in my development with tmux and vim-tmux-navigator.
- `fzf` - Interactive fuzzy finding that I primarily use via Vim but am trying
  to use more in other contexts as well.
- `ripgrep` - Fast searching. Still the fastest? I don't know. I haven't kept up
  since 2019, but it's fast enough for me.
- `bat` - A better `cat` that syntax highlights. I love using it to preview
  files in `fzf`.
- `gh` - The GitHub CLI. I use it extensively for managing where `git` meets
  GitHub. It's also critical for using Codespaces, which you probably don't ever
  use unless you work for GitHub.
- `starship` - Custom shell prompts, fast. More than I need or want, but it does
  something reasonable for me in every situation right out of the box and it
  looks pretty.

### Experiments

- `eza` - A replacement for `ls` that has pretty icons and colors. I was always
  an `la -la` person, but never enjoyed most of the metadata like permissions,
  user, size, etc. I'm sure I could get rid of those with `ls`, but `eza` made
  it easy and pretty. Not dialed in just yet.
- `delta` - A replacement for `git diff` that shows changes in a pleasant way. I
  have it configred for side-by-side diffs, but I think it might be a little
  much.
- `yazi` - A pretty looking terminal file manager that is mostly just demoware
  for me at this point. Probably won't stick.
- `thefuck` - A way to quickly correct that last command I messed up.
