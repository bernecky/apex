CMAKE_MINIMUM_REQUIRED (VERSION 3.17)

# This example project builds a SaC module and a SaC program (executable).
# The program depends on the module; both are located under `src/`.
# It is important that create the sac2crc file for this project, as
# it is tricky to link, properly, the SaC modules with the program.

PROJECT (apex-bmworks)

# Where the compiled sac modules are placed
SET (DLL_BUILD_DIR  "${PROJECT_BINARY_DIR}/lib")

# We build modules for these targets
SET (TARGETS            seq mt_pth  CACHE STRING "Build for sequential and posix threads")
SET (SAC2C_EXEC                     CACHE STRING "Path to sac2c compiler")
SET (LINKSETSIZE        "0"         CACHE STRING "Value for sac2c's -linksetsize parameter")

# Check whether sac2c is operational
INCLUDE ("cmake-common/check-sac2c.cmake")
INCLUDE ("cmake-common/misc-macros.cmake")

# add our custom Find*.cmake in local cmake directory
#LIST (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

SET (BM_DIRS buildv compiota compiotaAKD compiotad compiotadAKD crc crc2 csbench csbenchAKD downgradePV)
SET (BM_DIRS  ${BMDIRS} gewlf histgrade histlp iotan logd logd2 logd3 logd4 loopfs loopfv lowertri) 
# DEBUG above wants to be all folders in current source dir except for things like cmake-common and CMakeLists.txt
# DEBUG not sure how to do this cleanly

MESSAGE( STATUS "BM_DIRS are: " ${BM_DIRS})

# Run src/CMakeLists.txt for each target
FOREACH (TARGET IN ITEMS ${TARGETS})
	FOREACH ( BM_DIR IN ITEMS ${BM_DIRS})
	  MESSAGE( STATUS "target for add_subdirectory is: " ${BM_DIR}/src or maybe ${BM_DIR}/src-${TARGET})
          ADD_SUBDIRECTORY (${BM_DIR}/src ${BM_DIR}/src-${TARGET})
        ENDFOREACH ()
ENDFOREACH ()

# This build target is responsible for generating the package sac2crc file
CREATE_SAC2CRC_TARGET ("examplemodule" "${DLL_BUILD_DIR}" "${DLL_BUILD_DIR}" "")
