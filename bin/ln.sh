#!/bin/bash -e

DOTPATH=$HOME/dotfiles

### Todo: check existence.
ln -s $DOTPATH/.zshrc $HOME/.zshrc
ln -s $DOTPATH/.gitconfig $HOME/.gitconfig
ln -s $DOTPATH/.gitignore_global $HOME/.gitignore_global

ln -s $DOTPATH/bin/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $DOTPATH/bin/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json

ln -s $DOTPATH/.ssh_config $HOME/.ssh/config

ln -s $DOTPATH/starship.toml $HOME/.config/starship.toml


# ls -a | grep -Ev "README|bin|\.$|^\.git$" | while read f; do
#   if [ $f = ".ssh_config"  ]; then
#     ln -s $f $HOME/.ssh/config
#   else
#     ln -s $f $HOME/
#   fi
# done
