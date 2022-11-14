#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

wget https://raw.githubusercontent.com/Cutlets/vimrc_with_vundle/main/vimrc_c79 -O ~/.vimrc

if [ ! -d ~/.vim ] ; then
	mkdir ~/.vim
fi

if [ ! -d ~/.vim/colors ] ; then
	mkdir ~/.vim/colors
fi

wget https://www.vim.org/scripts/download_script.php?src_id=26557 -O ~/.vim/colors/jellybeans.vim

option_detect=$(grep -c "xterm-256color" ~/.bashrc)

if [ $option_detect -eq 0 ] ; then
    echo "export TERM=xterm-256color" >> ~/.bashrc
fi

echo Vundle and vimrc installed!
echo Excute ":PluginInstall in vim and restart"
