#!/bin/bash

echo -e " testing and installing the vim plug "
if [ ! -f ~/.vim/autoload/plug.vim ] ; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo -e "backing up the vimrc file first"
if [ -f ~/.vimrc ] ; then
    mv ~/.vimrc ~/.vimrc.bk
fi

echo -e "download vimrc file from git hub and place"
curl -L https://raw.githubusercontent.com/masumndc1/zim/master/unix/debian/vim/vimrc_mine.txt -o ~/.vimrc

echo -e " now you can run vim, then :source % :PlugInstall to "
echo -e " install missing plugins "
echo -e "we can install a lot of plugins from https://vimawesome.com"

