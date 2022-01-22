# Workflows

Collect reusable workflows, to manage repositories in the N3PDF scope.

## Limitations

### `matrix`

Unfortunately, there is a mild, but annoying, limitation for caller
jobs: the section [`strategy` is not
allowed](https://docs.github.com/en/actions/using-workflows/reusing-workflows#limitations),
and in particular the `matrix` property.

#### Circumvent

If needed, it's possible in most cases to circumvent this limitation, by
applying the `matrix` in callee workflow. This is not a solution in 100%
of cases, but in most basic ones for sure.

-   [github community
    thread](https://github.community/t/reusable-workflow-with-strategy-matrix/205676/8)

### Path

Workflows inside the repo (see
[reference](https://docs.github.com/en/actions/using-workflows/reusing-workflows#creating-a-reusable-workflow)):

-   have to be located inside `.github/workflows`
-   sub-directories are not supported

For this reason *scopes* are separated with `-`.
