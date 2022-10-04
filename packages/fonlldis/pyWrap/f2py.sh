#!/bin/bash

MODE=2

# Minimal set 
#FILES='usrini.f 	usrpdf.f 	usrwgt.f 	usrcvol.f 	usrevol.f 	usrgrd.f 	zmcij.f 	zmstfs.f 	zmweits.f 	zmstf.f 	ome.f
#qcdwfun.f 	qcdwgtq.f 	qcdwgtu.f 	qcdstore.f 	qcdfast.f 	xc3ns2p.f 	xclns2p.f 	xc2sg2p.f 	xc2ns2p.f 	xclns3p.f 	xclsg2p.f  	xclsg3p.f 	xa2hgp.f 	xpij2p.f 	xpns2p.f
#cij_nlo.f 	pij_nlo.f 	pij_lo.f 	allcacf.f 	allcacf_l.f allcfcf.f 	allcfcf_l.f alleq_c_l_new.f 	alleq_c_new.f 	aaaq.f 		aaaq_l.f                                          
#qcdalf.f 	qcdutil.f 	qcdevol.f 	qcdcvol.f 	qcdgrd.f 	qcdini.f    reghard_l.f numrecipees.f 	rrreq1h.f qcdpdf.f 	qcdthrs.f 	qcdipol.f 	qcdspl.f mbits.f     
#qdumpit.f   mchar.f 	reghard.f 	wgplg.f 	rrreq1h_l.f rstegnew.f  born.f 		store.f     bmats.f 	FONLLdis.f 	usrfast.f 	usrerr.f  	utils.f 	
#egcacf.f 	egcacf_l.f 	egcfcf_l.f 	egcfcf.f 	svcacf_l_n.f 	svcacf_n.f  svcfcf_l_n.f 	svcfcf_n.f 		f2massive.f 	f2massive-subproc.f 	
#laenen.f 	vegas_p.f 	ccdisnlo_asymp.f 	asympt.f 	nnpdf-driver.f'


# Complete set 
FILES='
FONLLdis.f          cernlib.f           mchar.f             qcdpdf.f            rstegnew.f          usrini.f            xclsg3p.f
aaaq.f              		            nnpdf-driver.f      qcdspl.f            store.f             usrpdf.f            xpij2p.f
aaaq_l.f            cij_nlo.f           numrecipees.f       qcdstore.f          svcacf_l_n.f        usrwgt.f            xpns2p.f
allcacf.f           egcacf.f            ome.f               qcdthrs.f           svcacf_n.f          utils.f             zmcij.f
allcacf_l.f         egcacf_l.f          pij_lo.f            qcdutil.f           svcfcf_l_n.f        vegas_p.f           zmstf.f
allcfcf.f           egcfcf.f            pij_nlo.f           qcdwfun.f           svcfcf_n.f          wgplg.f             zmstfs.f
allcfcf_l.f         egcfcf_l.f          qcdalf.f            qcdwgtq.f           			        xa2hgp.f            zmweits.f
alleq_c_l_new.f     f2massive-subproc.f qcdcvol.f           qcdwgtu.f           					xc2ns2p.f
alleq_c_new.f       f2massive.f         qcdevol.f           qdumpit.f           usrcvol.f           xc2sg2p.f
asympt.f            			        qcdfast.f           reghard.f           usrerr.f            xc3ns2p.f
bmats.f             laenen.f            qcdgrd.f            reghard_l.f         usrevol.f           xclns2p.f
born.f              			        qcdini.f            rrreq1h.f           usrfast.f           xclns3p.f
ccdisnlo_asymp.f    mbits.f             qcdipol.f           rrreq1h_l.f         usrgrd.f            xclsg2p.f'


# LHAPDF
LHLIB=-lLHAPDF
LHLIBPATH=$(lhapdf-config --prefix)/lib

FFLAGS=-std=legacy

#move back to root
cd ..

if [ "$MODE" -eq "1" ];
 then
  f2py3 --overwrite-signature -m FONLLdis -h pyWrap/FONLLdis.t.pyf $FILES \
  only: zmstf f2massive asfunc ff2czm ff2lzm fflczm ffllzm initnnpdfwrap mkpdf;
fi;

if [ "$MODE" -eq "2" ];
 then
  f2py3 -m FONLLdis -c --fcompiler=gnu95 --opt='-std=legacy' -L$LHLIBPATH $LHLIB pyWrap/FONLLdis.template.pyf $FILES;
  mv FONLLdis.*.so pyWrap/
fi;
