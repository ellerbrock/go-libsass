export PKG_CONFIG_PATH=$(shell pwd)/lib/pkgconfig

fetch:
	git submodule sync
	git submodule update --init
deps: fetch
	cd libsass-src; make clean && autoreconf -fvi && \
		./configure --disable-shared --prefix=$(shell pwd) --disable-silent-rules --disable-dependency-tracking && \
		make install
.PHONY: test
test:
	@echo $(PKG_CONFIG_PATH)
	go test -race .
