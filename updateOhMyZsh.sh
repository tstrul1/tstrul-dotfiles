#!/bin/bash
echo "Packing ~/.oh-my-zsh into tar.gz"
mv oh-my-zsh.tar.gz .dotfiles-backup/oh-my-zsh.tar.gz.`date +%F`
tar cvzf oh-my-zsh.tar.gz -C dotfiles .oh-my-zsh
echop "Done"