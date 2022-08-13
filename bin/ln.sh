#!/bin/bash -e

DOTPATH="${HOME}/dotfiles"
BINPATH="${DOTPATH}/bin"
VSCODEPATH="${BINPATH}/vscode"

ls -a $VSCODEPATH | grep -E '.json' | while read f; do
  ln -s $VSCODEPATH/$f $HOME/Library/Application\ Support/Code/User/$f
done

### special files.
ls -a $DOTPATH | grep -Ev "README|bin|nvim|\zsh$|vscode|\.$|^\.git$|Brewfile|LICENSE|Makefile" | while read f; do
  if [ $f = ".ssh_config"  ]; then
    sudo ln -s $DOTPATH/$f $HOME/.ssh/config
  elif [ $f = "starship.toml"  ]; then
    sudo ln -s $DOTPATH/$f $HOME/.config/$f
  else
    echo $f
    sudo ln -s $DOTPATH/$f $HOME/$f
  fi
  git config --global core.excludesfile $HOME/.gitignore_global
done
