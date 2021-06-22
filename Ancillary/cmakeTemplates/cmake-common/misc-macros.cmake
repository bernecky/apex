# This file contains miscellaneous macros and functions for all things
# CMake.

# This function provides a mechanism to remove modules
# related files from a list of source files - the intention
# being to prevent the module from being compiled.
# NOTE: this does not resolve dependencies!
#
# Parameters:
#  - source_list (required) => variable (not ${<XXX>}, but <XXX>)
#                              that contains the list of sources
#  - modules_list (required) => a list of modules you wish exclude
FUNCTION (REMOVE_MODULE_IN_SRC source_list modules_list)
    FOREACH (module ${modules_list})
        FOREACH (dep ${${source_list}})
            IF ("${dep}" MATCHES "^.*${module}[\\./].*$")
                LIST (REMOVE_ITEM ${source_list} "${dep}")
            ENDIF ()
        ENDFOREACH ()
    ENDFOREACH ()
    SET (${source_list} ${${source_list}} PARENT_SCOPE)
ENDFUNCTION ()

# This macro creates the `create-sac2crc-file' target, which generates a
# project specific sac2crc file and places into `~/.sac2crc' - it is assumed
# that this directory exists.
#
# Parameters:
#  - _package_name (required) => name of the project name
#  - _lib_path     (required) => location of libraries
#  - _tree_path    (required) => location of tree files
#  - _libs         (optional) => string of C-libraries, e.g. '-lm'
MACRO (CREATE_SAC2CRC_TARGET _package_name _lib_path _tree_path _libs)
    ADD_CUSTOM_TARGET (create-sac2crc-file ALL
        COMMAND ${CMAKE_COMMAND}
            # XXX on non-*NIX systems environment variable `HOME' will not exist
            -DUSER_HOME="$ENV{HOME}"
            # XXX ideally we should use PROJECT_NAME, but sadly this has a dash `-'
            #     which sac2crc does not support within target names
            -DPACKAGE_NAME="${_package_name}"
            -DLIB_PATH="${_lib_path}"
            -DTREE_PATH="${_tree_path}"
            -DLIBS="${_libs}"
            -P "${PROJECT_SOURCE_DIR}/cmake-common/generate-sac2crc-file.cmake"
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        COMMENT "Creating package sac2crc file in user's home directory")
ENDMACRO ()
