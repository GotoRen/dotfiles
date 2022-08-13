#!/bin/bash -e

tools=(
  argo
  argocd
  awscli
  direnv
  fd
  golang
  hadolint
  helm
  jq
  k9s
  kubectl
  kubetail
  kubie
  kustomize
  php
  pre-commit
  python
  ruby
  sops
  terraform
  terraform-docs
  terraform-ls
  yq
)

echo "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

echo "Running asdf install tools..."
for tool in "${tools[@]}"; do
  asdf plugin add ${tool}
  asdf install ${tool} latest
  asdf global ${tool} latest
  if [ $tool = "direnv"  ]; then
    asdf direnv setup --shell bash --version latest
  fi
done

asdf update
