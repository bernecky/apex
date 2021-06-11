CMAKE_MINIMUM_REQUIRED (VERSION 3.17)

# This is the uberproject to build the collection of benchmarks in the
# folders in this directory, building a SaC module and a SaC program for each.
# The program depends on its associated module; the program and module source code
# are located in the `src/` folder in each benchmark.
# The sac2crc file eases the task of correctly linking the SaC module
# with its program.

PROJECT (apex-bmworks)

# Destination for compiled sac modules
SET (DLL_BUILD_DIR  "${PROJECT_BINARY_DIR}/lib")

# For what targets we build modules
SET (TARGETS            seq mt_pth  CACHE STRING "Build sequential and pthread code for each target")

SET (SAC2C_EXEC                     CACHE STRING "Path to sac2c compiler")
SET (LINKSETSIZE        "0"         CACHE STRING "Value for sac2c -linksetsize parameter")

# Check whether sac2c is operational
INCLUDE ("cmake-common/check-sac2c.cmake")
INCLUDE ("cmake-common/misc-macros.cmake")

# add our custom Find*.cmake in local cmake directory
#LIST (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# For each target, run CMakeLists.txt in src
FOREACH (TARGET IN ITEMS ${TARGETS})
    ADD_SUBDIRECTORY (src   src-${TARGET})
ENDFOREACH ()

# This build target is responsible for generating the package sac2crc file
CREATE_SAC2CRC_TARGET ("examplemodule" "${DLL_BUILD_DIR}" "${DLL_BUILD_DIR}" "")

