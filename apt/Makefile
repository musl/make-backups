ARCHIVE    := $(CURDIR)/apt-backup-$(shell date "+%Y%m%d-%H%M%S.tar.bz2")
KEYS       := apt-key-backup.asc
SELECTIONS := dpkg-selections

.PHONY: all clean

all: check_uid $(ARCHIVE) clean

check_uid:
ifeq ("$(shell id -u)", "0")
	$(error Please run this as your user account)
endif

clean:
	rm -f $(KEYS) $(SELECTIONS)

$(KEYS):
	apt-key exportall 2>/dev/null > $@

$(SELECTIONS):
	dpkg --get-selections > $@

$(ARCHIVE): $(KEYS) $(SELECTIONS)
	tar cjvf $(ARCHIVE) /etc/apt/sources.list* $?

