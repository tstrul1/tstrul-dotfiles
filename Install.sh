#!/bin/bash

# Backup old file
echo "Press Enter to start dotfiles backup:"
read
. takeBackup.sh

echo "Press Enter to install packages (this could take a while...):"
read

# Install homebrew
echo "Install homebrew binary"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install pip
echo "Install pip binary"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# Install Xcode
echo "Installing xcode"
xcode-select --install

# Install pip files
echo "Install pip packages"
pip install --user -r Pipfile

# Install Brew packages
echo "Install brew packages"
while read -r brew_formulae;do brew install $brew_formulae;done < Brewfile

# Install cask
echo "Install brew packages"
while read -r cask_formulae;do brew cask install $cask_formulae;done < Caskfile

# Unpack Oh-My-Zsh
echo "Unpacking Oh-My-Zsh"
tar xvzf oh-my-zsh.tar.gz -C dotfiles/

# Create dotfiles symlinks and const dirs
echo "Press enter to create symlinks and dirs:"
read
. createSymLinks.sh
