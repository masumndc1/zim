#!/bin/bash

echo -e " installing the vim plug if not installed "
if [ ! -f ~/.vim/autoload/plug.vim ] ; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo -e " backing up the vimrc file first "
if [ -f ~/.vimrc ] ; then
    mv ~/.vimrc ~/.vimrc.$(date +%Y%M%d)
fi

echo -e " download vimrc file from github and place it "
curl -L https://raw.githubusercontent.com/masumndc1/zim/master/unix/debian/vim/vimrc_mine.txt -o ~/.vimrc

echo -e " cleaning old Plugs and installing new "
if [ -f $(which nvim) ] ; then
  nvim -c 'PlugClean | PlugInstall | PlugUpdate | qa '
else
  vim -c 'PlugClean | PlugInstall | PlugUpdate | qa '
fi

echo -e " we can also install a lot of plugins from https://vimawesome.com "
