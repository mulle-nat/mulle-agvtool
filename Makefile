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
SHASUM:=51fbce010335dd437260052688d49659599f5bef

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
