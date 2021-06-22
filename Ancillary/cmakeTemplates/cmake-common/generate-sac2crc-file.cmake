# This CMake script is meant to be run directly via CMake's `-P' flag in script
# mode. It creates a sac2crc file within the user's ~/.sac2crc directory which
# appends the directory paths of the mod and tree files via the target `package'.
#
# It is expected that this script is run from the PROJECT_SOURCE_DIR.
#
# Paramters:
#  - USER_HOME    (required) => path to the user's home directory
#  - PACKAGE_NAME (required) => name of the package, this is used as the name
#                               of the target within the sac2crc file
#  - LIB_PATH     (required) => path to the directory containing the package
#                               lib*Mod files
#  - TREE_PATH    (required) => path to the directory containing the package
#                               lib*Tree files
#
# Note: all paths *must* be absolute.
# Note(2): this script modifies the state of the user's home directory; checks
#          are in place to prevent bad things from happening, but all due
#          consideration must be given in regards to how this script is used.

# Sanity check. We need to know the user's home directory.
IF (NOT USER_HOME)
    MESSAGE (FATAL_ERROR "User home directory not given")
ENDIF ()

# Sanity check. We need to have a package name.
IF (NOT PACKAGE_NAME)
    MESSAGE (FATAL_ERROR "Package name not given")
ENDIF ()

# Sanity check. We need to have a path to the mod files.
IF (NOT LIB_PATH)
    MESSAGE (FATAL_ERROR "Lib path not given")
ENDIF ()

# Sanity check. We need to have a path to the tree files.
IF (NOT TREE_PATH)
    MESSAGE (FATAL_ERROR "Tree path not given")
ENDIF ()

SET (sac2crc_path "${USER_HOME}/.sac2crc")
SET (sac2crc_file "sac2crc.package.${PACKAGE_NAME}")

# XXX perhaps over engineered?
IF (NOT IS_ABSOLUTE "${LIB_PATH}")
    MESSAGE (WARNING "Lib path should be absolute")
    GET_FILENAME_COMPONENT (LIB_PATH "${LIB_PATH}" ABSOLUTE)
ENDIF ()

# XXX perhaps over engineered?
IF (NOT IS_ABSOLUTE "${TREE_PATH}")
    MESSAGE (WARNING "Tree path should be absolute")
    GET_FILENAME_COMPONENT (TREE_PATH "${TREE_PATH}" ABSOLUTE)
ENDIF ()

# check if user has the `.sac2crc` directory. If it is a file (old
# system rc), we inform the user they need to change it. If the
# directory does not exist, we create it for them.
IF (NOT IS_DIRECTORY "${sac2crc_path}" AND EXISTS "${sac2crc_path}")
    MESSAGE (WARNING "The file ${sac2crc_path} exists, and is no longer "
        "a valid RC file for the SaC ecosystem. This has now been moved "
        "for you into ~/.sac2crc/sac2crc.custom. Be aware that you may "
        "have to change contents of the file.")
    FILE (RENAME "${sac2crc_path}" "${USER_HOME}/sac2crc.custom")
    FILE (MAKE_DIRECTORY "${sac2crc_path}")
    FILE (RENAME "${USER_HOME}/sac2crc.custom" "${USER_HOME}/.sac2crc/sac2crc.custom")
ELSEIF (NOT IS_DIRECTORY "${sac2crc_path}")
    FILE (MAKE_DIRECTORY "${sac2crc_path}")
ENDIF ()

# Apply variables to template sac2crc file
FILE (READ "cmake-common/sac2crc/sac2crc.package.in" sac2crc_config_in)
STRING (CONFIGURE "${sac2crc_config_in}" sac2crc_config_out @ONLY)

# If a file exists that has the same name, we generate a hashsum.
SET (create_sac2crc TRUE)
IF (EXISTS "${sac2crc_path}/${sac2crc_file}")
    MESSAGE ("Found an existing sac2crc package file")

    # generate hashsums
    FILE (MD5 "${sac2crc_path}/${sac2crc_file}" file_hashsum)
    STRING (MD5 string_hashsum "${sac2crc_config_out}")

    # compare hashsums
    IF (NOT "${string_hashsum}" STREQUAL "${file_hashsum}")
        MESSAGE ("Difference detected, backing up old file")

        # XXX we might overwrite an existing backup
        FILE (RENAME "${sac2crc_path}/${sac2crc_file}"
            "${sac2crc_path}/bak.${sac2crc_file}")
    ELSE ()
        SET(create_sac2crc FALSE)
    ENDIF()
ENDIF ()

IF (create_sac2crc)
    MESSAGE (STATUS "Creating sac2crc package file")
    FILE (WRITE "${sac2crc_path}/${sac2crc_file}" "${sac2crc_config_out}")
ELSE ()
    MESSAGE (STATUS "Old sac2crc package file still valid, not updating")
ENDIF ()
