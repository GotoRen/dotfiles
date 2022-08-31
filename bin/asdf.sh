#!/bin/bash -e

tools=(
  aks-engine
  argo
  argocd
  awscli
  direnv
  dyff
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
  janet
  jq
  jsonnet
  k9s
  kind
  kscript
  ksonnet
  ksops
  kubectl
  kubetail
  kubie
  kustomize
  minikube
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
