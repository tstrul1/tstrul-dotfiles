#!/bin/bash

# Backup old file
echo "Press Enter to start dotfiles backup:"
read
. takeBackup.sh

echo "Press Enter to install packages (this could take a while...):"
read

# OSX Stuff
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Install homebrew binary"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "Installing xcode"
    xcode-select --install
    echo "Install brew packages"
    while read -r brew_formulae;do brew install $brew_formulae;done < Brewfile
    while read -r cask_formulae;do brew cask install $cask_formulae;done < Caskfile
fi

# Install pip
echo "Install pip binary"
curl -s https://bootstrap.pypa.io/get-pip.py | python
echo "Install pip packages"
pip install --user -r requirements.txt

# zsh antigen + oh-my-zsh
echo "Configure antigen and oh-my-zsh"
curl -L git.io/antigen > $HOME/antigen.zsh

# Create dotfiles symlinks and const dirs
echo "Press enter to create symlinks and dirs:"
read
. createSymLinks.sh
