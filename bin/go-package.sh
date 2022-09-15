#!/bin/bash -e

packages=(
  github.com/golang/mock/mockgen@latest
  github.com/cloudspannerecosystem/spanner-cli@latest
  github.com/pressly/goose/v3/cmd/goose@latest
  github.com/homeport/dyff/cmd/dyff@latest
  github.com/daichirata/hammer@latest
)

echo "Running go install packages..."
for package in ${packages[@]}; do
  go install ${package}
  which "$(echo ${package} | rev | awk '{print substr($0, index($0, "@")+1, index($0, "/")-1 -1 )}' | awk '{sub("/.*", ""); print $0;}' | rev)"
done


### go version < 1.17
legacy_packages=(
  github.com/oxequa/realize
)

echo "Running go install legacy packages..."
for legacy_package in ${legacy_packages[@]}; do
  GO111MODULE=off go get -u ${legacy_package}
  which "$(echo ${legacy_package} | rev | awk '{sub("/.*", ""); print $0;}' | rev)"
done
