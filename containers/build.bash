#!/usr/bin/env bash

pushd ..
podman build -t ghcr.io/n3pdf/$1 -f containers/$1/Containerfile .
popd
