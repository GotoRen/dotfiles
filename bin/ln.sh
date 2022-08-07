#!/bin/bash -e

DOTPATH=~/dotfiles

### Todo: check existence.
ln -s $DOTPATH/.zshrc ~/.zshrc
ln -s $DOTPATH/.gitconfig ~/.gitconfig
ln -s $DOTPATH/.gitignore_global ~/.gitignore_global
ln -s $DOTPATH/bin/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
