# -*- coding: utf-8 -*-
# Installation script for python
from setuptools import setup
import pathlib

# find the shared object
so_name = pathlib.Path(__file__).parent.glob("FONLLdis.*.so")
so_name = list(so_name)[0]

setup(name='FONLLdis',
      author="",
      version='0.1',
      description='FONLLdis',
      packages=[''],
      package_data = {
          '' : [str(so_name)],
      },
)


