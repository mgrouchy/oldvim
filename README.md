#My Vimfiles
This is the newest version of my vimfiles. There were a number of things that were causing lots of
performance problems in large files and when scrolling in medium size files or larger. Those are
solved now and we are living with a slightly more stripped down vim configuration.


#Get started

###Clone this repo

```
	git clone git@github.com:mgrouchy/vim.git .vim
```

### Install requirements

```
	brew install macvim  # if you don't have a vim installed
	brew install ack
	brew install ctags
```

### Symlink vimfiles

```
	ln -s .vim/.vimrc ~/.vimrc
	ln -s .vim/.gvimrc ~/.gvimrc
```

### update submodules

```
	git submodule init
	git submodule update
```


# Updating submodules

```
	git submodule foreach git pull origin master --recurse-submodules
```
