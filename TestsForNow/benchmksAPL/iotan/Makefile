# Makefile for generic APEX-generated SAC code
# We generate a standalone binary (for main()),
# a shared library (.so) for almost all of the code,
# and a Calling() function to invoke the .so, in  both seq and mt_pth modes.

SRC=rubbish 
## Supply the source folder name as an argument, e.g.:  make SRC=iota 

SACSRC=$(wildcard src/$(SRC).*sac)

SACCC=sac2c
SACFLAGS= -v1 -O3 -doawlf -I. -gg

.PHONY: all
all:	$(SACSRC) nomod lib$(SRC)Tree.so Call

nomod: $(SACSRC) 
	$(SACCC) -o $(SRC).nomodu.sac.exe src/$(SRC).nomodu.sac $(SACFLAGS)
	rm -f $(SRC).nomodu.sac.exe.c
	$(SACCC) -o $(SRC).nomodu.sac.mt.exe src/$(SRC).nomodu.sac $(SACFLAGS) -target mt_pth
	rm -f $(SRC).nomodu.sac.exe.c $(SRC).nomodu.sac.mt.exe.c

# Make .so module 
lib$(SRC)Tree.so: src/$(SRC).sac
	$(SACCC) src/$(SRC).sac $(SACFLAGS) -shared -fpic 
	$(SACCC) src/$(SRC).sac $(SACFLAGS) -shared -fpic -target mt_pth

Call: $(SACSRC) lib$(SRC)Tree.so
	$(SACCC) -o Call$(SRC).sac.exe src/Call$(SRC).sac $(SACFLAGS)
	rm -f $(SRC).sac.exe.c
	$(SACCC) -o Call$(SRC).sac.mt.exe src/Call$(SRC).sac $(SACFLAGS) -target mt_pth
	rm -f $(SRC).sac.mt.exe.c

.PHONY: clean
clean:
	rm -rf $(SRC).nomodu.sac.exe Call$(SRC).sac.exe
	rm -rf $(SRC).nomodu.sac.exe.c Call$(SRC).sac.exe.c
	rm -rf build tree host


