# This file checks whether we have an operational sac2c compiler.
#
# Usable outputs:
#    * SAC2C_VERSION is set

# SAC2C_EXEC can be passed as an argument to `cmake' call in which
# case we treat it as a path to the sac2c executable.
IF (NOT SAC2C_EXEC)
    # Make sure that we can set some value into this variable now.
    UNSET (SAC2C_EXEC CACHE)

    # Try to find sac2c and fail if it is not there.
    FIND_PROGRAM (SAC2C_EXEC NAMES "sac2c")
    IF (NOT SAC2C_EXEC)
        MESSAGE (FATAL_ERROR "Could not locate the sac2c binary, exiting...")
    ENDIF ()
ENDIF ()

# Check that sac2c actually works by calling "sac2c -V"
EXECUTE_PROCESS (COMMAND ${SAC2C_EXEC} -V
                 RESULT_VARIABLE _sac2c_exec_res
                 OUTPUT_VARIABLE _sac2c_version
                 OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
IF (NOT "${_sac2c_exec_res}" STREQUAL "0")
    MESSAGE (FATAL_ERROR "Call to \"${SAC2C_EXEC} -V\" failed, something "
                         "wrong with the sac2c binary")
ENDIF ()

STRING (REGEX REPLACE "^sac2c ([\.0-9a-zA-Z-]+)\n.*" "\\1" SAC2C_VERSION ${_sac2c_version})

STRING (REGEX MATCH ".*(DEBUG|debug).*" debug_match "${SAC2C_VERSION}")

IF (debug_match)
    MESSAGE (WARNING "\n\nIt seems that you are using a DEBUG version of "
                     "sac2c which is noticeably slower.\n\n")
ENDIF ()
