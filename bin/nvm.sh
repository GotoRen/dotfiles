#!/bin/bash -e

export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

if !(nvm --version); then
  nvm install node
else
  echo "nvm is already exists."
fi

nvm list

packages=(
  docsify-cli
  express
  jest
  neovim
  typescript
  vue-cli
  yarn
)

echo "Running nvm install packages..."
for package in "${packages[@]}"; do
  npm install --global ${package}
done

npm list --global
