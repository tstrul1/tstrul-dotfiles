#!/bin/bash
echo "Creating previous files backup"s
mkdir -p .dotfiles-backup/`date +%F`
for dotfile in $(ls -la1 dotfiles/);do
    mv ~/${dotfile} .dotfiles-backup/`date +%F`/${dotfile}
done
mv ~/.oh-my-zsh .dotfiles-backup/`date +%F`/
echo "Finished backing up dotfiles to .dotfiles-backup/`date +%F`"
