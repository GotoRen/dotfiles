#!/bin/bash -e

export NVM_DIR=${HOME}/.nvm
source ${NVM_DIR}/nvm.sh

if (nvm --version); then
  nvm install node
else
  _error "nvm is not found."
  exit 1
fi

nvm list

packages=(
  corepack
  docsify-cli
  express
  jest
  neovim
  typescript
  vue-cli
  webpack
  webpack-cli
  yaml-lint
  yarn
)

echo "\\n🏃 Running nvm install packages..."
for package in "${packages[@]}"; do
  npm install --global ${package}
done

npm list --global
