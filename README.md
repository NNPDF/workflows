# Workflows

Collect reusable workflows, to manage repositories in the N3PDF scope.

## `matrix`

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
