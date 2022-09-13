#!/bin/bash -e

DOTPATH=$HOME/dotfiles

################################################
### Must not change the order of execution!! ###
################################################

# TODO: only macOS: Finder conf.
sh $DOTPATH/bin/finder-configs.sh

sh $DOTPATH/bin/brew.sh
sh $DOTPATH/bin/asdf.sh
sh $DOTPATH/bin/nvm.sh
sh $DOTPATH/bin/gcloud.sh
sh $DOTPATH/bin/go-package.sh

sh $DOTPATH/bin/vscode/vscode.sh
sh $DOTPATH/nvim/dein.sh

sh $DOTPATH/bin/ln.sh

# TODO: only macOS: PATH conf
sh $DOTPATH/bin/multi-arch.sh
