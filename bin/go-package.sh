#!/bin/bash -e

packages=(
  github.com/cloudspannerecosystem/spanner-cli@latest
  github.com/daichirata/hammer@latest
  github.com/evilmartians/lefthook@latest
  github.com/golang/mock/mockgen@latest
  github.com/google/pprof@latest
  github.com/goreleaser/goreleaser/v2@latest
  github.com/homeport/dyff/cmd/dyff@latest
  github.com/kisielk/errcheck@latest
  github.com/mattn/goveralls@latest
  github.com/pressly/goose/v3/cmd/goose@latest
  github.com/reviewdog/reviewdog/cmd/reviewdog@latest
  go.k6.io/xk6/cmd/xk6@latest
  golang.org/x/lint/golint@latest
  golang.org/x/mobile/cmd/gomobile@latest
  google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
  google.golang.org/protobuf/cmd/protoc-gen-go@latest
  mvdan.cc/gofumpt@latest
  github.com/cosmtrek/air@latest
)

echo "🏃 Installing go packages in progress ..."
for package in ${packages[@]}; do
  go install ${package}
  which "$(echo ${package} | rev | awk '{print substr($0, index($0, "@")+1, index($0, "/")-1 -1 )}' | awk '{sub("/.*", ""); print $0;}' | rev)"
done

### go version < 1.17
legacy_packages=(
  github.com/globusdigital/deep-copy
  github.com/google/wire/cmd/wire
  github.com/oxequa/realize
  github.com/tools/godep
)

echo "🏃 Installing go legacy packages in progress ..."
for legacy_package in ${legacy_packages[@]}; do
  GO111MODULE=off go get -u ${legacy_package}
  which "$(echo ${legacy_package} | rev | awk '{sub("/.*", ""); print $0;}' | rev)"
done
