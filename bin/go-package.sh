#!/bin/bash -e

packages=(
  github.com/cloudspannerecosystem/spanner-cli@latest
  github.com/cosmtrek/air@latest
  github.com/daichirata/hammer@latest
  github.com/evilmartians/lefthook@latest
  github.com/golang/mock/mockgen@latest
  github.com/google/pprof@latest
  github.com/homeport/dyff/cmd/dyff@latest
  github.com/kisielk/errcheck@latest
  github.com/pressly/goose/v3/cmd/goose@latest
  mvdan.cc/gofumpt@latest
  golang.org/x/mobile/cmd/gomobile@latest
  golang.org/x/lint/golint@latest
)

echo "🏃 Installing go packages in progress ..."
for package in ${packages[@]}; do
  go install ${package}
  which "$(echo ${package} | rev | awk '{print substr($0, index($0, "@")+1, index($0, "/")-1 -1 )}' | awk '{sub("/.*", ""); print $0;}' | rev)"
done

### go version < 1.17
legacy_packages=(
  github.com/oxequa/realize
  github.com/tools/godep
)

echo "🏃 Installing go legacy packages in progress ..."
for legacy_package in ${legacy_packages[@]}; do
  GO111MODULE=off go get -u ${legacy_package}
  which "$(echo ${legacy_package} | rev | awk '{sub("/.*", ""); print $0;}' | rev)"
done
