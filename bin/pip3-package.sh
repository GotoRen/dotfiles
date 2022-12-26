#!/bin/bash -e

packages=(
  rfcbibtex
)

echo "🏃 Installing pip3 packages in progress ..."

pip3 install --upgrade pip

for package in ${packages[@]}; do
  pip3 install ${package}
done

pip3 list
