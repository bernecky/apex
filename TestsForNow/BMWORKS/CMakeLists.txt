CMAKE_MINIMUM_REQUIRED (VERSION 3.17)

# This is the uberproject to build the collection of benchmarks in the
# folders in this directory, building a SaC module and a SaC program for each.
# The program depends on its associated module; the program and module source code
# are located in the `src/` folder in each benchmark.

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

SET (SAC2C_DEF_FLAGS -v0 -O3 -maxlur 3 -linksetsize ${LINKSETSIZE} -L ${DLL_BUILD_DIR} -T ${DLL_BUILD_DIR})

SET (BM_DIRS iotan )
MESSAGE( STATUS "BM_DIRS are: " ${BM_DIRS})

# For each target, run CMakeLists.txt in all benchmarks
FOREACH (TARGET IN ITEMS ${TARGETS})
	MESSAGE( STATUS "Target is: " ${TARGET})
	FOREACH ( BM_DIR IN ITEMS ${BM_DIRS})
		MESSAGE( STATUS "BM_DIR is: " ${BM_DIR})
		MESSAGE( STATUS "DLL_BUILD_DIR is: " ${DLL_BUILD_DIR})
		##ADD_SUBDIRECTORY (${BM_DIR}/src ${DLL_BUILD_DIR}/${TARGET}/${BM_DIR})
		ADD_SUBDIRECTORY (${BM_DIR}/src ${BM_DIR}-${TARGET})
		MESSAGE( STATUS "target for add_subdirectory is: " ${BM_DIR}-${TARGET})
	ENDFOREACH()
ENDFOREACH ()

