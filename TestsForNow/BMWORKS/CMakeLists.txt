CMAKE_MINIMUM_REQUIRED (VERSION 3.17)

# This is the uberproject to build the collection of benchmarks in the
# folders in this directory, building a SaC module and a SaC program for each.
# The program depends on its associated module; the program and module source code
# are located in the `src/` folder in each benchmark.
# The sac2crc file simplifies correct linking of the SaC module
# with its program.

PROJECT (apex-bmworks)

# List all the benchmarks
FILE(GLOB BM_DIRS CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/*)
MESSAGE( STATUS "Building for: " ${BM_DIRS})

# Destination for compiled sac modules
SET (DLL_BUILD_DIR  "${PROJECT_BINARY_DIR}/lib")

# We build modules and programs for all targets, where a target
# is the result of compiling for e.g., sequential or multi-thread execution
SET (TARGETS            seq mt_pth  CACHE STRING "Build sequential and pthread code for each target")

SET (SAC2C_EXEC                     CACHE STRING "Path to sac2c compiler")
SET (LINKSETSIZE        "0"         CACHE STRING "Value for sac2c -linksetsize parameter")

# Check whether sac2c is operational
INCLUDE ("cmake-common/check-sac2c.cmake")
INCLUDE ("cmake-common/misc-macros.cmake")

# add our custom Find*.cmake in local cmake directory
#LIST (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

SET (BM_DIRS iotan )
MESSAGE( STATUS "BM_DIRSare: " ${BM_DIRS})
# For each target, run CMakeLists.txt in all benchmarks
FOREACH (TARGET IN ITEMS ${TARGETS})
	MESSAGE( STATUS "Target is: " ${TARGET})
	#### DEBUG FOREACH ( BM_DIR IN ITEMS ${BM_DIRS})
	FOREACH ( BM_DIR IN ITEMS ${BM_DIRS})
		MESSAGE( STATUS "BM_DIR is: " ${BM_DIR})
		ADD_SUBDIRECTORY (${BM_DIR}/src ${DLL_BUILD_DIR}/${TARGET})
	ENDFOREACH()
ENDFOREACH ()

# This build target is responsible for generating the package sac2crc file
CREATE_SAC2CRC_TARGET ("examplemodule" "${DLL_BUILD_DIR}" "${DLL_BUILD_DIR}" "")

