#!/bin/bash

SCRIPT_DIR=$(
  cd $(dirname $0)
  pwd
)

echo "\\n🏃 Running vscode install tools..."

while read line; do
  code --install-extension $line
done <${SCRIPT_DIR}/vscode-extension.txt

code --list-extensions --show-versions
