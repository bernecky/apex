CMAKE_MINIMUM_REQUIRED (VERSION 3.3)

PROJECT (apex-benchmksAPL VERSION 1.0.0)

##ADD_EXECUTABLE (iotan.exe iotan.sac)  # No module version

# Destination for compiled sac modules
SET (DLL_BUILD_DIR  "${PROJECT_BINARY_DIR}/lib")

SET (TARGETS            seq mt_pth  CACHE STRING "Build executables for these sac2c targets")
SET (SAC2C_EXEC                     CACHE STRING "Path to sac2c compiler")
SET (LINKSETSIZE        "0"         CACHE STRING "Value for sac2c -linksetsize parameter")

# Check whether sac2c is operational
INCLUDE ("cmake-common/check-sac2c.cmake")
INCLUDE ("cmake-common/misc-macros.cmake")

SET (SAC2C_DEF_FLAGS -v0 -O3 -maxlur 3 -linksetsize ${LINKSETSIZE} -L ${DLL_BUILD_DIR} -T ${DLL_BUILD_DIR})
#                                                                  ^ SAC lib mod path  ^ SAC lib tree path

# Run CMakelist.txt in every source directory, on all targets
FOREACH (TARGET IN ITEMS ${TARGETS})
#ADD_SUBDIRECTORY (iotan            iotan)  ##-${TARGET})
#    ADD_SUBDIRECTORY (iotan.nomodu    iotan.nomodu-${TARGET})
#   ADD_SUBDIRECTORY (iotan.modu       iotan.mod-${TARGET})

#    ADD_SUBDIRECTORY (iotanAKD         iotanAKD-${TARGET})
#    ADD_SUBDIRECTORY (ipbb             ipbb-${TARGET})
#    ADD_SUBDIRECTORY (loopfsAKD        loopfsAKD-${TARGET})
ENDFOREACH ()
