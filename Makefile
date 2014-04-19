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

PATCHSTRING:=QlpoOTFBWSZTWct1qrwAAx9fgG6wff///383/////9/+YAfdd91y9Wu77Md998B6+s6xAoKvt4NCRT2oymnpqbRkJphPQnqAAAGQBoNMg2kMQZKZqJmgUNMR6hpkAAYgAA0AAAABFPQajRI21RkMEZGAIyYIyNGARiYmRiNGBJqRRQeoGmmnogaNGgyGIBo0AMgyYgANMIpI0JiMTU9U2qeJDBBoBpgNNEbU0GJpiPUPSaaBIkQFPRomGiaNMkYUxD0amRoNGhppkBoAaaacEkkxjMlBymlSmlVXbMRaQjZhSURhDDCsF51ETNUjVfvmypvLKvMABZmYq1FMk2vOkpJI6y0BjLetraEQdeajiRiATKI51GBCyeoYLuc5AS0QM5xQ2ZsIz113cF8s97iQyx09MRagA5UFvpSFKRjYNoIAYZDBDKTFRTmSoojSphkBEWSyFSqR140lB2f5B4+omSP5ggiD+pEN/sVpNLECFCEQsIFUUxxjJE1GLA4Bw8VkNW7YLMM+JwKeBgirO2eTTcfWJnwQKfSAHeQMEJ0t9OZ6xNFrHin1GK5k+Rm1oqhFX9gsxRWZ7tAQ2x8Z7dI2NtjvODFlpqx0q7tc8bRPbwqURhNtMQyTBz+TDBAGqi1FpvuXctTQg1XrDFj0tEX0rGcOfDawtC5MlSRfmlJiK7u5rwuLs9uJW6gUKpW4EVZktQJGx6ZldQs9FDEnFaJwg+yhp8QNwAoDcLnzeIpRE+VYjhbDs4CXTubKU9uBIlzLoWyFhRz5bOWa4uVq+vhCrWugkAMZV10gSNLQgKCIMDHVE10rzqaM/4QCUWmhiyQSJgbjZhVS5SQsE0BirkeYUUqEEQvIIY70EIkxsEqDh1E7DTxlCUKQwgQcp7in7eI/F6NgLxK22wIShGIWIMQelIQyUFuAw5+dl9A7/gXGeR1ci5wyHi4kavnXDVtU4AnuNCdkjYqpkZlzNwQFu2UA65FBD8Rq4pdgdDJz1niNZtgXaOiQio79uzTg445PfhSCLZd7YBzngK56+nQkdaCo5CRh4fprwJ/QZywlkK+YMfR6/XMmM2EIxdw6vDT7ssfojJ1E0zIgnZVsxKKLKR0kMr0LUYxiha7iKUkCjHuxhLxxvZCqPQuBRwAGTHYEO0XFq4hQhQunULwErU3zOKZBptMckESUoWIMiGhFRoxq57kC23jrwEQ3DtRaQAQBQK6RgzL0HGeEvtGCoIZ8ZJDwG9hBRLsFB5AaR7o8hyfmWnkFxRwPQL+yW78HTj2i+s9bcGhPtnowBmIG5nGplbSBzJ+SsiCo2oz5r87OIheZVgC0sKhf6WrnQfaGBUjVNuLkbdzXX9GRWaStQaJG1V6HsNhf5Ura4JuxGkWxHQqmjQOYs0eLf/mAdfCVLmAWKFrym8Yq4G5V6CNyDpkmWisX7dhyQ7WICUSSAHy7ta4Kty5ivBjIoxCVEIFypLKzRp02Ksk1GbSiE2OYUkgFUUgGJn3JTX4K7N4SsqkDV9TkjW/DYF5oeMO1hKA+Tm0BwpJNKyoH31Lek2gnFLSYQVVXYhyoUD14WIDzRzk1POhaRq1qd89npOvovg7dK2efTwd4AhhCBpcuJ4ZT5RjS2pHYzwm/pJ7wCR2JyQNp+tC5Pu+g9QfXho6FnWY+qo6w0dylj2wQNglVaaEGroTIKVCSEGJwGA/BzEzhmuPFjQKMREozDDNFsgSkBo9gUrfz0pAWDNTfHDy2TOFHjkFuBAzYS2kHX8kROXvUc/BzZs2P4IcXGAg33ol1VE+CmS1SvoZZgWZZcZxsQQMHDRRAf7rsfc4jC3CGn/Sx272ov2HBQDXm6Z54b+TYGLV2NiSYHlhWNFNvEFGq7GBjk8RLazOdd4Cr1jgqRvQrjyxop8urUrXDmSnCh82WK7vM0JooXFQTmLLnRsKIDdBALwBRCImIUHQIoixXf9fRkPazhG6J7vR7C5zA6VJYuXOQG7IiGsyEQBtFvniF21dgHb+w3CKlr5JSKl85I2NsXJAqTKephpmoDKqLLZ79VqGELutd6uaVRiovAmcxYGumbu4pEpJFYK0rKRJDCwwblunbNsail+w1BAhBNWl1KSBwUTUc8rx5eIQtnG6m+Hz8MB6dKRYF5mEViHSr0FbQUtTZZadDQarcFuRkfKspFQqAKGGN8dffnnyl2gzy1r0l6R8GB2uTAViPIbctTY1SbmzukkjJlwqUPI75Q2wsWIXvxJVIxrkqVBZ7mKuoRs4JCSrG0oxWnBJfFsqma23RILXulDqv7aVdayxbwniWw1uYaOvIDJibNcz5wgr4SMprJlfVWhFlBmSKqio6jP0670uHVpxlRovunOuzNXjhVFBXHIRVezyuibSbGV4Uil0Ua4iwiRcNKbhhuGLUwDAUSOaItkGYVFgxoDZD6jfMYiEVkscCaq2HQFzirUrLFIGDOZq/GlkS3CtMTEilCwhBqImO8CYhmvAAQJhXU9Blsho1VaOnXjEtCxUogUQ3xdyRThQkMt1qrwA=
SHASUM:=e1255c1d453aa37ad5b3ac0384173e26abe03842

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
