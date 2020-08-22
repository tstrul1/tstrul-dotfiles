## Tstrul's DotFiles

### Usage:
1. Clone & cd:

```
git clone git@github.com:tstrul1/tstrul-dotfiles.git
cd tstrul-dotfiles
```


2. Run Backup & Install script:

```
make install
OR: 
./bootstrap.sh
```

Or you can choose which tasks/installations by running

```
make
OR:
make list
```

and then run desired task:

```
make <task>
```

### Take ad-hoc backup:

```
make backup
OR:
./takeBackup.sh
```

### Update dotfiles without apps:
Run symlinks script:

```
make symlinks
OR:
./createSymLinks.sh
```
