# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/chris/files/cpp/sdl2_reference

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chris/files/cpp/sdl2_reference/build

# Include any dependencies generated for this target.
include vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/depend.make

# Include the progress variables for this target.
include vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/progress.make

# Include the compile flags for this target's objects.
include vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/flags.make

vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/test/example.o: vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/flags.make
vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/test/example.o: ../vendor/sdl_image/external/zlib-1.2.11/test/example.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/chris/files/cpp/sdl2_reference/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/test/example.o"
	cd /home/chris/files/cpp/sdl2_reference/build/vendor/sdl_image/external/zlib-1.2.11 && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/example64.dir/test/example.o   -c /home/chris/files/cpp/sdl2_reference/vendor/sdl_image/external/zlib-1.2.11/test/example.c

vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/test/example.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/example64.dir/test/example.i"
	cd /home/chris/files/cpp/sdl2_reference/build/vendor/sdl_image/external/zlib-1.2.11 && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/chris/files/cpp/sdl2_reference/vendor/sdl_image/external/zlib-1.2.11/test/example.c > CMakeFiles/example64.dir/test/example.i

vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/test/example.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/example64.dir/test/example.s"
	cd /home/chris/files/cpp/sdl2_reference/build/vendor/sdl_image/external/zlib-1.2.11 && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/chris/files/cpp/sdl2_reference/vendor/sdl_image/external/zlib-1.2.11/test/example.c -o CMakeFiles/example64.dir/test/example.s

# Object files for target example64
example64_OBJECTS = \
"CMakeFiles/example64.dir/test/example.o"

# External object files for target example64
example64_EXTERNAL_OBJECTS =

vendor/sdl_image/external/zlib-1.2.11/example64: vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/test/example.o
vendor/sdl_image/external/zlib-1.2.11/example64: vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/build.make
vendor/sdl_image/external/zlib-1.2.11/example64: vendor/sdl_image/external/zlib-1.2.11/libz.so.1.2.11
vendor/sdl_image/external/zlib-1.2.11/example64: vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/chris/files/cpp/sdl2_reference/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable example64"
	cd /home/chris/files/cpp/sdl2_reference/build/vendor/sdl_image/external/zlib-1.2.11 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example64.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/build: vendor/sdl_image/external/zlib-1.2.11/example64

.PHONY : vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/build

vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/clean:
	cd /home/chris/files/cpp/sdl2_reference/build/vendor/sdl_image/external/zlib-1.2.11 && $(CMAKE_COMMAND) -P CMakeFiles/example64.dir/cmake_clean.cmake
.PHONY : vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/clean

vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/depend:
	cd /home/chris/files/cpp/sdl2_reference/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chris/files/cpp/sdl2_reference /home/chris/files/cpp/sdl2_reference/vendor/sdl_image/external/zlib-1.2.11 /home/chris/files/cpp/sdl2_reference/build /home/chris/files/cpp/sdl2_reference/build/vendor/sdl_image/external/zlib-1.2.11 /home/chris/files/cpp/sdl2_reference/build/vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vendor/sdl_image/external/zlib-1.2.11/CMakeFiles/example64.dir/depend
