.PHONY: default install symlinks backup brew pip zsh xcode list

default: list

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

install: backup pip brew xcode zsh symlinks

symlinks: 
	- ./createSymLinks.sh
    
backup:
	- ./takeBackup.sh

brew:
	- /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	- while read -r brew_formulae;do brew install $brew_formulae;done < ./Brewfile
	- while read -r cask_formulae;do brew cask install $cask_formulae;done < ./Caskfile

pip:
	- curl -s https://bootstrap.pypa.io/get-pip.py | python
	- pip install --user -r ./requirements.txt

zsh:
	- curl -L git.io/antigen > $HOME/antigen.zsh

xcode:
	- xcode-select --install
