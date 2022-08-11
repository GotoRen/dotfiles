#!/bin/bash -e

DOTPATH=$HOME/dotfiles
VSCODEPATH=$DOTPATH/bin/vscode

ls -a $VSCODEPATH | grep -E '.json' | while read f; do
  echo $f
  ln -s $VSCODEPATH/$f $HOME/Library/Application\ Support/Code/User/$f
done

ls -a ../ | grep -Ev "README|bin|nvim|zsh|vscode|\.$|^\.git$" | while read f; do
  if [ $f = ".ssh_config"  ]; then
    ln -s $f $HOME/.ssh/config
  fi
  if [ $f = "starship.toml"  ]; then
    ln -s $f $HOME/.config/$f
  fi
done
