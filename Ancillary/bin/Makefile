# Makefile for generic APEX-generated SAC code
# Generate a shared library (.so) for almost all of the code,
# and a Calling() function to invoke the .so, in  both seq and mt_pth modes.
# This assumes that the APL source has a main.apl, ergo a main().

BUILD_DIR := ./build
SRC_DIRS := ./src

SACUT=$(wildcard $(SRC_DIRS)/*.unittest.sac)
SACSRCMODU=$(wildcard $(SRC_DIRS)/*.sac)
SACMODS=$(filter-out $(SACUT), $(SACSRCMODU))
DEP = $(SACUT:.sac=.d)  # one dependency file per source file

SACCC=sac2c
SACFLAGS= -v1 -O3 -doawlf -I. -gg  -L $(BUILD_DIR) -T $(BUILD_DIR)
SACTARGETSEQ = -target seq 
SACTARGETMT = -target mt_pth 

CFLAGS =  -Xc -shared -Xc -fpic

.PHONY: all
all:	unittest

whasis: 
	@echo unit tests are $(SACUT)
	@echo modules are $(SACMODS)

deps: $(SACUT)
	@echo making deps for $<
	# I am not sure how to use the .d file 
	$(SACCC) $< -M > $(BUILD_DIR)/$(notdir $<).d
	
### no idea how to handle this include $(DEP)   # include all DEP files in the makefile
# Make main() unit test code
unittest: unittestseq unittestmt 
	@echo unit tests made

unittestseq: $(SACUT) moduseq
	@echo Making unit test seq $<
	mkdir -p $(BUILD_DIR)
	$(SACCC) $< -o $(BUILD_DIR)/$(notdir $<).seq.exe $(SACSRC) $(SACFLAGS) $(SACTARGETSEQ) $(CFLAGS)
	@echo   Made unit test seq $<

unittestmt: $(SACUT) modumt
	@echo Making unit test mt $<
	mkdir -p $(BUILD_DIR)
	$(SACCC) $< -o $(BUILD_DIR)/$(notdir $<).mt.exe $(SACSRC) $(SACFLAGS) $(SACTARGETMT)  $(CFLAGS)
	@echo   Made unit test mt $<

moduseq: $(SACMODS)
	@echo Making module seq $(SACMODS)
	mkdir -p $(BUILD_DIR)
	$(SACCC) $< $(SACFLAGS) $(SACTARGETSEQ) -o $(BUILD_DIR) $(CFLAGS)
	@echo   Made module seq $(SACMODS)

modumt: $(SACMODS)
	@echo Making module mt $(SACMODS)
	mkdir -p $(BUILD_DIR)
	$(SACCC) $< $(SACFLAGS) $(SACTARGETMT)  -o $(BUILD_DIR) $(CFLAGS)
	@echo   Made module mt $(SACMODS)

# Recursive make in a folder with subfolders, such as benchmksAPL
# which contains these subfolders: snp, upgradeBool, and mconv
#
subdirs:
	@echo now what can we do in $<?
	cd $<; $(MAKE)
	touch $<

test: $(SACUT)
	@echo running test for seq $<
	$(BUILD_DIR)/$(notdir $<).seq.exe < bench.argv; echo $?

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)/tree $(BUILD_DIR)/host $(BUILD_DIR)/*.c $(BUILD_DIR)/*.exe
	rm -rf $(BUILD_DIR)/*.i $(BUILD_DIR)/*.d


