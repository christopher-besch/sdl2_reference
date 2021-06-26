cmake_minimum_required(VERSION 3.10)

project(neural_network VERSION 0.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
# "${PROJECT_SOURCE_DIR}/vendor/sdl_cmake") find_package(SDL2 REQUIRED)
# find_package(SDL2_mixer REQUIRED) find_package(SDL2_ttf REQUIRED)
# find_package(SDL2_image REQUIRED)

# include_directories(${SDL2_INCLUDE_DIR} ${SDL2_MIXER_INCLUDE_DIR}
# ${SDL2_TTF_INCLUDE_DIR} ${SDL2_IMAGE_INCLUDE_DIR})

# dependencies
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/vendor/sdl")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/vendor/sdl_mixer")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/vendor/sdl_ttf")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/vendor/sdl_image")

# use warnings and multi threaded
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic")
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic")
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  set(CMAKE_CXX_FLAGS
      "${CMAKE_CXX_FLAGS} /MP2 /DWIN32_LEAN_AND_MEAN /DNOMINMAX")
endif()

# executables
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/01_texture_button")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/02_geometry")
