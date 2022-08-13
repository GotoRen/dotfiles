#!/bin/bash -e

DOTPATH="${HOME}/dotfiles"
BINPATH="${DOTPATH}/bin"
VSCODEPATH="${BINPATH}/vscode"


ls -a $VSCODEPATH | grep -E '.json' | while read f; do
  echo $f
  ln -s $VSCODEPATH/$f $HOME/Library/Application\ Support/Code/User/$f
done

### special files.
ls -a ../ | grep -Ev "README|bin|nvim|zsh|vscode|\.$|^\.git$" | while read f; do
  if [ $f = ".ssh_config"  ]; then
    sudo cp $DOTPATH/$f $HOME/.ssh/config
  fi
  if [ $f = "starship.toml"  ]; then
    echo $f
    sudo ln -s $DOTPATH/$f $HOME/.config/$f
    sudo chown root $HOME/.config/$f
  fi
done
