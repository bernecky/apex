CMAKE_MINIMUM_REQUIRED (VERSION 3.3)

PROJECT (apex-benchmksAPL)

# Where the compiled sac modules result
SET (DLL_BUILD_DIR  "${PROJECT_BINARY_DIR}/lib")

SET (TARGETS            seq mt_pth  CACHE STRING "Build executables for these targets")
SET (SAC2C_EXEC                     CACHE STRING "Path to sac2c compiler")
SET (LINKSETSIZE        "0"         CACHE STRING "Value for sac2c -linksetsize parameter")
SET (SAC2C_DEF_FLAGS -v0 -O3 -maxlur 3 -linksetsize ${LINKSETSIZE} -L ${DLL_BUILD_DIR} -T ${DLL_BUILD_DIR})

# Check whether sac2c is operational
INCLUDE ("cmake-common/check-sac2c.cmake")
INCLUDE ("cmake-common/misc-macros.cmake")

# For every target run CMakeLists.txt in src
FOREACH (TARGET IN ITEMS ${TARGETS})
    ADD_SUBDIRECTORY (src/iotan            src-${TARGET})
#    ADD_SUBDIRECTORY (src/iotan.nomodu    iotan.nomodu-${TARGET})
#   ADD_SUBDIRECTORY (src/iotan.modu       iotan.mod-${TARGET})

#    ADD_SUBDIRECTORY (iotanAKD         iotanAKD-${TARGET})
#    ADD_SUBDIRECTORY (ipbb             ipbb-${TARGET})
#    ADD_SUBDIRECTORY (loopfsAKD        loopfsAKD-${TARGET})
ENDFOREACH ()
