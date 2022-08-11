#!/bin/bash -e

tools=(
  fd
  golang
  kubectl
  kubie
  pre-commit
  k9s
  terraform
  awscli
  helm
  sops
  kustomize
  argo
  argocd
  jq
  yq
  kubetail
  terraform-docs
  hadolint
  terraform-ls
  ruby
  direnv
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