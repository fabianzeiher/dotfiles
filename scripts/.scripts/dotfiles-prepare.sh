#!/usr/bin/env bash
PREV=$PWD
cd ~/.dotfiles-scripts
DIR="$PWD"

ohmyzsh_bundle() {
  touch $1
  OUTPUT_FILE=$(realpath "$1")

  rm -rf ~/.oh-my-zsh/custom/plugins/example
  rm -rf ~/.oh-my-zsh/custom/themes/example.zsh-theme

  plugins=(~/.oh-my-zsh/custom/plugins/*)
  echo "##### plugins #####" > $OUTPUT_FILE
  for repo in "${plugins[@]}"; do
    echo "Found: $repo"
    cd $repo
    echo "$(git config --get remote.origin.url)" >> $OUTPUT_FILE
  done


  themes=(~/.oh-my-zsh/custom/themes/*)
  echo -e "\n##### themes #####" >> $OUTPUT_FILE
  for repo in "${themes[@]}"; do
    echo "Found: $repo"
    cd $repo
    echo "$(git config --get remote.origin.url)" >> $OUTPUT_FILE
  done

  cd $DIR
}

# Not rally using the oh-my-zsh bundle funstion any more.
# echo ">>>>>Bundling ohmyzsh plugins"
# ohmyzsh_bundle "./ohmyzsh-bundle.txt"

echo ">>>>>Bundling homebrew"
rm "./Brewfile"
brew bundle dump --describe

echo "Preparations done...don't forget to commit"
cd $PREV

