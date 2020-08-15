#!/bin/bash
echo "Creating symlinks for dotfiles"
mkdir -p  ~/Github_Projects ~/Credentials
touch ~/Credentials/aliases.zsh
ln -s ${PWD}/dotfiles/.* ~
