CMAKE_MINIMUM_REQUIRED (VERSION 3.3)

# Temp home for working benchmksAPL
PROJECT (apex-BMWORKS)

# Where compiled sac modules reside
SET (DLL_BUILD_DIR  "${PROJECT_BINARY_DIR}/lib")

# Targets for which we build modules or binaries
##DEBUG SET (TARGETS            seq mt_pth  CACHE STRING "Build for these targets")
SET (TARGETS            seq CACHE STRING "Build for these targets")
SET (SAC2C_EXEC                     CACHE STRING "Path to sac2c compiler")
SET (LINKSETSIZE        "0"         CACHE STRING "Value for -linksetsize parameter of sac2c")

# Check whether sac2c is operational
INCLUDE ("cmake-common/check-sac2c.cmake")
INCLUDE ("cmake-common/misc-macros.cmake")



SET (SAC2C_DEF_FLAGS -v0 -O3 -maxlur 3 -linksetsize ${LINKSETSIZE} -L ${DLL_BUILD_DIR} -T ${DLL_BUILD_DIR})

# For every target here, run CMakeLists.txt in target folder
FOREACH (TARGET IN ITEMS ${TARGETS})
INCLUDE ("cmake-common/sac2c-variables.cmake")
INCLUDE ("cmake-common/resolve-sac2c-dependencies.cmake")
INCLUDE ("cmake-common/generate-sac2c-dependency-targets.cmake")
INCLUDE ("cmake-common/build-sac2c-module.cmake")
	#ADD_SUBDIRECTORY (buildv         buildv-${TARGET})
    ADD_SUBDIRECTORY (loop01       loop01-${TARGET})
    ADD_SUBDIRECTORY (compiota       compiota-${TARGET})
    #ADD_SUBDIRECTORY (compiotad     compiotad-${TARGET})
    #ADD_SUBDIRECTORY (crc           crc-${TARGET})
    #ADD_SUBDIRECTORY (crc2          crc2-${TARGET})
    #ADD_SUBDIRECTORY (csbench       csbench-${TARGET})
    #ADD_SUBDIRECTORY (downgradePV   downgradePV-${TARGET})
    #ADD_SUBDIRECTORY (gewlf         gewlf-${TARGET})
    #ADD_SUBDIRECTORY (histgrade     histgrade-${TARGET})
    #ADD_SUBDIRECTORY (histlp        histlp-${TARGET})
    #ADD_SUBDIRECTORY (iotan         iotan-${TARGET})
    #ADD_SUBDIRECTORY (logd          logd-${TARGET})
    #ADD_SUBDIRECTORY (logd2         logd2-${TARGET})
    #ADD_SUBDIRECTORY (logd3         logd3-${TARGET})
    #ADD_SUBDIRECTORY (logd4         logd4-${TARGET})
    #ADD_SUBDIRECTORY (loopfs        loopfs-${TARGET})
    #ADD_SUBDIRECTORY (loopfv        loopfv-${TARGET})
    #ADD_SUBDIRECTORY (lowertri      lowertri-${TARGET})
ENDFOREACH ()
