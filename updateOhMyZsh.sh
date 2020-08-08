#!/bin/bash
mv oh-my-zsh.tar.gz .dotfiles-backup/oh-my-zsh.tar.gz.`date +%F`
tar cvzf oh-my-zsh.tar.gz -C dotfiles .oh-my-zsh
