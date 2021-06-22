#!/bin/bash

set -eux

cd $(dirname $0)

rm -rf dist
mkdir -p dist

_build() {
    GOOS=$1 GOARCH=$2 CGO_ENABLED=0 go build -o dist/gcoredl-$1-$2
}

_build windows amd64
_build linux amd64
_build linux arm64
_build darwin amd64
_build darwin arm64
