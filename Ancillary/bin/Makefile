
# 'make'        build executable file xx.bin, and .so file from fldr/*.sacs file
#               in folder fldr
#               E.g., run "make" in UnitTests or benchmksAPL
# 'make clean'  removes all .o, .so, and executable files

# define the SAC compiler to use
SAC2C = sac2c
# define any compile-time flags
CFLAGS = -Wall -g -O3
SACFLAGS = -doawlf -dopwlf -dopogo -O3 -v1

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
# NB := not = !!
SACSRCS := $(wildcard */*.sac)
SACMODS := $(wildcard */_*.sac)

# define the SAC object files 
#
# This uses Suffix Replacement within a macro:
#   $(name:string1=string2)
#         For each word in 'name' replace 'string1' with 'string2'
# Below we are replacing the suffix .c of all words in the macro SACSRCS
# with the .o suffix
#
#
OBJS = $(SACSRCS:.sac=.o)

# define the executable files
EXES = $(SACSRCS:.sac=.exe)

# define the root filenames
ROOTS = $(SACSRCS:.sac=)

#
# The following part of the makefile is generic; it can be used to 
# build any executable just by changing the definitions above and by
# deleting dependencies appended to the file from 'make depend'
#

.PHONY: depend clean

all:    $(EXES)
	@echo  SAC sources $(SACSRCS) 
	@echo  SAC EXES are $(EXES)
	@echo  SAC ROOTS are $(ROOTS)
	@echo  SAC OBJS are $(OBJS)

%.exe: $(SACSRCS) 
	@echo  making $(EXES) from $(SACSRCS) 
	$(SAC2C) $(SACFLAGS) $(INCLUDES) $<  -o $<.exe

clean:
	@echo CLEANING!! Also removing $(EXES)
	$(RM) *.o *~ $(EXES) 
	$(RM) *.o *~ $(EXES) 

