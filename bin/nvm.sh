#!/bin/bash -e

nvm install node

packages=(
  typescript
  vue-cli
  yarn
)

echo "Running nvm install packages..."
for package in "${packages[@]}"; do
  npm install -g ${package}
done
