CMAKE_MINIMUM_REQUIRED (VERSION 3.3)
PROJECT(apex-iotan VERSION 1.0.0)

##ADD_EXECUTABLE(iotan.nomodu.exe iotan.nomodu.sac)
##ADD_LIBRARY(Liotan SHARED iotan.modu.sac)
##ADD_EXECUTABLE(iotan iotan.sac)

##TARGET_LINK_LIBRARIES(iotan PRIVATE Liotan)


# Where to put compiled sac modules
SET (DLL_BUILD_DIR  "${PROJECT_BINARY_DIR}")

# For what targets we build modules
SET (TARGETS            seq mt_pth  CACHE STRING "Build flavors")
SET (SAC2C_EXEC                     CACHE STRING "A path to sac2c compiler")
SET (LINKSETSIZE        "0"         CACHE STRING "Set a value for -linksetsize parameter of sac2c")
SET (SAC2C_EXTRA_INC    ""          CACHE STRING "Extra include files that should be used by sac2c")

# Check if sac2c exists and is operational
INCLUDE ("cmake-common/check-sac2c.cmake")

# Run src/CMakeLists.txt for each target
FOREACH (TARGET IN ITEMS ${TARGETS})
    ADD_SUBDIRECTORY (src src-${TARGET})
ENDFOREACH ()

