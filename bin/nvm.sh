#!/bin/bash

NVM_DIR=${HOME}/.nvm
source ${NVM_DIR}/nvm.sh

if (command -v nvm); then
  echo "😇 nvm already exists."
  nvm --version
  nvm install node
else
  _error "nvm is not found."
  exit 1
fi

nvm list

packages=(
  corepack
  docsify-cli
  express-generator
  jest
  neovim
  prometheus-api-metrics
  serve
  tsm
  typescript
  spaceship-prompt
  vue-cli
  webpack
  webpack-cli
  yaml-lint
  yarn
)

echo "🏃 Installing nvm packages in progress ..."
for package in "${packages[@]}"; do
  npm install --global ${package}
done

npm_packages=(
  pnpm
)

echo "🏃 Installing npm packages in progress ..."
for npm_package in "${npm_packages[@]}"; do
  npm install --global ${npm_package}
done

npm list --global
npm version
