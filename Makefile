.PHONY: default install symlinks backup brew pip OhMyZsh xcode updateOhMyZsh list

default: list

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

install: backup pip brew xcode OhMyZsh symlinks

symlinks: 
	./createSymLinks.sh
    
backup:
	./takeBackup.sh

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	while read -r brew_formulae;do brew install $brew_formulae;done < ./Brewfile
	while read -r cask_formulae;do brew cask install $cask_formulae;done < ./Caskfile

pip:
	curl https://bootstrap.pypa.io/get-pip.py -o ./get-pip.py
	python ./get-pip.py
	pip install --user -r ./Pipfile

OhMyZsh:
	tar xvzf ./oh-my-zsh.tar.gz -C ./dotfiles/

xcode:
	xcode-select --install

updateOhMyZsh:
	./updateOhMyZsh.sh



