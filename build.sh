#! /bin/sh

set -e

docker build \
  --platform linux/amd64 \
  -t h1fra/isolated-vm-repro \
  .

docker push h1fra/isolated-vm-repro
