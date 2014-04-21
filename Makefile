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

PATCHSTRING:=QlpoOTFBWSZTWeUGAwcAAydfgG6wff///383///////+YAgdZ93d0EozPe+A+bbfb6oBKpPe8JRETKaeoeiDaaCNDJ6EANAAAGg0A000GgkkEYQJNkIaaTU0ybUbRHlDQNAaaAAGjQNBRJ4SNAAGQA0AAGQAAAAAAAkSSjagAAAAAAaAABoAAANACKUpvQp5KfoyU8nqhoAAGgB6g9QDRpoaGj1DJoAkSEJplM1NBiDJkk0PSejUZqBjUPU0aAAAPSaTiSVwNWjB2zhtkOG2233FYSSE5NEMhFGKON87cLGMwU7DblxXW4f9hW3AH1VTMptdTPdvUWXpkD4508KapMxjq8z2sdYM6dj3zcQ1WUgrPBXiIysLfxbSqz3OzlK+7J+eTOeNg1Gt7znVQAdpBX60hPeKQzgQBUkURkZjgh6VCbGOG2VJAxjfimrKdtTomr0lBp04NnKJiR7QQRB7yIb8ydJpVyBOnk9xg2Nn1ZT9rPWTOLRtbdYekkEwGJVgGzRREqQ7vC2uci/9ELTkA8qGEa65u9+70sju+f99OaHQy0UnDpa35yz+gWYpiN6/fCG2PiPXwDY22PKY78tVe5UrtnO7mMMuzfOqoutuCwyLrO5O20hFo7I6WVj4/XxmLJ3Q+N3g6jXgwxxZ7eDBQLkw+wcY63vZIld08e24uzpeqbgTlbGHHTc/DYNc92L+eJHLl5XtkbqVLf7TLP5RdYJhdarY3ElNLRdCbjqsswpv+Tqdv8O53clh4iUSQ9tlI+jVdKfT935TjCFbbwVyjXyIL4KAwmKDx9dje23PlFcvf87DcG4cDTaSGJlHMcmiIUyGIkB0tdA0xtzPQKK1CDJKS84hjyqaJImxsEqjXxkKm3mHoeAwMhDHzHo3tHseeVcJIS5klOgghtNCaaYNGxIRvNDcwGjl26dR5OtvhPifZhMtEclyiHPbMPhlCrGek9teATkRCw0TNVEDc3JsA8UihD6zPpl7wd9k56DrNAw2mqDpBiI8a0uhFFENoq1lSJ4EK7X0Cqa49XjkykQmiPCpSGk61zPxDnIZBLGwj+aFa/faTBSgMEsEjmiyDtZKxdAimMBRnLkrOw5Ohr5sGjqQZ498SxcLkOWEzt+S9NSfiqzGF5VDDq3CZ0EFj6RTl1NfAq1kJRxeVBs2i5ygeYB60kUoylIQbU44JhAMB8mklKWWryKCbcUREIQURR8e/AgJC4UxtdZsPxXrEyKkKjbJINwtbBkookjZBwDnHQaNoqNkXGjiNwX5JVrQc6OAXdN1rDKSzm5iBkIF7KNVmqwAaU9qsxBOXIy04clOuQulVgCopJxfws+8g8AYidGeTWVo1XtFGxaUGWapB1Ji5Vzb5YYdtKGiCTYjgFpRyk8kdQcgskdfW+8A8LjE65AClQqDtHDMauIvVcyNaDltS3KrGG6w8sNzEBNEyQA7dt9i41XCuQV4tsxKwWUyDyVboKs2bVVhJqM3AiE2OYVEgFWTAMpm+CKJaq7N4RWVQCq8KwQq1rsC43ztDyZFAH3vVAGJJKOnww2nC9dKbiOwFXkgoA2mmiwQQFJAzMYNge+N4kpofgFHfJoiIcJFeNTxm/8zr3rXnnePtVbABnYQKGoS5r3nzGkY0tSR42dZs9knsAJHjTkgbbKaFgdfCeAclxbZCtVaFLknKIW+bQY8CEOZG1KTC6qP84z8KU+VGimSHosMF131mQTUvDBqlVGqooZotnMEpgb/cE1zd6oXyNCVozQ3yQ922ZmR8bwrkMKKZFYAsOlmi7kf5+XzZqKb9hlksmBhty5THVKfFOEqoukozAWYYeY8ybGJnHKTDuvsXqWUTJVEGn/Oy4s5l2ByPBW61pr147dSkGSs7MBzJkwvQ0mNFV2PSFVM999YG5N7hLUzeOrKAsWgcFaNiFuHbG/V2586tcOZKcKHswiy7axJoos1CcxYb4a3xlUBKCAXUFIRExCg9gRSksSu9WSrKf8zdG6T1/X3F7mB31JXmveIDmyohrBCIA5Rc07xc6u4Q5/pNYitaOSUitfKSOJti5IFUYH5sOAmoDBUxWz5s9qGELoa8Fk0qy+mQCZsMQaKpu7TIlJIsBWlhMRAmk0zOljpbRWKomuoxAxAygBNYkiQOCk1HelkHhpELi43W3u+ndgPs2JEwxNYiQhrFigkyCxlBidDusg3U2rtIybnWodaKIEcnBtydvp7ENNZhsKPovsMUj2dp2+baLEjznLhW2MKjW2dBJIyvDhrUPK8koxRDCFeLw874KSMVwkolOnCVojfc9JKQzMwnY0KvXub7YGlt0kFr5nJuvJzpWWLddvGdiVheGYOBX4AYJ0UUtZ3wYt3jap2JPT7rd00IrYZpErpkzvGnqVvS4t2zEtNMroQlO+WDlaokncBrLlHVVoqBHBPuCIkY3K+6ItHBcKiM4mrRPqyBITd9tqnee0qGxXMW0qodi9d5jMfOpXCWem26svcV6FixKQMGc8N9uNbl5Y1lkClCPEmQpGC/Ag1kPsBOVgkQAqDenxF20jPiIz6MbgySJEKBBAj/F3JFOFCQ5QYDBw=
SHASUM:=5925598f3d0722bdd92d6e45bd6ce67b440c8fd3

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
