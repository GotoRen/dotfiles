#!/bin/bash -e

rakes=(
  debase
  debride
  faster
  reek
  rubocop
  ruby-debug-ide
  ruby-lint
)

echo "🏃 Installing gem rakes in progress ..."
for rake in "${rakes[@]}"; do
  gem install ${rake}
done

gem list --local
