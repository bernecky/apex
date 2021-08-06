CMAKE_MINIMUM_REQUIRED (VERSION 3.19)

# This example project builds a SaC module and a SaC program (executable).
# The program depends on the module; both are located under `src/`.
# It is important that create the sac2crc file for this project, as
# it is tricky to link, properly, the SaC modules with the program.

PROJECT (apex-testsandbenchmarks)

# Where the compiled sac modules are placed
SET (DLL_BUILD_DIR  "${PROJECT_BINARY_DIR}/lib")

# We build modules for these targets
SET (TARGETS            seq mt_pth CACHE STRING "Build for sequential and posix threads")
SET (SAC2C_EXEC                     CACHE STRING "Path to sac2c compiler")
SET (LINKSETSIZE        "0"         CACHE STRING "Value for sac2c's -linksetsize parameter")

# Check whether sac2c is operational
INCLUDE ("cmake-common/check-sac2c.cmake")
INCLUDE ("cmake-common/misc-macros.cmake")

# add our custom Find*.cmake in local cmake directory
#LIST (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Add nearly all subdirectories to the build list
FILE(GLOB BM_DIRST *)
list(REMOVE_ITEM BM_DIRST "${CMAKE_SOURCE_DIR}/cmake-common")
list(REMOVE_ITEM BM_DIRST "${CMAKE_SOURCE_DIR}/CMakeLists.txt")
list(REMOVE_ITEM BM_DIRST "${CMAKE_SOURCE_DIR}/build")
list(REMOVE_ITEM BM_DIRST "${CMAKE_SOURCE_DIR}/README")
list(REMOVE_ITEM BM_DIRST "${CMAKE_SOURCE_DIR}/README.md")
list(REMOVE_ITEM BM_DIRST "${CMAKE_SOURCE_DIR}/.git")

FOREACH (BM_DIR IN ITEMS ${BM_DIRST})
    get_filename_component(BM_DIRONE ${BM_DIR} NAME)
    list( APPEND BM_DIRS ${BM_DIRONE})
ENDFOREACH ()

# Run src/CMakeLists.txt for each target
FOREACH (TARGET IN ITEMS ${TARGETS})
    FOREACH ( BM_DIR IN ITEMS ${BM_DIRS})
        MESSAGE (STATUS adding subdirectory ${BM_DIR}/src)
        ADD_SUBDIRECTORY (${BM_DIR}/src ${BM_DIR}/src-${TARGET})
    ENDFOREACH ()
ENDFOREACH ()

# This build target is responsible for generating the package sac2crc file
CREATE_SAC2CRC_TARGET ("apex_bmworks" "${DLL_BUILD_DIR}" "${DLL_BUILD_DIR}" "")

# Testing section
 MESSAGE( STATUS  "START TESTING WITH" ${CMAKE_PROJECT_NAME} and ${PROJECT_NAME})
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    INCLUDE(CTest)
    FOREACH (TARGET IN ITEMS ${TARGETS})
	FOREACH ( BM_DIR IN ITEMS ${BM_DIRS})
          SET (ARGFNM ${CMAKE_SOURCE_DIR}/${BM_DIR}/bench.argv)
           MESSAGE (STATUS "arg fnm is" ${ARGFNM})
          IF (EXISTS ${ARGFNM})
              FILE (STRINGS ${ARGFNM} ARG)
              MESSAGE (STATUS "Value of file:" "${ARGFNM} is: "  ${ARG})
          ELSE()
              MESSAGE (STATUS file: "${ARGFNM}" does not exist)
              UNSET (ARG)
          ENDIF()

          FOREACH (THREDS IN ITEMS 1 5 10) # number of threads
              MESSAGE (STATUS Test-${BM_DIR}-${TARGET} "with ARG" ${ARG} "and THREDS= ${THREDS}")
              ADD_TEST (Test-${BM_DIR}-${TARGET} ${BM_DIR}-${TARGET} ${ARG} -mt ${THREDS})
          ENDFOREACH ()
        ENDFOREACH ()
    ENDFOREACH ()
endif()

