CC=gcc
LD=gcc
AR = $(GCC_PREFIX)gcc-ar
RANLIB = $(GCC_PREFIX)gcc-ranlib
OPTIMIZATIONS=-g -O3 -fdata-sections -ffunction-sections -fmerge-all-constants -flto -fuse-linker-plugin -ffat-lto-objects
CFLAGS=-Wall $(OPTIMIZATIONS) -I.

includes = $(wildcard *.h)

%.o: %.c ${includes}
	$(CC) -c $(CFLAGS) -o $@ $<
	
libavlbst.a: avlbst.o
	$(AR) rcu $@ $+
	$(RANLIB) $@

clean:
	del *.o *.a
