# Makefile for generic APEX-generated SAC code
# We generate a standalone binary (for main()),
# a shared library (.so) for almost all of the code,
# and a Calling() function to invoke the .so.

SRC=iotan
SACSRC=$(wildcard src/$(SRC).*sac)

SACCC=sac2c
SACFLAGS= -v1 -O3 -doawlf -I. -gg

.PHONY: all
all:	$(SACSRC) nomod lib$(SRC)Tree.so Call

nomod: $(SACSRC) 
	$(SACCC) -o $(SRC).nomodu.sac.exe src/$(SRC).nomodu.sac $(SACFLAGS)
	rm -f $(SRC).nomodu.sac.exe.c

# Make .so file 
lib$(SRC)Tree.so: src/$(SRC).sac
	$(SACCC) src/$(SRC).sac $(SACFLAGS) 

Call: $(SACSRC) lib$(SRC)Tree.so
	$(SACCC) -o Call$(SRC).sac.exe src/Call$(SRC).sac $(SACFLAGS)
	rm -f $(SRC).sac.exe.c

.PHONY: clean
clean:
	rm -rf $(SRC).nomodu.sac.exe Call$(SRC).sac.exe
	rm -rf $(SRC).nomodu.sac.exe.c Call$(SRC).sac.exe.c
	rm -rf build tree host


