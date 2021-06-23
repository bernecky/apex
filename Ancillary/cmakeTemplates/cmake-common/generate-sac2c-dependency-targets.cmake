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

# This function resolves dependencies for a given module, returning both a list
# of targets which it depends on and source files which should be tracked.
# Through the later we garantee that when a source file is modified, we cause
# the module itself to be compiled and all modules that depend on it.
#
# This function in part wraps around `RESOLVE_SAC_DEPS_AS_TARGETS()`, appends to
# the targets list the sources list. This can be used directly in the DEPENDS
# field of `add_custom_command()`.
#
# `file_name`: the name of the module source file
# `target_name_template`: the template name for targets, with two substitations
#                         `<TARGET>` and `<NAME>`, see
#                         `RESOLVE_SAC_DEPS_AS_TARGETS()` for further details.
# `srcs_list`: a list of (all) source files which is used to compile the
#              dependent sources for each module
# `ret_deps`: the return list, made up of targets and source files.
FUNCTION (RESOLVE_SAC_DEPS_AS_TARGETS_SOURCES file_name target_name_template srcs_list ret_deps)
    SET (ret_srcs)

    # get target list
    RESOLVE_SAC_DEPS_AS_TARGETS ("${file_name}" "${target_name_template}" targets_list)

    # from target lists we find the correct source file
    FOREACH (target ${targets_list})
        IF ("${target}" MATCHES "-([A-Za-z0-9_]+)$")
            # we build a copy of the sources list, and then filter out all
            # values which do not match, which should leave us with 1 source
            # file.
            SET (_list_cpy ${srcs_list})
            LIST (FILTER _list_cpy INCLUDE REGEX "/${CMAKE_MATCH_1}\.[xsac]+$")
            LIST (LENGTH _list_cpy _list_len)
            IF (${_list_len} EQUAL 1)
                LIST (APPEND ret_srcs "${CMAKE_CURRENT_SOURCE_DIR}/${_list_cpy}")
            ELSE ()
                MESSAGE (FATAL_ERROR "We have name class on ${CMAKE_MATCH_1}! Aborting...")
            ENDIF ()
            UNSET (_list_cpy)
            UNSET (_list_len)
        ENDIF ()
    ENDFOREACH ()
    MESSAGE (DEBUG "Found following sources: ${ret_srcs}")
    SET (${ret_deps} "${ret_srcs};${targets_list}" PARENT_SCOPE)
ENDFUNCTION ()
