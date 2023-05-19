#!/bin/bash

curl https://raw.githubusercontent.com/GotoRen/dein.vim/release/bin/installer.sh >${HOME}/installer.sh

if [[ ! -f ${HOME}/.cache ]]; then
  mkdir ${HOME}/.cache
  sudo chmod o+w ${HOME}/.cache
fi

sh ${HOME}/installer.sh ${HOME}/.cache/dein
rm ${HOME}/installer.sh

if [[ ! -f ${HOME}/.config/nvim ]]; then
  mkdir -p ${HOME}/.config/nvim/plugins
fi
