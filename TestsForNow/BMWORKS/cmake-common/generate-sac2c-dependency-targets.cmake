# XXX The contents of this file should probably be added to
# `resolve-sac2c-dependencies.cmake', but hasn't as it is very similar to the
# function `RESOLVE_SAC_DEPENDENCIES'. Further consideration is needed here.

# Sanity check. We need this in order to generate appropriate dependency target
# names.
IF (NOT TARGET)
    MESSAGE (FATAL_ERROR "The TARGET variable is not set.")
ENDIF ()

# This function resolves dependencies for a given module name (`file_name') and
# returns a list of C/CXX object files and module targets (via `ret_targets').
#
# The module targets are given instead of the module library files as dependency
# resolution at the level of Makefiles is inconsistent and prone to error. CMake
# is better at handling targets as dependencies then files - though we have not
# observed any issues with C/CXX object files.
#
# One parameter of this function (`target_name_template') is special in that the
# user can define the structure of the target names. So far we support the
# following replaceable tokens:
#   - <TARGET> -> is the same as ${TARGET}, e.g. seq, mt_pth, etc.
#   - <NAME>   -> is the name of the dependency, e.g. ArrayArrith.
# An example of such a template is `<TARGET>-module-<NAME>' which would result
# in `seq-module-ArrayArrith'.
FUNCTION (RESOLVE_SAC_DEPS_AS_TARGETS file_name target_name_template ret_targets)
    SET (ret)

    # Resolve dependencies for the Module.
    EXECUTE_PROCESS (COMMAND ${SAC2C_T} -v0 -M "${CMAKE_CURRENT_SOURCE_DIR}/${file_name}"
                     OUTPUT_VARIABLE dep_str OUTPUT_STRIP_TRAILING_WHITESPACE)

    # XXX Currently this is correct, as sac2c always inserts '\n'.
    #     However, in case we ever support Windows, we might rethink this.
    STRING (REPLACE "\n" ";" dep_list "${dep_str}")

    # Filter dep_list
    FOREACH (dep ${dep_list})
        # If dependency is a Mod or a Tree file
        STRING (REGEX MATCH "^lib(.+)(Mod|Tree)${TREE_DLLEXT}$" match "${dep}")
        IF (match)
            # We replace the template format keywords with their local value
            SET (target_name "${target_name_template}")
            STRING (REPLACE "<TARGET>" "${TARGET}" target_name "${target_name}")
            STRING (REPLACE "<NAME>" "${CMAKE_MATCH_1}" target_name "${target_name}")
            # Add the target to the return list
            LIST (APPEND ret "${target_name}")
            # Unset the target name
            UNSET (target_name)
        ELSE ()
            # If DEP wasn't a sac module, check whether it is an object file.
            STRING (REGEX MATCH "${OBJEXT}$" match "${dep}")

            IF (match)
                # Construct the path that is relative to the given sac file!
                GET_FILENAME_COMPONENT (sac_file_dir "${file_name}" DIRECTORY)

                # If so, add it to the list of dependencies
                LIST (APPEND ret "${CMAKE_CURRENT_BINARY_DIR}/${sac_file_dir}/${dep}")
            ENDIF ()
        ENDIF ()
    ENDFOREACH ()
    # If we have a list, we remove all duplicates.
    # XXX This is needed because we have lib*Mod and lib*Tree files, for the
    # same module, thus leading to duplicates. We should fix this in the
    # relevant if-block above.
    IF (ret)
        LIST (REMOVE_DUPLICATES ret)
    ENDIF ()
    SET (${ret_targets} ${ret} PARENT_SCOPE)
ENDFUNCTION ()
