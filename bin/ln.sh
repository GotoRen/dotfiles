#!/bin/bash -e

DOTPATH=${HOME}/dotfiles
BINPATH=${DOTPATH}/bin
VIMPATH=${DOTPATH}/nvim
VSCODEPATH=${BINPATH}/vscode
KARABINER=${BINPATH}/karabiner
XDG_CONFIG_HOME=${HOME}/.config
SSH_PATH=${HOME}/.ssh

### bin/vscode
ls -a ${VSCODEPATH} | grep -E ".json" | while read f; do
  ln -snfv ${VSCODEPATH}/$f ${HOME}/Library/Application\ Support/Code/User/$f
done
ln -snfv ${VSCODEPATH}/md-preview.css ${HOME}/.vscode/extensions/bierner.markdown-preview-github-styles-0.2.0/base.css

### bin/karabiner
# ls -a ${KARABINER} | grep -E ".json" | while read f; do
#   ln -snfv ${KARABINER}/$f ${XDG_CONFIG_HOME}/karabiner/$f
# done
ln -snfv ${KARABINER}/karabiner.json ${XDG_CONFIG_HOME}/karabiner/karabiner.json
ln -snfv ${KARABINER}/discord-enter-modification.json ${XDG_CONFIG_HOME}/karabiner/assets/complex_modifications/discord-enter-modification.json

### nvim/*.vim
ls -a ${VIMPATH} | grep -Ev "\.$|.sh|plugins" | while read f; do
  ln -snfv ${VIMPATH}/$f ${XDG_CONFIG_HOME}/nvim/$f
done
ls -a ${VIMPATH}/plugins | grep -Ev "\.$" | while read f; do
  ln -snfv ${VIMPATH}/plugins/$f ${XDG_CONFIG_HOME}/nvim/plugins/$f
done

### Other: special files.
ls -a ${DOTPATH} | grep -Ev "README|bin|nvim|\zsh$|vscode|\.$|^\.git$|iterm|Brewfile|LICENSE|Makefile" | while read f; do
  if [ $f = ".ssh_config" ]; then
    if [ ! -d ${SSH_PATH} ]; then
      echo "🔨 Cleate .ssh directory."
      mkdir ${SSH_PATH}
    fi
    # sudo ln -sv ${DOTPATH}/$f ${SSH_PATH}/config
    sudo cp -nv ${DOTPATH}/$f ${SSH_PATH}/config
  elif [ $f = "starship.toml" ]; then
    sudo ln -snfv ${DOTPATH}/$f ${XDG_CONFIG_HOME}/$f
  else
    sudo ln -snfv ${DOTPATH}/$f ${HOME}/$f
  fi
  git config --global core.excludesfile ${HOME}/.gitignore_global
done

### - Java
sudo ln -snfv $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
