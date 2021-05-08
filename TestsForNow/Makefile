
# This makefile goes in each UnitTest and benchmark folder

# 'make'        build executable file xx.bin, and .so file from fldr/*.sacs file
#               in folder fldr
#               E.g., run "make" in UnitTests or benchmksAPL
# 'make clean'  removes all .o, .so, and executable files

# define the SAC compiler to use
SAC2C = sac2c
# define any compile-time flags
CFLAGS = -Wall -g -O3
# maybe later when we fix sac2c performance   SACFLAGS = -doawlf -dopwlf -O3 -v1
SACFLAGS = -O3 -v1

# define any directories containing header files other than /usr/include
#INCLUDES = -I/home/newhall/include  -I../include

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like:
#LFLAGS = -L/home/newhall/lib  -L../lib

# define any libraries to link into executable:
#   if I want to link in libraries (libx.so or libx.a) I use the -llibname 
#   option, something like (this will link in libmylib.so and libm.so:
#LIBS = -lmylib -lm

# define the SAC source folders
SACSRCS    := $(wildcard UnitTests/*/src/Call*.sac)
SACMODULES := $(wildcard UnitTests/*/src/*.sac)

##SACEXES = $(SACSRCS:.sac=.exe)

##SACPREREQ1 := $(SACMODULES:.sac=Tree.so)
##SACPREREQ2 := $(notdir $(SACPREREQ1))
##SACPREREQS := $(addprefix /tree/host/lib,$(SACPREREQ2))

##SACNONMODULES := $(wildcard nonmodule/*.sac)

.PHONY: depend clean modules

all:    #$(SACPREREQS) 
	@echo  SACPREREQS are $(SACPREREQS)
	@echo  SACSRCS are $(SACSRCS) 
	@echo  SACEXES are $(SACEXES)
	@echo  SACMODULES are $(SACMODULES)
	@echo  SACNONMODULES are $(SACNONMODULES)
	@echo  SACHOSTLIBS are $(SACHOSTLIBS)
	##$(MAKE) %.so

%.exe: $(SACSRCS) $(SACPREREQS) 
	@echo  making non-module binary $(SACEXES) 
	@echo  ... from $(SACSRCS) 
	$</build/SACc
##	$(SAC2C) $(SACFLAGS) $(INCLUDES) $<  -o $<.exe

modules: $(SACMODULES)
	@echo  making fake module $(SACMODULES) 

%.so: $(SACMODULES)
	@echo  making module $(SACMODULES) 
	$</build/SACm
	## here$(SAC2C) $(SACFLAGS) $(INCLUDES) $< 

clean:
	@echo CLEANING $(SACEXES) 
	$(RM) $(SACEXES)  a.out a.out.c tree host
	@echo CLEANING SACMODULES SACMODULECALLERS and SACNONMODULES
	$(RM) $(SACMODULES) $(SACMODULECALLERS) $(SACNONMODULES)
	@echo CLEANING SAC LIBS

depend: $(SACMODULES)
	@echo  making depend for $(SACMODULES) 
	$(RM) $@.d
	$(SAC2C) $(SACFLAGS) $(INCLUDES) $<  -M  > $<.d

