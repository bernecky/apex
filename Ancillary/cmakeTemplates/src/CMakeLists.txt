CMAKE_MINIMUM_REQUIRED (VERSION 3.17)

INCLUDE ("${CMAKE_SOURCE_DIR}/cmake-common/sac2c-variables.cmake")
INCLUDE ("${CMAKE_SOURCE_DIR}/cmake-common/resolve-sac2c-dependencies.cmake")

# C files relatively to thes CMakeLists.txt.
#SET (C_DEPS_SRC
#    src/../../.c
#    ...
#)

SET (SAC2CFLAGS -doawlf -dopogo)
# SaC Mod files, relative to this CMakeLists.txt.
SET (SAC_SRC_MOD
    ${BM_DIR}.sac
)

# SaC Prog files, relatively to this CMakeLists.txt.
SET (SAC_SRC_PROG
    ${BM_DIR}.unittest.sac
)

# Make a directory for sac2c output
FILE (MAKE_DIRECTORY "${DLL_BUILD_DIR}/${TARGET_ENV}/${SBI}")

# For every sac mod file, compile Tree and Mod files.
FOREACH (name ${SAC_SRC_MOD})
    SET (src "${CMAKE_CURRENT_SOURCE_DIR}/${name}")
    # sac2c requires computes objectfiles relative to the working directory
    # of the call to sac2c.
    GET_FILENAME_COMPONENT (dir "${CMAKE_CURRENT_BINARY_DIR}/${name}" DIRECTORY)
    GET_FILENAME_COMPONENT (dst ${name} NAME_WE)
    SET (mod
        "${DLL_BUILD_DIR}/${TARGET_ENV}/${SBI}/lib${dst}Mod${MODEXT}")
    SET (tree
        "${DLL_BUILD_DIR}/tree/${TARGET_ENV}/lib${dst}Tree${TREE_DLLEXT}")

    RESOLVE_SAC_DEPENDENCIES ("${name}" "${SAC_SRC_MOD}" moddep_list)

    MESSAGE ("dependencies of ${name} => `${moddep_list}'")

    ADD_CUSTOM_COMMAND (
        OUTPUT ${mod} ${tree}
        COMMAND
	${SAC2C} -v0 ${SAC2FLAGS} -linksetsize ${LINKSETSIZE} -o ${DLL_BUILD_DIR} ${src}
        WORKING_DIRECTORY
            ${dir}
        DEPENDS ${moddep_list}
        COMMENT "Building ${name} module for target `${TARGET}'")

    # Install compiled Tree/Mod parts of the compiled module
    # to the corresponding locations.
    INSTALL (
        FILES ${mod}
        DESTINATION ${INSTALL_MOD_DIR}/${TARGET_ENV}/${SBI})
    INSTALL (
        FILES ${tree}
        DESTINATION ${INSTALL_TREE_DIR}/tree/${TARGET_ENV})

    # Make a call to the command that compiles the module a part
    # of the default build process.
    ADD_CUSTOM_TARGET (${TARGET}-module-${dst} ALL DEPENDS ${mod} ${tree})
ENDFOREACH (name)

# For every sac prog file, compile the binary file.
FOREACH (name ${SAC_SRC_PROG})
    SET (src "${CMAKE_CURRENT_SOURCE_DIR}/${name}")
    # sac2c requires computes objectfiles relatively to the working directory
    # of the call to sac2c.
    GET_FILENAME_COMPONENT (dir "${CMAKE_CURRENT_BINARY_DIR}/${name}" DIRECTORY)
    GET_FILENAME_COMPONENT (dst ${name} NAME_WE)
    SET (prog "${CMAKE_BINARY_DIR}/${dst}-${TARGET}")

    RESOLVE_SAC_DEPENDENCIES ("${name}" "${SAC_SRC_MOD}" moddep_list)

    MESSAGE ("dependencies of ${name} => `${moddep_list}'")

    ADD_CUSTOM_COMMAND (
        OUTPUT ${prog}
        COMMAND
	${SAC2C} -v0 ${SAC2FLAGS} -linksetsize ${LINKSETSIZE} -o ${prog} ${src}
        WORKING_DIRECTORY
            ${dir}
        DEPENDS ${moddep_list}
        COMMENT "Building ${name} program for target `${TARGET}'")

    # Install compiled Tree/Mod parts of the compiled module
    # to the corresponding locations.
    INSTALL (
        FILES ${prog}
        DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

    # Make a call to the command that compiles the module a part
    # of the default build process.
    ADD_CUSTOM_TARGET (${TARGET}-prog-${dst} ALL DEPENDS ${prog})
ENDFOREACH (name)
