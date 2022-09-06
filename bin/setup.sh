#!/bin/bash -e

DOTPATH=~/dotfiles

################################################
### Must not change the order of execution!! ###
################################################

# only macOS.
if [ "${OS_TYPE}" == "brew" ]; then
  sh $DOTPATH/bin/finder-configs.sh
fi

sh $DOTPATH/bin/brew.sh
sh $DOTPATH/bin/asdf.sh
sh $DOTPATH/bin/nvm.sh
sh $DOTPATH/bin/gcloud.sh

sh $DOTPATH/bin/vscode/vscode.sh
sh $DOTPATH/nvim/dein.sh

sh $DOTPATH/bin/ln.sh
