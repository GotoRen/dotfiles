#!/bin/bash -e

DOTPATH="${HOME}/dotfiles"
BINPATH="${DOTPATH}/bin"
VIMPATH="${DOTPATH}/vim"
VSCODEPATH="${BINPATH}/vscode"

### /bin/vscode
ls -a $VSCODEPATH | grep -E ".json" | while read f; do
  ln -snfv $VSCODEPATH/$f $HOME/Library/Application\ Support/Code/User/$f
done
ln -snfv $VSCODEPATH/md-preview.css $HOME/.vscode/extensions/bierner.markdown-preview-github-styles-1.0.1/dist/base.css

### /vim
ls -a $VIMPATH | grep -Ev "\.$|.sh|plugins" | while read f; do
  ln -snfv $VIMPATH/$f $HOME/.config/nvim/$f
done
ls -a $VIMPATH/plugins | grep -Ev "\.$" | while read f; do
  ln -snfv $VIMPATH/plugins/$f $HOME/.config/nvim/plugins/$f
done

### special files.
ls -a $DOTPATH | grep -Ev "README|bin|vim|\zsh$|vscode|\.$|^\.git$|Brewfile|LICENSE|Makefile" | while read f; do
  if [ $f = ".ssh_config"  ]; then
    sudo ln -snfv $DOTPATH/$f $HOME/.ssh/config
  elif [ $f = "starship.toml"  ]; then
    sudo ln -snfv $DOTPATH/$f $HOME/.config/$f
  else
    sudo ln -snfv $DOTPATH/$f $HOME/$f
  fi
  git config --global core.excludesfile $HOME/.gitignore_global
done
