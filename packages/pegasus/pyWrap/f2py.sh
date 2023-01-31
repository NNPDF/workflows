#!/bin/bash

MODE=2
FILES='lh01tab.f  usrinit.f  usrinp.f  usrpinit.f usrpinp.f
Routines/ans2mom.f  Routines/asmatch.f  Routines/ens1n.f    Routines/esg2n.f    Routines/initevol.f Routines/inppmom2.f Routines/pns1pmom.f Routines/psg0pmom.f Routines/psg2mom.f  Routines/usg1mom.f
Routines/ans2pmom.f Routines/asrgkt.f   Routines/ens2n.f    Routines/evnffn.f   Routines/initinp.f  Routines/inplmom1.f Routines/lsgmom.f   Routines/psg1mom.f  Routines/psifcts.f  Routines/usg2hmom.f
Routines/asg2mom.f  Routines/betafct.f  Routines/ensg0n.f   Routines/evnfthr.f  Routines/initmom.f  Routines/inplmom2.f Routines/nparton.f  Routines/pns2mom.f  Routines/psg1pmom.f Routines/uns2mom.f  Routines/usg2mom.f
Routines/asg2pmom.f Routines/ebetafct.f Routines/esg1n.f    Routines/evnvfn.f   Routines/initpinp.f Routines/inppmom1.f Routines/pns1mom.f  Routines/pnsg0mom.f Routines/usg1hmom.f Routines/xparton.f  Routines/initpol.f'

# move back to root
cd ..

# fortran77 flags required for gcc10
#   -fallow-argument-mismatch: "Mismatches between actual and dummy argument
#		  lists in a single file are now rejected with an error"
#		  https://gcc.gnu.org/gcc-10/changes.html
#		-w: silence warnings
if [ "$MODE" -eq "1" ]; then
  f2py3 --overwrite-signature \
    -m pegasus -h pyWrap/pegasus.template1.pyf $FILES \
    only: initevol initinp xparton as betafct initpol initpinp
fi

if [ "$MODE" -eq "2" ]; then
  f2py3 --f77flags="-w -fallow-argument-mismatch" --opt="-O3" \
    -m pegasus -c pyWrap/pegasus.template.pyf $FILES --fcompiler=gnu95
  mv pegasus.*.so pyWrap/
fi
