#!/bin/bash
echo "Creating symlinks for dotfiles"
mkdir -p  ~/Github_Projects ~/Credentials
touch ~/Credentialsaliases.zsh
ln -s ${PWD}/dotfiles/.* ~
ln -s ${PWD}/dotfiles/* ~

