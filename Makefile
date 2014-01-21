#
# small makefile to patch agvtool into mulle-agvtool
# just say make
#
# Coded 2014 by Nat!
# ====================
# www.mulle-kybernetik.com
#
# This makefile will regenerate itself, when changes to mulle-agvtool
# have been made
#
XCODE:=$(shell xcode-select -p)
AGVTOOL:=$(XCODE)/usr/bin/agvtool

PATCHSTRING:=QlpoOTFBWSZTWdhvznsAAVjfgGowfP///3833+///9/+UAO+3XZztYBysMNEQp6m8qfqZE8U/VNNA09QAAA9Qep6gABo9R6n6oJREyMjU1T/RI9KejU8p6mg9JpiADNQAGQeoAAlBEpiaNBtRoHpNAA0AepkAAADTQAc0aNDTCAaYE00AZDQxAGjEaGCMgAkVMmlPEU3ommjTKBpp6jIyGjTyj1MjR6Roep6mTQNEkgvDCy79CAIpTZGOe3o/1HXE8LV+RDW/FBCS0Wquv7GujGeyiTGQix0LAQwT0ggylowQQfYXKiqtADKV4GpTGMosjCiilxhlXxIoolBK115R1u2P5pN/hMyPgRMfGfBJnlAUBsDJn2fK9p0Us2BH+qr8j6IkTm1bY338tD0C0vtVacJtEBKPyDTgtw8onAMTiQomNIZ7TlhZ2nZYxqPOBI4OSDndzRT1rlFlBBhSooyrgQEHRNBZlgWhGvGAU3b8BoKIhZG05WCsQxgDyH8M2x6zcoELAJVAJjTBphhSLrbrRtHsKt9udF9tww0XuCY4vHMjXxXfEbxYMXnL4hplJcJVgFoGU5TXCeaYh1QKTONL+C0cWjdsLilORiYfImZNpotCl+iqXoEatFx60rUKTFUchGAOku5y1ritfSgsgKGDUWuTEjiJBoHvdKlGLRwX7/mp2yzBrrv7uLZAmCOUfzTA4BgWzhGZRQW8p/SUZzOc1Fm1N1HOc6ykfKc3YEK8EdQp0TmgkXJ6rlGnQIVJQSNKU/QAuq2SBdBXXsKwiVgKwQukqOmUoqmJK6SnBQQWE/Lp6GkRSsSUklqVGsIWrgAVq0VUoYIklcEKdKsEoSGAsJXhi67yGm25ozAicikqoJViLCEyRxqsFgqpMoLOBaDHfYH2yHyERFEG2226gMwEEbbSbDl6ScR7wKR6tpck3IJNAxQt0HkGMV3HvGMxIiSQExgzwgF2iahoZUyiquS1Xd2I4MK1Gv6wEVcuSkEIzKumrXOQlr+eayXsUoyZQMdCDsCgQcbn7jgHr7Pd7qhpbI39em8PA93ZAJy0jEGpkuTyA68EIQLobrO6k7BecpQp/c2HOOaIBByEEIvC/dypBKaS3wgJuZ5Lt5gwG1sRobxFCLXJvgDUB7mK61EncpflthjIJETXuwL92UjNL3rqMJZcGrkuTatwqlQxaXBVjUoEcLj4lYr95Z2neEpJVbWo0gpwl01SaD2FVBWZzoX7cCa0YnXwbTcyxiiWRR7U1CwQfCpNBp0P7qP13bkG15RoBcqJBIzJAMOI8HDuBMMAaD/i7kinChIbDfnPYA=
SHASUM:=3a86c2093dd948668aa445eef57f79e900699bb7

GZIP:=bzip2

.PHONY: clean

all:	mulle-agvtool mulle-agvtool.diff
	@ NEWSHASUM="$(shell shasum mulle-agvtool | awk '{ print $$1 }')" ; if [ "$$NEWSHASUM" != "$(SHASUM)" ] ; then NEWPATCHSTRING=$(shell diff -u "$(AGVTOOL)" mulle-agvtool | $(GZIP) -9 | base64 ); mv Makefile Makefile.bak ; cat Makefile.bak | sed "s|^PATCHSTRING:=.*|PATCHSTRING:=$$NEWPATCHSTRING|" | sed "s|^SHASUM:=.*|SHASUM:=$$NEWSHASUM|" > Makefile; echo "Makefile updated" ; fi 

mulle-agvtool:	$(AGVTOOL) 
	cp $< $@
	chmod 755 $@
	echo $(PATCHSTRING) | base64 -D | $(GZIP) -d -c | patch $@ 

# this is used so one can look at the changes in git
# more easily 

mulle-agvtool.diff:	$(AGVTOOL) mulle-agvtool
	- diff "$(AGVTOOL)" mulle-agvtool > mulle-agvtool.diff

clean:	
	@- rm mulle-agvtool 2> /dev/null
	@- rm Makefile.bak 2> /dev/null
	@- echo "cleaned"
