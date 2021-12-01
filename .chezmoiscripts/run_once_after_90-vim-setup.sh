#!/usr/bin/env bash

if [ -z "$(ls -A ~/.vim/bundle/Vundle.vim)" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Update all plugins set in ~/.vimrc
vim -c PluginUpdate -c qa
