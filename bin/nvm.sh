#!/bin/bash -e

nvm install node

packages=(
  yarn
  vue-cli
  typescript
)

echo "Running nvm install packages..."
for package in "${packages[@]}"; do
  npm install -g ${package}
done
