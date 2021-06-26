cmake_minimum_required(VERSION 3.10)

file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
add_executable(02_geometry ${SOURCES})
target_include_directories(02_geometry
                           PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/src")

target_link_libraries(02_geometry PRIVATE SDL2main)
target_link_libraries(02_geometry PRIVATE SDL2_image)
target_link_libraries(02_geometry PRIVATE SDL2_mixer)
target_link_libraries(02_geometry PRIVATE SDL2_ttf)
