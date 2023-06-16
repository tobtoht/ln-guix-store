PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin
ZIG_FLAGS ?= -OReleaseSmall

release:
	zig build-exe ln-guix-store.zig ${ZIG_FLAGS}

install: install-bin

install-bin: release
	mkdir -p ${BINDIR}
	install -m0755 ln-guix-store ${BINDIR}/
