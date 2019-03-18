#!/bin/bash

apt-get install vim
apt-get install git

echo -e " installing the vim plug "
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "backing up the vimrc file first"
if [ -f ~/.vimrc ] ; then
    mv ~/.vimrc ~/.vimrc.bk
fi

echo -e "download vimrc file from git hub and place"
curl -L https://raw.githubusercontent.com/masumndc1/zim/master/unix/debian/vim/vimrc_mine.txt -o ~/.vimrc


echo -e " now you can run vim, then :source % :PlugInstall to "
echo -e " install missing plugins "

echo -e "we can install a lot of plugins from https://vimawesome.com"

