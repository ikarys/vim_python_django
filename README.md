This project is a Vim configuration Python and Django dedicated

Installation:
    git clone git

Create symlink:
    ln -s ~/.vim/vimrc ~/.vimrc

Install packages:
    sudo aptitute install git pep8 exuberant-ctags python-rope ruby1.8-dev rake

Switch to the '~/.vim' directory, and fetch submodules:
    cd ~/.vim
    git submodule init
    git submodule update
    git submodule foreach git submodule init
    git submodule foreach git submodule update

Compile command-t:
    cd ~/.vim/bundle/command-t
    rake make

