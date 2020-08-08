#!/bin/bash
echo "Creating symlinks for dotfiles"
ln -s dotfiles/.* ~
ln -s dotfiles/* ~
