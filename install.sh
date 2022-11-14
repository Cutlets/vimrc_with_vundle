#!/bin/bash

if which git > /dev/null; then
    echo "GIT already installed"
else
    sudo yum install -y git
fi

if which wget > /dev/null; then
    echo "WGET already installed"
else
    sudo yum install -y wget
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo Vundle already installed..
fi

if [ ! -e ~/.vimrc ]; then
    wget https://raw.githubusercontent.com/Cutlets/vimrc_with_vundle/main/vimrc_c79 -O ~/.vimrc
else
    cat ~/.vimrc > vimrc_backup.bak
    wget https://raw.githubusercontent.com/Cutlets/vimrc_with_vundle/main/vimrc_c79 -O ~/.vimrc
fi

if [ ! -d ~/.vim ] ; then
	mkdir ~/.vim
fi

if [ ! -d ~/.vim/colors ] ; then
	mkdir ~/.vim/colors
fi

if [ ! -e ~/.vim/colors/jellybeans.vim ]; then
    wget https://www.vim.org/scripts/download_script.php?src_id=26557 -O ~/.vim/colors/jellybeans.vim
else
    echo Jellybeans colorschema already installed...
fi

option_detect=$(grep -c "xterm-256color" ~/.bashrc)

if [ $option_detect -eq 0 ] ; then
    export TERM=xterm-256color
    echo "export TERM=xterm-256color" >> ~/.bashrc
fi

echo Vundle and vimrc installed!
echo Excute \":PluginInstall\" in vim and restart
