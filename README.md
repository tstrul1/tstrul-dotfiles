## Tstrul's DotFiles

### Usage:
1. Clone & cd:

```
git clone git@github.com:tstrul1/tstrul-dotfiles.git
cd tstrul-dotfiles
```


2. Run Backup & Install script:

```
./Install.sh
```

### Update dotfiles without apps:
Run symlinks script:

```
./createSymLinks.sh
```

## Take ad-hoc backup:

```
./takeBackup.sh
```

## Pushing changes:
If new oh-my-zsh plugins where added please make sure to recreate archive:

```
mv oh-my-zsh.tar.gz .dotfiles-backup/oh-my-zsh.tar.gz.`date +%F`
tar cvzf oh-my-zsh.tar.gz -C dotfiles .oh-my-zsh
```

Or you can just run:

```
./updateOhMyZsh.sh
```
