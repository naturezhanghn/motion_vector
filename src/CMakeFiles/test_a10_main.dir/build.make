# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master

# Include any dependencies generated for this target.
include src/CMakeFiles/test_a10_main.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/test_a10_main.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/test_a10_main.dir/flags.make

src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o: src/CMakeFiles/test_a10_main.dir/flags.make
src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o: src/examples/test_a10_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o -c /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/examples/test_a10_main.cpp

src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.i"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/examples/test_a10_main.cpp > CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.i

src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.s"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/examples/test_a10_main.cpp -o CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.s

src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o.requires:

.PHONY : src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o.requires

src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o.provides: src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/test_a10_main.dir/build.make src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o.provides.build
.PHONY : src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o.provides

src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o.provides.build: src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o


# Object files for target test_a10_main
test_a10_main_OBJECTS = \
"CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o"

# External object files for target test_a10_main
test_a10_main_EXTERNAL_OBJECTS =

src/test_a10_main: src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o
src/test_a10_main: src/CMakeFiles/test_a10_main.dir/build.make
src/test_a10_main: src/libestimation.a
src/test_a10_main: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.3.2.0
src/test_a10_main: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.3.2.0
src/test_a10_main: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.3.2.0
src/test_a10_main: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.3.2.0
src/test_a10_main: /usr/lib/x86_64-linux-gnu/libopencv_core.so.3.2.0
src/test_a10_main: src/CMakeFiles/test_a10_main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_a10_main"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_a10_main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/test_a10_main.dir/build: src/test_a10_main

.PHONY : src/CMakeFiles/test_a10_main.dir/build

src/CMakeFiles/test_a10_main.dir/requires: src/CMakeFiles/test_a10_main.dir/examples/test_a10_main.cpp.o.requires

.PHONY : src/CMakeFiles/test_a10_main.dir/requires

src/CMakeFiles/test_a10_main.dir/clean:
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && $(CMAKE_COMMAND) -P CMakeFiles/test_a10_main.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/test_a10_main.dir/clean

src/CMakeFiles/test_a10_main.dir/depend:
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/CMakeFiles/test_a10_main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/test_a10_main.dir/depend

