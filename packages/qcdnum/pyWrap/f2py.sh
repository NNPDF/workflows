#!/bin/bash

MODE=2
FILES='qcdnum/usr/usrini.f qcdnum/usr/usrparams.f qcdnum/usr/usrpdf.f qcdnum/usr/usrevol.f qcdnum/usr/usrgrd.f qcdnum/usr/usrwgt.f zmstf/src/zmstfs.f zmstf/src/zmweits.f hqstf/src/hqstfs.f hqstf/src/hqweits.f'

# move back to root
cd ..

#if [ "$MODE" -eq "1" ];
# then
#  f2py3 --overwrite-signature -m QCDNUM -h pyWrap/QCDNUM.template.pyf $FILES \
#   only: qcinit setval getval setord getord setalf getalf setabr iqfrmq setcbt extpdf sumfxq gxmake gqmake wtfile nxtlun zmwords zmreadw zmfillw zmdumpw zswitch zmdefq2 zmstfun hqwords hqreadw hqfillw hqdumpw hswitch hqstfun  : ;
#fi;

if [ "$MODE" -eq "2" ];
 then
  f2py3 -m QCDNUM -c pyWrap/QCDNUM.pyf $FILES\
   `qcdnum-config --cppflags` `qcdnum-config --ldflags` -I./qcdnum/inc/ -I./zmstf/inc/ -I./hqstf/inc/ \
   --fcompiler=gfortran;
  mv QCDNUM.*.so pyWrap/
fi;
