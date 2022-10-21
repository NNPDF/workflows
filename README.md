# Workflows

Collect reusable workflows, to manage repositories in the N3PDF scope.

## Which version?

`main` branch is officially **deprecated**: it won't be updated, and at some
point will be deleted.

The idea is to always use a given version, to explicitly support breaking
upgrades (that should not happen silently).

So, each version branch `v<num>` will always be compatible with former versions
of the same branch ([semver](https://semver.org/) semantic).
More specifically, various versions will be tagged for release.
Therefore:

- use `action@v<num>` in case you want the last compatible version
- use `action@v<major>.<minor>.<patch>` in case you want to pin to a single
  immutable tag

### Containers

The container (and in case other packages) provided will only have the tag
version.

## Limitations

### Path

Workflows inside the repo (see
[reference](https://docs.github.com/en/actions/using-workflows/reusing-workflows#creating-a-reusable-workflow)):

- have to be located inside `.github/workflows`
- sub-directories are not supported

For this reason _scopes_ are separated with `-`.
