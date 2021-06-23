# This file contains CMake macros and functions used to test
# for supported SAC2C features. Supported features are exposed
# through set CMake variables.

# List of feature variables:
#  * `HAVE_HEADER_PRAGMA`

# Some macros here will create variables with dynamic names,
# typically thought they start with HAVE_. Please read the
# comments carefully and see the naming convention of variables.

# For consistency all macros/functions should start with
# `CHECK_SAC2C_SUPPORT_*` where `*` is the feature being
# checked for.

# This macro checks if the SAC2C supports the `header`
# pragma. No compilation is needed for this check, so
# we break at the parsing phase of the compiler.
SET (HAVE_HEADER_PRAGMA NO)
MACRO (CHECK_SAC2C_SUPPORT_HEADER_PRAGMA)
    SET (_cshp_source "external int ilogb( double a);
  #pragma header \"<math.h>\"
int main() { return ilogb( 12d); }")

    EXECUTE_PROCESS (
        COMMAND ${CMAKE_COMMAND} -E echo "${_cshp_source}"
        COMMAND ${SAC2C_EXEC} -noPAB -bscp
        RESULT_VARIABLE _cshp_result
        OUTPUT_QUIET
        ERROR_QUIET)
    IF (${_cshp_result} STREQUAL "0")
        SET (HAVE_HEADER_PRAGMA YES)
    ENDIF ()
ENDMACRO ()

# This macro allows for arbitrary flags to be tested,
# ensuring that the sac2c binary supports the feature
# provided by that flag. Only *one* sac2c flag may be
# given. As we only check that a flag is supported, we
# don't need to compile anything, we break at parsing.
# After calling the macro, the variable HAVE_FLAG_name
# will be set, where 'name' is given as the first argument
# to the macro.
# param: _name the name to append to the test variable
# param: _flag the flag to check
MACRO (CHECK_SAC2C_SUPPORT_FLAG _name _flag _arg)
    SET (HAVE_FLAG_${_name} FALSE)
    SET (_sgen_source "int main () { return 0; }")

    MESSAGE (CHECK_START "Checking if sac2c supports flag \"${_flag}\"")

    EXECUTE_PROCESS (
        COMMAND ${CMAKE_COMMAND} -E echo "${_sgen_source}"
        COMMAND ${SAC2C_EXEC} -bscp ${_flag} ${_arg}
        RESULT_VARIABLE _sgen_result
        OUTPUT_QUIET
        ERROR_QUIET)
    IF (${_sgen_result} STREQUAL "0")
        SET (HAVE_FLAG_${_name} TRUE)
        MESSAGE (CHECK_PASS "found")
    ELSE ()
        MESSAGE (CHECK_FAIL "not found")
    ENDIF ()
ENDMACRO ()
