#!/bin/bash

tools=(
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
  gator
  golang
  golangci-lint
  grpcurl
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
  k3d
  k6
  k9s
  kind
  ko
  konstraint
  kops
  kotlin
  krew
  kscript
  kube-linter
  kubebuilder
  kubectl
  kubectx
  kubeval
  kubie
  kustomize
  lua
  minikube
  mkcert
  mongo-tools
  mongodb
  mysql
  nova
  oci
  opa
  php
  pipectl
  pluto
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
