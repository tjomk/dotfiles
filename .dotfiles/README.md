### Setup

1. `git init --bare $HOME/.dotfiles`
2. Create alias for config files: `alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'`
3. `config config status.showUntrackedFiles no`

Then any local dotfile can be added to repo via regular `config add .zshrc`.

[Source](https://news.ycombinator.com/item?id=11071754)
