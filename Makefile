PV := $(shell head -n 1 VERSION)
PACKAGE := $(word 1, $(PV))
VERSION := $(word 2, $(PV))
DISTDIR := $(PACKAGE)-$(VERSION)
BIN := $(shell cat BIN)

BINDIR = /usr/bin

all:

install:
	mkdir -p $(PREFIX)$(BINDIR)
	for bin in $(BIN); do install $$bin $(PREFIX)$(BINDIR)/$$bin; done

dist:
	mkdir $(DISTDIR)
	cp BIN Makefile NEWS VERSION $(BIN) $(DISTDIR)/
	tar -czf $(DISTDIR).tar.gz $(DISTDIR) --remove-files
