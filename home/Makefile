KEY    := 1BE1490D6CB14770
VOLUME := SDCARD
DEST   := $(CURDIR)/$(USER)

.PHONY: all backup

all: backup

$(DEST):
	mkdir -p $(DEST)

backup: $(DEST)
	duplicity \
		-v 8 \
		--exclude $(HOME)/.local/share/keybase/fs \
		--exclude $(HOME)/.cache \
		--encrypt-sign-key $(KEY) \
		--use-agent \
		$(HOME) \
		file://$(DEST)

