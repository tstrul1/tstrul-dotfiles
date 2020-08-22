#!/usr/bin/env bash
echo "Creating symlinks for dotfiles"
mkdir -p  ~/Github_Projects ~/Credentials
touch ~/Credentials/aliases.zsh
for dotfile in $(ls -d1 ${PWD}/dotfiles/.*); do
    if [[ $dotfile != "${PWD}/dotfiles/." ]] && [[ $dotfile != "${PWD}/dotfiles/.." ]]; then
        ln -s ${dotfile} ~
    fi
done
echo "Finished creating symlinks for dotfiles"
