This project is a Vim configuration Python and Django dedicated
This repository was create  reading "Linux Magazine N°59 - Hors serie", author's article : Tristan Colombo

Installation:
    git clone https://github.com/ikarys/vim_python_django.git ~/.vim/

Create symlink:
    ln -s ~/.vim/vimrc ~/.vimrc

Install packages:
    sudo aptitude install git pep8 exuberant-ctags python-rope ruby1.8-dev rake

Switch to the '~/.vim' directory, and fetch submodules:
    cd ~/.vim
    git submodule init
    git submodule update
    git submodule foreach git submodule init
    git submodule foreach git submodule update

Compile command-t:
    cd ~/.vim/bundle/command-t
    rake make


