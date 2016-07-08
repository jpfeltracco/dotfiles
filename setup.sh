#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
#ln -s ${BASEDIR}/vim/ ~/.vim

# bash
ln -s ${BASEDIR}/bashrc ~/.bashrc

# tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
