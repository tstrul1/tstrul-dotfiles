.PHONY: default install symlinks backup brew pip zsh xcode list

default: list

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

install: pip xcode brew backup zsh symlinks

symlinks: 
	- ./createSymLinks.sh
    
backup:
	- ./takeBackup.sh

brew:
	- /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	- brew bundle --file ./Brewfile

pip:
	- curl -s https://bootstrap.pypa.io/get-pip.py | python
	- pip install --user -r ./requirements.txt

zsh:
	- curl -L git.io/antigen > $HOME/antigen.zsh

xcode:
	- xcode-select --install
