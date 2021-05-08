# This file checks whether we have an operational sac4c compiler.

# FIXME(artem) Before we attempt to find sac4c it would be nice
#              to try to look for files like:
#
#                   $(basedir $(which ${SAC2C_EXEC}))/sac4c_*
#              I bet that in the majority of cases, this will deliver
#              the right sac4c binary.

# Assumptions:
#    * SAC2C_EXEC is set to operational sac2c. We assume that
#      `check-sac2c.cmake' has been included earlier.

# Usable outputs:
#    * SAC4C_VERSION is set

# SAC4C_EXEC can be passed as an argument to `cmake' call in which
# case we treat it as a path to the sac2c executable.
IF (NOT SAC4C_EXEC)
    # Make sure that we can set some value into this variable now.
    UNSET (SAC4C_EXEC CACHE)

    # Try to find sac2c and fail if it is not there.
    FIND_PROGRAM (SAC4C_EXEC NAMES "sac4c")
    IF (NOT SAC4C_EXEC)
        MESSAGE (FATAL_ERROR "Could not locate the sac4c binary, exiting...")
    ENDIF ()
ENDIF ()


# Check that sac2c actually works by calling "sac2c -V"
EXECUTE_PROCESS (COMMAND ${SAC4C_EXEC} -V
                 RESULT_VARIABLE _sac4c_exec_res
                 OUTPUT_VARIABLE _sac4c_version
                 OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
IF (NOT "${_sac4c_exec_res}" STREQUAL "0")
    MESSAGE (FATAL_ERROR "Call to \"${SAC4C_EXEC} -V\" failed, something "
                         "wrong with the sac4c binary")
ENDIF ()

STRING (REGEX REPLACE "^sac4c ([\.0-9a-zA-Z-]+)\n.*" "\\1" SAC4C_VERSION ${_sac4c_version})

STRING (REGEX MATCH ".*(DEBUG|debug).*" debug_match "${SAC4C_VERSION}")

IF (NOT "${SAC2C_VERSION}" STREQUAL "${SAC4C_VERSION}")
    MESSAGE (FATAL_ERROR "sac2c and sac4c versions do not match!")
ENDIF ()

