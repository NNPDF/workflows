# Installation

Run

```sh
autoreconf -f -i
# gcc >= 10
FFLAGS='-fallow-argument-mismatch' ./configure --prefix=$HOME/.local
# otherwise without FFLAGS
make clean
make -j4
make install
```

## Python bindings

Run

```sh
cd pyWrap
sh f2py.sh
# activate your environment
pip install .
```
