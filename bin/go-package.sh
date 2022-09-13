#!/bin/bash -e

packages=(
  github.com/golang/mock/mockgen@latest
  github.com/cloudspannerecosystem/spanner-cli@latest
  github.com/pressly/goose/v3/cmd/goose@latest
  github.com/homeport/dyff/cmd/dyff@latest
)

echo "Running go install packages..."
for package in "${packages[@]}"; do
  go install ${package}
  which ${package}
done


### go version < 1.16
legacy_packages=(
  github.com/oxequa/realize
)

echo "Running go install legacy packages..."
for legacy_package in "${legacy_packages[@]}"; do
  GO111MODULE=off go get -u ${legacy_package}
done
