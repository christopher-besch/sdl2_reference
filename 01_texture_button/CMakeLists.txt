cmake_minimum_required(VERSION 3.10)

file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
add_executable(01_texture_button ${SOURCES})
target_include_directories(01_texture_button
                           PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/src")

target_link_libraries(01_texture_button PRIVATE SDL2main)
target_link_libraries(01_texture_button PRIVATE SDL2_image)
target_link_libraries(01_texture_button PRIVATE SDL2_mixer)
target_link_libraries(01_texture_button PRIVATE SDL2_ttf)

# target_link_libraries(target ${SDL2_LIBRARY} ${SDL2_MIXER_LIBRARIES}
# ${SDL2_TTF_LIBRARIES} ${SDL2_IMAGE_LIBRARIES})
