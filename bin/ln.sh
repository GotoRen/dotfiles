#!/bin/bash -e

DOTPATH=~/dotfiles

### Todo: check existence.
ln -s $DOTPATH/.zshrc ~/.zshrc
ln -s $DOTPATH/.ssh_config ~/.ssh/config
ln -s $DOTPATH/.gitconfig ~/.gitconfig
ln -s $DOTPATH/.gitignore_global ~/.gitignore_global
ln -s $DOTPATH/starship.toml ~/.config/starship.toml
ln -s $DOTPATH/bin/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $DOTPATH/bin/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
