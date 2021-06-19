# This file is a generic macro that can be used to build
# a sac module.

# Assumptions:
#   * DLL_BUILD_DIR has been previously defined.
#   * `sac2c-variables.cmake' has been included.

MESSAGE( STATUS "debug we are in build_sac2c_module")

# Sanity check.  DLL_BUILD_DIR is the location where to put compiled
# sac modules.  This is needed to generate local dependency correctly.
IF (NOT DLL_BUILD_DIR)
    MESSAGE (FATAL_ERROR "The DLL_BUILD_DIR variable is not set")
ENDIF ()

# Sanity check.  SAC-related variables like SBI, TARGET_ENV, etc
# are defined in the sac2c-variables.cmake which should be included
# before including this file.
IF (NOT SBI)
    MESSAGE (FATAL_ERROR "The SBI variable is not set. (consider including sac2c-variables.cmake?)")
ENDIF ()

# This macro resolves dependencies of the sac module to local sac modules and
# adds a custom command and a custom target to build the module.  The name of
# the custom target is composed as:
#       module-${binary_name}-${TARGET}
# 
# Default location of the compiled Mod and Tree files is set to DLL_BUILD_DIR.
#
# Arguments:
#       file_name:   
#           name of the *.sac program relatively to ${CMAKE_CURRENT_SOURCE_DIR}
#       file_deps:
#           file dependencies of the given target
#       local_sac_modules:
#           a list of sac source files --- local modules that may result in
#           dependency to the binaries we are building.
#       sac2c_flags:
#           flags that sac2c needs to build the program.
#       
MACRO (SAC2C_COMPILE_MOD_DEPS file_name file_deps local_sac_modules sac2c_flags)
    SET (src "${CMAKE_CURRENT_SOURCE_DIR}/${file_name}")
    # sac2c requires computes objectfiles relatively to the working directory
    # of the call to sac2c.
    GET_FILENAME_COMPONENT (dir "${CMAKE_CURRENT_BINARY_DIR}/${file_name}" DIRECTORY)
    GET_FILENAME_COMPONENT (namewe ${file_name} NAME_WE)
    SET (mod
        "${DLL_BUILD_DIR}/${TARGET_ENV}/${SBI}/lib${namewe}Mod${MODEXT}")
    SET (tree
        "${DLL_BUILD_DIR}/tree/${TARGET_ENV}/lib${namewe}Tree${TREE_DLLEXT}")

    RESOLVE_SAC_DEPENDENCIES ("${file_name}" "${local_sac_modules}" moddep_list)

    MESSAGE ("dependencies of ${file_name} => `${moddep_list}'")

    ADD_CUSTOM_COMMAND (
        OUTPUT ${mod} ${tree}
        COMMAND ${SAC2C} ${sac2c_flags} -o ${DLL_BUILD_DIR} ${src}
        WORKING_DIRECTORY ${dir}
        DEPENDS ${file_deps} ${moddep_list}
        COMMENT "Building ${file_name} module for target `${TARGET}'")

    ADD_CUSTOM_TARGET (module-${namewe}-${TARGET} ALL DEPENDS ${mod} ${tree})
   
    ##MESSAGE ("===== ${file_name}, ${binary_name}, ${file_deps}, ${local_sac_modules}, ${sac2c_flags}")
    ## Compute a full path to sac source    
    #SET (src "${CMAKE_CURRENT_SOURCE_DIR}/${file_name}")

    ## Compute a full path to binary
    #GET_FILENAME_COMPONENT (bin_dir "${CMAKE_CURRENT_BINARY_DIR}/${file_name}" DIRECTORY)

    ## Compute dependencies to local sac_modules
    #RESOLVE_SAC_DEPENDENCIES ("${file_name}" "${local_sac_modules}" moddep_list)
   
    ##MESSAGE ("dependencies for ${file_name} => ${moddep_list}")

    #SET (path_to_binary "${bin_dir}/${binary_name}")
    #ADD_CUSTOM_COMMAND (
    #    OUTPUT ${path_to_binary}
    #    COMMAND ${SAC2C} ${sac2c_flags} -o ${binary_name} ${src}
    #    WORKING_DIRECTORY ${bin_dir}
    #    DEPENDS ${file_deps} ${moddep_list}
    #    MAIN_DEPENDENCY ${src} 
    #    COMMENT "Building ${binary_name} sac program from ${src}")

    ## Make a call to the command that compiles the module a part
    ## of the default build process.
    #ADD_CUSTOM_TARGET (prog-${binary_name}-${TARGET} ALL DEPENDS ${path_to_binary})
ENDMACRO ()

MACRO (SAC2C_COMPILE_MOD file_name local_sac_modules sac2c_flags)
    SAC2C_COMPILE_MOD_DEPS (${file_name} "" "${local_sac_modules}" "${sac2c_flags}")
ENDMACRO()
