# Installation

Run

```
make clean
make
```

Seems like gcc-9 is not working, please use gcc-10.

To execute the original program run

```
./FONLLdis 
```


## Python bindings

Run

```sh
cd pyWrap
# activate your environment, so f2py already points to the correct thing
sh f2py.sh
pip install .
```
