#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SDL2_ttf::SDL2_ttf" for configuration ""
set_property(TARGET SDL2_ttf::SDL2_ttf APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(SDL2_ttf::SDL2_ttf PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libSDL2_ttf.so"
  IMPORTED_SONAME_NOCONFIG "libSDL2_ttf.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS SDL2_ttf::SDL2_ttf )
list(APPEND _IMPORT_CHECK_FILES_FOR_SDL2_ttf::SDL2_ttf "${_IMPORT_PREFIX}/lib/libSDL2_ttf.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
