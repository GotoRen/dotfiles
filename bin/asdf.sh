#!/bin/bash -e

tools=(
  aks-engine
  ansible-base
  argo
  argocd
  awscli
  buf
  dart
  direnv
  eksctl
  fd
  flutter
  fzf
  golang
  golangci-lint
  hadolint
  helm
  helm-cr
  helm-ct
  helm-diff
  helm-docs
  helmfile
  helmsman
  heroku-cli
  jq
  jsonnet
  k9s
  kind
  ko
  kops
  kotlin
  kscript
  kube-linter
  kubectl
  kubectx
  kubeval
  kubie
  kustomize
  minikube
  mongo-tools
  mongodb
  mysql
  php
  postgres
  pre-commit
  python
  ruby
  rust
  sops
  sopstool
  sqlite
  stern
  terraform
  terraform-docs
  terraform-ls
  tflint
  yq
)

echo "🏃 Installing asdf tools in progress ..."
for tool in "${tools[@]}"; do
  asdf plugin add ${tool}
  asdf install ${tool} latest
  asdf global ${tool} latest
  if [ ${tool} = "direnv" ]; then
    asdf direnv setup --shell bash --version latest
  fi
done

asdf plugin update --all
