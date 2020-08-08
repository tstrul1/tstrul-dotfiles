#!/bin/bash
echo "Creating symlinks for dotfiles"
ln -s dotfiles/.* ~/
ln -s dotfiles/* ~/
ln -s ohmyzsh_custom ~/.oh-my-zsh/custom
