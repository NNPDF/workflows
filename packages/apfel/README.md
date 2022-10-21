# APFEL: A Partonic Function Evolution Library

My fork of APFEL, just to store the working installation for my system

## Fixes

- replaced all the shebang containing `python` with `python2`

# Install instructions

## Dependencies

- `swig`

## Install for python2

Uncomment in `configure.ac` the `python_incpath` definition for `python2`, then:

```shell
autoreconf -f -i
chmod +x configure
PYTHON=$(which python2) ./configure --prefix=$HOME/.local
make clean
make #-j4
make install
```

## Install for python3

Uncomment in `configure.ac` the `python_incpath` definition for `python3`, then:

```shell
autoreconf -f -i
PYTHON=$(which python3) ./configure --prefix=$HOME/.local
make clean
make #-j4
make install
```

---

## Description

APFEL is a library to perform the combined QCD+QED DGLAP
evolution of parton distributions. It is written and maintained
by Valerio Bertone (CERN), Stefano Carrazza (Milano) and Juan Rojo (CERN).

## Manual and Instructions:

    http://apfel.hepforge.org/
    https://github.com/scarrazza/apfel

## APFEL Web:

    http://apfel.mi.infn.it
