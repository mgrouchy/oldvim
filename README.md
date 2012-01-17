My Vim settings, mostly mostly used for python/django + html & js dev.
The only outside requirements are [Ack](http://betterthangrep.com/) and Ctags. I would suggest if you are using osx
that you install them with homebrew.

setup (on osx):

    brew install ack
    brew install ctags

    git clone git@github.com:mgrouchy/vim.git

    mv vim .vim
    cd .vim

    git submodule init
    git submodule update

    ln -s ~/.vim/gvimrc ~/.gvimrc
    ln -s ~/.vim/vimrc ~/.vimrc

And you're good to go.

Any issues or bugs, email me at mgrouchy@gmail.com

Protip: want to update all the submodules?

    git submodule foreach git pull origin master --recurse-submodules

