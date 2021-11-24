#!/usr/bin/env bash

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

if [ -z "$(ls -A ~/.vim/bundle)" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
    # git clone https://github.com/dracula/vim.git ~/.vim/bundle/dracula
fi

vim -c PluginUpdate -c qa
