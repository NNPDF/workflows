# APFEL++: A PDF evolution library in C++

## Dependencies

- `pybind11`

## Installation

```shell
cd apfelxx
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/your/installation/path/ ..
make && make install
```

---

## Description

APFEL++ is a C++ rewriting of the Fortran 77 evolution code APFEL. 
However, APFEL++ is based on a completely new code design and guarantees a better performance along with a more optimal memory management.
The new modular structure allows for better maintainability and easier extensibility. 
This makes APFEL++ suitable for a wide range of tasks: from the solution of the DGLAP evolution equations 
to the computation of deep-inelastic-scattering (DIS) and single-inclusive-annihilation cross sections.
Also more complex computations, such as differential semi-inclusive DIS and Drell-Yan cross sections, are easily implementable in APFEL++.
It is written and maintained by Valerio Bertone.

## Manual and Instructions:
    
    https://vbertone.github.io/apfelxx/html/index.html
    https://arxiv.org/pdf/1708.00911.pdf
