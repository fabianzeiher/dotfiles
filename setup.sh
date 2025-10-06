#!/usr/bin/env bash
cd ~

echo ">>>>>Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"

echo ">>>>>Installing core packages"
brew install stow tmux fzf fd bat starship ripgrep zsh-autosuggestions zsh-syntax-highlighting

echo ">>>>>Setting up zsh"
stow ~/.dotfiles/zsh
echo "Installing ohmyzsh"
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > tmp-ohmyzsh-install.sh
chmod +x tmp-ohmyzsh-install.sh
sh -c "./tmp-ohmyzsh-install.sh --unattended --keep-zshrc"
rm tmp-ohmyzsh-install.sh

echo ">>>>>>Setting up vim"
stow ~/.dotfiles/vim
# Install vim-plug if it doesn't exist
if [ ! -d "$HOME/.vim/plugged" ]; then
  echo "Installing vim-plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install Vim plugins
echo "Installing Vim plugins..."
vim +PlugInstall +qall
echo "Vim plugins installed successfully."

echo ">>>>>>Setting up tmux"
stow ~/.dotfiles/tmux

echo "Dotfiles setup done."
exec zsh -l
