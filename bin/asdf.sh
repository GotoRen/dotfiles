#!/bin/bash -e

tools=(
  argo
  argocd
  awscli
  direnv
  eksctl
  fd
  gcloud
  golang
  hadolint
  helm
  helm-cr
  helm-ct
  helm-diff
  helm-docs
  helmfile
  helmsman
  jq
  k9s
  ksops
  kubectl
  kubetail
  kubie
  kustomize
  php
  pre-commit
  python
  ruby
  rust
  sops
  sopstool
  terraform
  terraform-docs
  terraform-ls
  yarn
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
