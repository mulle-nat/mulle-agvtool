#
# small makefile to fix agvtool into mulle-agvtool
# just say make
#
# Coded 2014 by Nat!
# ====================
# www.mulle-kybernetik.com
#
# This makefile will regenerate itself, when changes to mulle-agvtools
# have been made
#
XCODE:=$(shell xcode-select -p)
AGVTOOL:=$(XCODE)/usr/bin/agvtool

PATCHSTRING:=QlpoOTFBWSZTWbOmBF0AAWHfgGowfP///3833+///9/+UAO+3dHa3boEru64SSKammZTTNMSYUNoAaBoj1MTTANABo0000GhKeJppoo8kekPUNAGgAGQ2oAAAAASmkmVTzTVPaFGHpTNqNQ8o9IMEepgjEMgYm0TRtQ5o0aGmEA0wJpoAyGhiANGI0MEZABIqZNJiap5pMJ6piaNNNMjTIBkaZGjQNGnqbUBokhGMYYcXOQBFKbIx5rPr/qOqJttZZENLRQQkfxqbodMq/FHvn9WSokcSLc8EQtFzgEEaoSqBEQbAUGSSREBI1pjY8I5gPYOIQjM46X6IshrDVdsJh7YdDHolzcKH5U+iPUl071UOUBgNuiV7eDzkeWFmYAn70pVRe6+NX6L92Ma3mlRCN+1PnNP0BB/7LJKmxwGMEYzQa5bqJsT5TCsr1uoxphlAlAIEiB9+SLfussugYcRSh0rkwxBmxLApjeGfwOAj3WwHmQzHrJtvJMFYhjAHwn9PVm4jZoEK4SqATGmDTBZQo2ZoRWD/lHaZoETMzPsz5Ntxe2XCltR3DYKYxeQyiM1ljzWVgGAC44zk2cWtiEdwCg1yBj3cBEpIaQZkUScrIalbsqY7UY2lnHRQBLxzwIVaD2ZEEigtwEF1VvOZ5rmbEQOAAWgURvggaJQ4DKDJWUFDju6Xg8UsHbd2RbW5q6YEwR4R86YG8MCw8YzgE9XFBeJ/WdZfn067sJ3HcuAnXS/SEKQJ2WUPKA8jKLZ6raM/QIVJQSM6U/SAvzYSBdJXXmWEiVgLCIWgqNEpRVMSWIlOCggwk/Ln6WkRSwpKSSvVGkIWC4BX75VShgiSVohTpVglCQwFqFepF140NNtzRmBE5FJVQSrEYSEyRxqsFdVScILmAvhtZWB0cB8RERRBtttuoDiAgjYaTYcugnEe0CkeC+uSbkEmgYoWUG+MYo9TYNQtJJ6Cswze4K+Vv5XKXRS4ujFLRxVdqple8ULRYdFLFNYeIqMsXLz7LSqKLBx/U3TDCypf4kc5vohEY2yQR5AjrdbPHlvexsjlyUrGO57mmATl9GqF7gtnkB1XQhAjDXYtpNjLOSGE5vnPy7bVqYOaVDnWT8VbUpMz1+xw+9haims8qqhOQDzE7E8ItkAIMEouo0s128jxX6bNkOKMFXU4UVQgMeHYdwUwxaVHanLCmpihYQ2rAismLAKcePfczlsu3AeUVBZeybhsAzeMVsSZWolMXpys1zAow4Rg8FFqXQ5TZ0kQwUkZMUVwG4gx0RWxl22bZMrnxqD4bA8A84qr0oEjjSAYLxrb+mDhgBkH2LuSKcKEhZ0wIug
SHASUM=6971720ef8ce5cc8096001c05fd89c59f9e74f1f

GZIP:=bzip2

.PHONY: clean

all:	mulle-agvtool
	@ NEWSHASUM="$(shell shasum mulle-agvtool | awk '{ print $$1 }')" ; if [ "$$NEWSHASUM" != "$(SHASUM)" ] ; then NEWPATCHSTRING=$(shell diff -u "$(AGVTOOL)" mulle-agvtool | $(GZIP) -9 | base64 ); mv Makefile Makefile.bak ; cat Makefile.bak | sed "s|^PATCHSTRING=.*|PATCHSTRING=$$NEWPATCHSTRING|" | sed "s|^SHASUM=.*|SHASUM=$$NEWSHASUM|" > Makefile; echo "Makefile updated" ; fi 

mulle-agvtool:	$(AGVTOOL) 
	cp $< $@
	chmod 755 $@
	echo $(PATCHSTRING) | base64 -D | $(GZIP) -d -c | patch $@ 

clean:	
	@- rm mulle-agvtool 2> /dev/null
	@- rm Makefile.bak 2> /dev/null
	@- echo "cleaned"
