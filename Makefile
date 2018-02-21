DIRS := $(shell find . -type d -maxdepth 1 -mindepth 1)

.PHONY: all

all:
	for d in $(DIRS) ; do make -C $$d ; done

