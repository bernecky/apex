# CMake file
#
# This file generates the version variables that are needed when
# generating packages or other objects for the given project.

# this makes use of git and tagging information
FIND_PACKAGE (Git REQUIRED)

IF (NOT DEFINED GIT_EXECUTABLE)
  MESSAGE (FATAL_ERROR "Git not found!")
ENDIF ()

# Get sac2c version components from compiler version string
# For input: 1.3.3-MijasCosta-164-g40956,
#  version = 1.3.3-MijasCosta-164-g40956
#  major = 1
#  minor = 3.3
#  patch = 164
FUNCTION (PARSE_SAC2C_VERSION version major minor patch)
    SET (_version "")
    SET (_major "")
    SET (_minor "")
    SET (_patch 0)

    STRING (REGEX REPLACE "^v" "" _version "${version}")
    STRING (REGEX REPLACE "\n" "" _version "${_version}")
    STRING (REGEX REPLACE "^([0-9]+)\\..*" "\\1" _major "${_version}")
    STRING (REGEX REPLACE "^([0-9]+)\\.([0-9]+\\.[0-9]+|[0-9]+).*" "\\2" _minor "${_version}")
    IF ("${_version}" MATCHES "-([0-9]+)(-g[a-f0-9]+)?(-dirty)?$")
        SET (_patch "${CMAKE_MATCH_1}")
    ENDIF ()

    SET (${major} ${_major} PARENT_SCOPE)
    SET (${minor} ${_minor} PARENT_SCOPE)
    SET (${patch} ${_patch} PARENT_SCOPE)
ENDFUNCTION ()

# Get project version information
FUNCTION (GET_PROJECT_VERSION version major minor patch)
  SET (_version "")
  SET (_major "")
  SET (_minor "")
  SET (_patch 0)

  EXECUTE_PROCESS (
    COMMAND
      ${GIT_EXECUTABLE} describe --tags --abbrev=4 --dirty
    WORKING_DIRECTORY
      "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE _version
    RESULT_VARIABLE _return_code
  )

  IF (NOT ${_return_code} EQUAL 0)
    MESSAGE (FATAL_ERROR "Git did not return correctly!\n${_return_code}")
  ENDIF ()

  STRING (REGEX REPLACE "^v" "" _version "${_version}")
  STRING (REGEX REPLACE "\n" "" _version "${_version}")
  STRING (REGEX REPLACE "^([0-9]+)\\..*" "\\1" _major "${_version}")
  STRING (REGEX REPLACE "^([0-9]+)\\.([0-9]+).*" "\\2" _minor "${_version}")
  IF ("${_version}" MATCHES "-([0-9]+)(-g[a-f0-9]+)?(-dirty)?$")
    SET (_patch "${CMAKE_MATCH_1}")
  ENDIF ()

  SET (${version} ${_version} PARENT_SCOPE)
  SET (${major} ${_major} PARENT_SCOPE)
  SET (${minor} ${_minor} PARENT_SCOPE)
  SET (${patch} ${_patch} PARENT_SCOPE)
ENDFUNCTION ()
# vim: ts=2 sw=2 et:
