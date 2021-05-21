.PHONY: depend clean modules

SACPREREQSMODU := $(wildcard */*/build/sacM)
SACPREREQSCALL := $(wildcard */*/build/sacC)

all:    #$(SACPREREQS) 
	@echo  SACPREREQSMODU are $(SACPREREQSMODU)
	@echo  SACPREREQSCALL are $(SACPREREQSCALL)

modules: $(SACPREREQSMODU)
	$?



