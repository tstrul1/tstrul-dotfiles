#!/bin/bash
echo "Creating previous files backup"s
mkdir .dotfiles-backup
for dotfile in $(ls -la1 dotfiles/);do
    mv ~/${dotfile} .dotfiles-backup/${dotfile}
done
mv ~/.oh-my-zsh/custom .dotfiles-backup/
echo "Finished backing up dotfiles to .dotfiles-backup"
