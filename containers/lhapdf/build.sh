#!/usr/bin/env bash

pushd ../..
podman build -t ghcr.io/n3pdf/lhapdf -f $(dirs -lp | head -2 | tail -1)/Containerfile .
popd
