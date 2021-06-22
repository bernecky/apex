# This file defines commonly used sac2c variables that are mainly coming
# from reading sac2crc.
#
# Assumptions:
#    * SAC2C_EXEC is set to operational sac2c. We assume that
#      `check-sac2c.cmake' has been included earlier.
#    * TARGET has been set to the target name we compile sac modules for.

IF (NOT CMAKE_COMMON_DIR)
    SET (CMAKE_COMMON_DIR "cmake-common")
ENDIF ()
INCLUDE ("${CMAKE_SOURCE_DIR}/${CMAKE_COMMON_DIR}/check-sac2c-feature-support.cmake") # for CHECK_SAC2C_SUPPORT_FLAG

# Sanity check.  Check that we have a variable with sac2c executable.
IF (NOT SAC2C_EXEC)
    MESSAGE (FATAL_ERROR "The SAC2C_EXEC variable is not set. (include check-sac2c.cmake?)")
ENDIF ()

# Sanity check. Check that TARGET is defined.
IF (NOT TARGET)
    MESSAGE (FATAL_ERROR "The TARGET variable is not set, which sac2c target shall we use?")
ENDIF ()

# Create local variant of the SAC2C flags
SET (SAC2C_T ${SAC2C_EXEC} ${SAC2C_CPP_INC} -target ${TARGET})
CHECK_SAC2C_SUPPORT_FLAG ("xp" "-Xp" "-DTEST")
IF (HAVE_FLAG_xp)
    SET (SAC2C ${SAC2C_T} -Xp "\"${SAC2C_EXTRA_INC}\"" -Xtc "\"${SAC2C_EXTRA_INC}\"")
ELSE ()
    SET (SAC2C ${SAC2C_T} -Xc "\"${SAC2C_EXTRA_INC}\"" -Xtc "\"${SAC2C_EXTRA_INC}\"")
ENDIF ()

# get the target environment - possibly `x64' or similar...
EXECUTE_PROCESS (COMMAND ${SAC2C_T} -CTARGET_ENV
                 OUTPUT_VARIABLE TARGET_ENV OUTPUT_STRIP_TRAILING_WHITESPACE)

# do several tests to make sure that SBI data is sane...
IF (NOT TARGET_ENV)
    MESSAGE (FATAL_ERROR "${SAC2C_T} seems not to work, cannot determine SBI data, exiting...")
ELSE ()
    MACRO (GET_SAC2C_VAR var)
        EXECUTE_PROCESS (COMMAND ${SAC2C_T} -C${var}
                         OUTPUT_VARIABLE  ${var}  OUTPUT_STRIP_TRAILING_WHITESPACE)
    ENDMACRO ()

    GET_SAC2C_VAR (SBI)
    GET_SAC2C_VAR (OBJEXT)
    GET_SAC2C_VAR (MODEXT)
    GET_SAC2C_VAR (TREE_DLLEXT)
    GET_SAC2C_VAR (TREE_OUTPUTDIR)
    GET_SAC2C_VAR (LIB_OUTPUTDIR)
ENDIF ()

# Figure out where to install Tree files
STRING (REGEX REPLACE ":.*$" "" INSTALL_TREE_DIR ${TREE_OUTPUTDIR})

# Figure out where to instrall Mod files
STRING (REGEX REPLACE ":.*$" "" INSTALL_MOD_DIR ${LIB_OUTPUTDIR})

# Sanity checks.
IF ("${SBI}" STREQUAL "XXXXX")
    MESSAGE (FATAL_ERROR "No SBI specification for target `${TARGET}', exiting...")
ENDIF ()
IF ("${TARGET_ENV}" STREQUAL "XXXXX")
    MESSAGE (FATAL_ERROR "No TARGET_ENV specificed for target `${TARGET}', exiting...")
ENDIF ()

# FIXME(artem) Consider getting rid of this file.
MESSAGE (STATUS "Target `${TARGET}' build properties: "
                "${TARGET_ENV} ${SBI} ${MODEXT} ${OBJEXT} ${TREE_DLLEXT}")
