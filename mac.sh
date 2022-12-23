#!/bin/bash

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/charlie/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "\nInstalled Homebrew Successfully!\n"
## essential
brew install neovim
brew install tmux
brew install skhd
brew install yabai
brew install fzf
brew install ripgrep
brew install rsync
## fun
brew install cmatrix

# configs
## get dotfiles directory path
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
cp "$DIR/.config"   ~/.
cp "$DIR/.tmux"     ~/.
cp "$DIR/.skhdrc"   ~/.
cp "$DIR/.yabairc"  ~/.
cp "$DIR/.zshrc"    ~/.

# setting up nvim

# zinit & plugins
sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit load wfxr/forgit
zinit light zsh-users/zsh-autosuggestions
