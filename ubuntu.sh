#!/bin/sh
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt upgrade
sudo apt-get install \
    zsh \
    neovim \
    tmux \
    rync \
-y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy configs
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
