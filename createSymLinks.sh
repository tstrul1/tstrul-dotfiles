#!/bin/bash
echo "Creating symlinks for dotfiles"
ln -s ${PWD}/dotfiles/.* ~
ln -s ${PWD}/dotfiles/* ~
