# Dotfiles

## Creating and using homebrew bundles

create Brewfile

```bash
brew bundle dump --describe
```

install from Brewfile

```bash
brew bundle --file=~/.dotfiles/Brewfile
```

## Setup on a new machine

Automatic setup with tmux and vim for MacOS:

```bash
~/dotfiles/setup.sh
````
