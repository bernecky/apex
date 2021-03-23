
# This macro adds a recepie to compile a sac program taking version file
# into account.  The version file is named the same as sac program, but 
# with the extension .vers, e.g. a version file for a.sac would be a.vers.
#
# The version file has the following syntax:
#       <suffix1>: <flags1>
#       ...
#       <suffixN>: <flagsN>
#
# This specifies that a sac program (e.g. a.sac) should build the following
# binaries:
#      a<suffix1>, a<suffix2>, ... a<suffixN>
#
# each a<suffixI> is built by calling:
#      sac2c <flagsI> -o a<suffixI>
#
# Arguments:
#     name:  
#           name of the sac file relatively to CMAKE_CURRENT_SOURCE_DIR
#     local_sac_modules:
#           a list of sac modules that should participate in dependency
#           resolution.  See cmake-common/resolve-sac2c-dependencies.cmake
#           for more details
#     sac2c_flags:
#           sac2c flags that are used when calling the sac2c compiler.
MACRO (COMPILE_SAC2C_WITH_VER name local_sac_modules sac2c_flags) 
    #MESSAGE ("===== ${name}, ${local_sac_modules}, ${sac2c_flags}")
    # Full source to the sac program.
    SET (src "${CMAKE_CURRENT_SOURCE_DIR}/${name}")
    # sac2c requires computes objectfiles relatively to the working directory
    # of the call to sac2c.
    GET_FILENAME_COMPONENT (dir "${CMAKE_CURRENT_BINARY_DIR}/${name}" DIRECTORY)
    GET_FILENAME_COMPONENT (namewe ${name} NAME_WE)

    SET (version_file "${CMAKE_CURRENT_SOURCE_DIR}/${namewe}.vers")
    IF (EXISTS "${version_file}")
        FILE (READ ${version_file} content)
        STRING (REPLACE "\n" ";" lines ${content})

        FOREACH (l ${lines})
            STRING (REGEX MATCH "([a-zA-Z_0-9]+)[ \t]*:[ \t]*(.*)" match ${l})
            IF (NOT match)
                MESSAGE (FATAL_ERROR 
                         "error while parsing version file ${version_file}:\n${l}")
            ENDIF ()
            SET (suffix "${CMAKE_MATCH_1}")
            STRING (REGEX REPLACE "[ \t]+" ";" flags "${CMAKE_MATCH_2}")
            SET (binary "${namewe}${suffix}")
            #MESSAGE ("-- ${l}: (${suffix}, ${flags})")
            #SAC2C_COMPILE (${dir} ${src} ${binary} ${flags})
            SET (new_flags ${sac2c_flags} ${flags})
            SAC2C_COMPILE_PROG_DEPS (${name} ${binary} "${version_file}" "${local_sac_modules}" "${new_flags}")
        ENDFOREACH ()
    ELSE ()
            SET (binary "${namewe}-${TARGET}")
            #SAC2C_COMPILE (${dir} ${src} ${binary} "")
            SAC2C_COMPILE_PROG (${name} ${binary} "${local_sac_modules}" "${sac2c_flags}")
    ENDIF ()
ENDMACRO ()
