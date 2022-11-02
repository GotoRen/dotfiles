#!/bin/bash

NVM_DIR=${HOME}/.nvm
source ${NVM_DIR}/nvm.sh

if !(command -v nvm); then
  _error "nvm is not found."
  exit 1
else
  echo "😇 nvm already exists."
  nvm --version
  nvm install node
fi

nvm list

packages=(
  corepack
  docsify-cli
  express-generator
  jest
  neovim
  prometheus-api-metrics
  typescript
  vue-cli
  webpack
  webpack-cli
  yaml-lint
  yarn
)

echo -e "\n🏃 Running nvm install packages..."
for package in "${packages[@]}"; do
  npm install --global ${package}
done

npm list --global
