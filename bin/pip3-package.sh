#!/bin/bash -e

packages=(
  openai
  pipenv
  pylint
  rfcbibtex
)

echo "🏃 Installing pip packages in progress ..."

pip install --upgrade pip

for package in ${packages[@]}; do
  pip install ${package}
done

pip list
