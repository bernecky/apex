
# 'make'        build executable file xx.bin, and .so file from fldr/*.sacs file
#               in folder fldr
#               E.g., run "make" in UnitTests or benchmksAPL
# 'make clean'  removes all .o, .so, and executable files

# define the SAC compiler to use
SAC2C = sac2c
# define any compile-time flags
CFLAGS = -Wall -g -O3
SACFLAGS = -doawlf -dopwlf -O3 -v1

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

# define the SAC source files
# NB := not = !! (but I don't know why...)
SACSRCS := $(wildcard */*.sac)
SACEXES = $(SACSRCS:.sac=.exe)
SACFOLDERx := $(SACSRCS:.sac=)
SACFOLDER := $(lastword $(SACSRCS:.sac=))
SACMODULES := $(wildcard */module/*.sac)
SACNONMODULES := $(wildcard */nonmodule/*.sac)
SACMODULECALLERS := $(wildcard */*.sac)
SACTREELIBS := $(SACMODULES:/tree/host/lib.sac=%Tree.so)

# define the root filenames
ROOTS = $(SACSRCS:.sac=)

.PHONY: depend clean

all:    $(SACEXES) $(SACMODULES) 
	@echo  SACFOLDERx is $(SACFOLDERx) 
	@echo  SACFOLDER is $(SACFOLDER) 
	@echo  SACSRCS are $(SACSRCS) 
	@echo  SACEXES are $(SACEXES)
	@echo  SACMODULES are $(SACMODULES)
	@echo  SACNONMODULES are $(SACNONMODULES)
	@echo  SACTREELIBS are $(SACTREELIBS)
	@echo  SACHOSTLIBS are $(SACHOSTLIBS)
	@echo  SACMODULECALLERS are $(SACMODULECALLERS)

%.exe: $(SACSRCS) $(SACMODULES) 
	@echo  making non-module binary $(SACEXES) 
	@echo  ... from $(SACSRCS) 
	$(SAC2C) $(SACFLAGS) $(INCLUDES) $<  -o $<.exe

##%.so: $(SACMODULES)  
lib:    $(SACMODULES)  
	@echo  SACMODULES are $(SACMODULES)
	@echo  making modules $(SACMODULES)
	@echo  ... from $(SACMODULES) 
	$(SAC2C) $(SACFLAGS) $(INCLUDES) $< 

clean:
	@echo CLEANING $(SACEXES) 
	$(RM) -r *.o $(SACEXES)  a.out a.out.c tree host
	@echo CLEANING SACMODULES SACMODULECALLERS and SACNONMODULES
	$(RM) $(SACMODULES) $(SACMODULECALLERS) $(SACNONMODULES)
	@echo CLEANING SAC LIBS
	@echo OOPSIE $(RM) -r $(SACTREELIBS) $(SACHOSTLIBS)


