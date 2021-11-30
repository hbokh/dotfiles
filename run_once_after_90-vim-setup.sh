#!/usr/bin/env bash

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

if [ -z "$(ls -A ~/.vim/bundle)" ]; then
  vim -c PluginUpdate -c qa
fi
