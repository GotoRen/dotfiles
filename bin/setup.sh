#!/bin/bash -e

DOTPATH=~/dotfiles

sh $DOTPATH/bin/brew.sh
sh $DOTPATH/bin/asdf.sh
sh $DOTPATH/bin/nvm.sh
sh $DOTPATH/bin/vscode/vscode.sh

sh $DOTPATH/bin/ln.sh
