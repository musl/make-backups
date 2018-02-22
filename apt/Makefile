KEYS       := apt-key-backup.asc
SELECTIONS := dpkg-selections
ARCHIVE    := $(CURDIR)/apt-backup-$(shell date "+%Y%m%d-%H%M%S.tar.bz2")

APT_KEY    := $(shell which apt-key)
DPKG       := $(shell which dpkg)

.PHONY: all clean

all: check_uid $(ARCHIVE) clean

check_uid:
ifeq ("$(shell id -u)", "0")
	$(error Please run this as your user account)
endif

clean:
	/bin/rm -f $(KEYS) $(SELECTIONS)

$(KEYS):
	$(APT_KEY) exportall 2>/dev/null > $@

$(SELECTIONS):
	$(DPKG) --get-selections > $@

$(ARCHIVE): $(KEYS) $(SELECTIONS)
	/bin/tar cjvf $(ARCHIVE) /etc/apt/sources.list* $?

