#!/usr/bin/env bash
DIR="$PWD"

echo ">>>>>Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
brew bundle --file=Brewfile

echo ">>>>>Installing ohmyzsh"
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > tmp-ohmyzsh-install.sh
chmod +x tmp-ohmyzsh-install.sh
sh -c "./tmp-ohmyzsh-install.sh --unattended --keep-zshrc"
rm tmp-ohmyzsh-install.sh

# echo ">>>>>Installing ohmyzsh custom"
# while IFS= read -r line
# do
#   words=($line)
#   case "${words[0]}" in
#     "#####")
#       case "${words[1]}" in
#         "plugins")
#           cd ~/.oh-my-zsh/custom/plugins
#           ;;
#         "themes")
#           cd ~/.oh-my-zsh/custom/themes
#           ;;
#         *)
#           echo "Unknown category [${words[1]}] aborting..."
#           cd "$DIR"
#           exit 1
#           ;;
#         esac
#     ;;
#     "")
#     ;;
#     *)
#       echo ">>>>>Installing to $PWD"
#       git clone --depth=1 "${words[0]}"
#     ;;
#   esac
# done < ~/.dotfiles-scripts/ohmyzsh-bundle.txt
# cd "$DIR"

echo "Installation done."
exec zsh -l
