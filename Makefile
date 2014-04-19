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
SHASUM:=9ca544750474ee8e09122eaa8b41ee67ece8df54

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
