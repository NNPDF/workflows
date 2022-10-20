# Build container image

Use the `Containerfile` file in this folder to build the `bench-<what>`
container image.

### Using an image

This is the easy part: you just need to download the
[image](https://github.com/N3PDF/external/pkgs/container/) and run with your
favorite container tool.

Here the explicit commands with `podman` [[1]](#docker)

```sh
podman pull ghcr.io/n3pdf/<image-name>:latest
podman run ghcr.io/n3pdf/<image-name>
```

<a name="docker">[1]</a>: to use `docker` instead you can simply replace `podman -> docker`, they have compatible subcommands

### Build an image

_Use case_: if a new external installer is added, or some external code is
updated, to receive the updates you need to regenerate the container (since they
are pre-installed in the image itself)

Update `Containerfile` (if needed [[2]](#container-update)), hen rerun:

```sh
./build.bash <folder>
podman tag <image-id> ghcr.io/n3pdf/<folder>:<version>
# login to GitHub registry with user credentials (not organization), see [3]
echo ${PAT} | podman login ghcr.io -u <username> --password-stdin
# finally publish
podman push ghcr.io/n3pdf/<folder>:<version>
# and publish the new latest (all layers already available, it's just an alias)
podman push ghcr.io/n3pdf/<folder>:latest
```

Where `<folder>` is the name of one of the subfolders in this directory.

<a name="container-update">[2]</a>: you need to update the container both to
spell out new externals, but also to upgrade python version, or other build time
dependencies (e.g. `gfortran`)
<a name="github-registry-docs">[3]</a>: official [GitHub registry
docs](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
