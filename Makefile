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

PATCHSTRING:=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
SHASUM:=0997867ef72c3d72bf30fda1cf918ced27f49981

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
