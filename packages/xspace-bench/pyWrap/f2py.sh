#!/bin/bash

MODE=2

# Complete set 
FILES='
src/cc_dis.f           src/integrands_cc.f    src/xcoeffunc_cc.f     src/xcoeffunc_nc_wrp.f
src/dgauss.f           src/integrands_nc.f    src/xcoeffunc_cc_wrp.f src/xpdfs.f
src/dis_xsec.f         src/nc_dis.f           src/xcoeffunc_nc.f 	 test.f'


# LHAPDF
LHLIB=-lLHAPDF
LHLIBPATH=$(lhapdf-config --prefix)/lib

#move back to root
cd ..

if [ "$MODE" -eq "1" ];
 then
  f2py3 --overwrite-signature -m xspace_bench -h pyWrap/xspace_bench.template.pyf $FILES \
  only: cc_dis nc_dis ;
fi;

if [ "$MODE" -eq "2" ];
 then
  f2py3 -m xspace_bench -c --fcompiler=gnu95 --opt='-std=legacy' -L$LHLIBPATH $LHLIB pyWrap/xspace_bench.template.pyf $FILES;
  mv xspace_bench.*.so pyWrap/
fi;
