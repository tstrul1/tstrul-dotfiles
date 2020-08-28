#!/usr/bin/env bash

# Install pip
if test ! $(which pip); then
    echo "Install pip binary"
    curl -s https://bootstrap.pypa.io/get-pip.py | python
fi
echo "Install pip packages"
pip install --user -r requirements.txt

# OSX Stuff
if [[ "$OSTYPE" == "darwin"* ]]; then
    if test ! $(which brew); then
        echo "Install homebrew binary"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
    if test ! $(which xcode-select); then
        echo "Installing xcode"
        xcode-select --install
    fi
    echo "Install homebrew packages"
    brew bundle --file ./Brewfile
fi

# Backup old file
echo "Press Enter to start dotfiles backup:"
read
. takeBackup.sh

echo "Press Enter to install packages (this could take a while...):"
read

# zsh antigen + oh-my-zsh
echo "Configure antigen and oh-my-zsh"
curl -L git.io/antigen > $HOME/antigen.zsh

# Create dotfiles symlinks and const dirs
echo "Press enter to create symlinks and dirs:"
read
. createSymLinks.sh
