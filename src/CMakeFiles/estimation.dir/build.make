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
include src/CMakeFiles/estimation.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/estimation.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/estimation.dir/flags.make

src/CMakeFiles/estimation.dir/common/Image.cpp.o: src/CMakeFiles/estimation.dir/flags.make
src/CMakeFiles/estimation.dir/common/Image.cpp.o: src/common/Image.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/estimation.dir/common/Image.cpp.o"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/estimation.dir/common/Image.cpp.o -c /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/Image.cpp

src/CMakeFiles/estimation.dir/common/Image.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/estimation.dir/common/Image.cpp.i"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/Image.cpp > CMakeFiles/estimation.dir/common/Image.cpp.i

src/CMakeFiles/estimation.dir/common/Image.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/estimation.dir/common/Image.cpp.s"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/Image.cpp -o CMakeFiles/estimation.dir/common/Image.cpp.s

src/CMakeFiles/estimation.dir/common/Image.cpp.o.requires:

.PHONY : src/CMakeFiles/estimation.dir/common/Image.cpp.o.requires

src/CMakeFiles/estimation.dir/common/Image.cpp.o.provides: src/CMakeFiles/estimation.dir/common/Image.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/estimation.dir/build.make src/CMakeFiles/estimation.dir/common/Image.cpp.o.provides.build
.PHONY : src/CMakeFiles/estimation.dir/common/Image.cpp.o.provides

src/CMakeFiles/estimation.dir/common/Image.cpp.o.provides.build: src/CMakeFiles/estimation.dir/common/Image.cpp.o


src/CMakeFiles/estimation.dir/common/boxes.cpp.o: src/CMakeFiles/estimation.dir/flags.make
src/CMakeFiles/estimation.dir/common/boxes.cpp.o: src/common/boxes.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/estimation.dir/common/boxes.cpp.o"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/estimation.dir/common/boxes.cpp.o -c /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/boxes.cpp

src/CMakeFiles/estimation.dir/common/boxes.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/estimation.dir/common/boxes.cpp.i"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/boxes.cpp > CMakeFiles/estimation.dir/common/boxes.cpp.i

src/CMakeFiles/estimation.dir/common/boxes.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/estimation.dir/common/boxes.cpp.s"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/boxes.cpp -o CMakeFiles/estimation.dir/common/boxes.cpp.s

src/CMakeFiles/estimation.dir/common/boxes.cpp.o.requires:

.PHONY : src/CMakeFiles/estimation.dir/common/boxes.cpp.o.requires

src/CMakeFiles/estimation.dir/common/boxes.cpp.o.provides: src/CMakeFiles/estimation.dir/common/boxes.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/estimation.dir/build.make src/CMakeFiles/estimation.dir/common/boxes.cpp.o.provides.build
.PHONY : src/CMakeFiles/estimation.dir/common/boxes.cpp.o.provides

src/CMakeFiles/estimation.dir/common/boxes.cpp.o.provides.build: src/CMakeFiles/estimation.dir/common/boxes.cpp.o


src/CMakeFiles/estimation.dir/common/lodepng.cpp.o: src/CMakeFiles/estimation.dir/flags.make
src/CMakeFiles/estimation.dir/common/lodepng.cpp.o: src/common/lodepng.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/estimation.dir/common/lodepng.cpp.o"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/estimation.dir/common/lodepng.cpp.o -c /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/lodepng.cpp

src/CMakeFiles/estimation.dir/common/lodepng.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/estimation.dir/common/lodepng.cpp.i"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/lodepng.cpp > CMakeFiles/estimation.dir/common/lodepng.cpp.i

src/CMakeFiles/estimation.dir/common/lodepng.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/estimation.dir/common/lodepng.cpp.s"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/common/lodepng.cpp -o CMakeFiles/estimation.dir/common/lodepng.cpp.s

src/CMakeFiles/estimation.dir/common/lodepng.cpp.o.requires:

.PHONY : src/CMakeFiles/estimation.dir/common/lodepng.cpp.o.requires

src/CMakeFiles/estimation.dir/common/lodepng.cpp.o.provides: src/CMakeFiles/estimation.dir/common/lodepng.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/estimation.dir/build.make src/CMakeFiles/estimation.dir/common/lodepng.cpp.o.provides.build
.PHONY : src/CMakeFiles/estimation.dir/common/lodepng.cpp.o.provides

src/CMakeFiles/estimation.dir/common/lodepng.cpp.o.provides.build: src/CMakeFiles/estimation.dir/common/lodepng.cpp.o


src/CMakeFiles/estimation.dir/estimation/a10.cpp.o: src/CMakeFiles/estimation.dir/flags.make
src/CMakeFiles/estimation.dir/estimation/a10.cpp.o: src/estimation/a10.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/estimation.dir/estimation/a10.cpp.o"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/estimation.dir/estimation/a10.cpp.o -c /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/a10.cpp

src/CMakeFiles/estimation.dir/estimation/a10.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/estimation.dir/estimation/a10.cpp.i"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/a10.cpp > CMakeFiles/estimation.dir/estimation/a10.cpp.i

src/CMakeFiles/estimation.dir/estimation/a10.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/estimation.dir/estimation/a10.cpp.s"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/a10.cpp -o CMakeFiles/estimation.dir/estimation/a10.cpp.s

src/CMakeFiles/estimation.dir/estimation/a10.cpp.o.requires:

.PHONY : src/CMakeFiles/estimation.dir/estimation/a10.cpp.o.requires

src/CMakeFiles/estimation.dir/estimation/a10.cpp.o.provides: src/CMakeFiles/estimation.dir/estimation/a10.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/estimation.dir/build.make src/CMakeFiles/estimation.dir/estimation/a10.cpp.o.provides.build
.PHONY : src/CMakeFiles/estimation.dir/estimation/a10.cpp.o.provides

src/CMakeFiles/estimation.dir/estimation/a10.cpp.o.provides.build: src/CMakeFiles/estimation.dir/estimation/a10.cpp.o


src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o: src/CMakeFiles/estimation.dir/flags.make
src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o: src/estimation/basicImageManipulation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o -c /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/basicImageManipulation.cpp

src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.i"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/basicImageManipulation.cpp > CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.i

src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.s"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/basicImageManipulation.cpp -o CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.s

src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o.requires:

.PHONY : src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o.requires

src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o.provides: src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/estimation.dir/build.make src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o.provides.build
.PHONY : src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o.provides

src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o.provides.build: src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o


src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o: src/CMakeFiles/estimation.dir/flags.make
src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o: src/estimation/filtering.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/estimation.dir/estimation/filtering.cpp.o -c /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/filtering.cpp

src/CMakeFiles/estimation.dir/estimation/filtering.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/estimation.dir/estimation/filtering.cpp.i"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/filtering.cpp > CMakeFiles/estimation.dir/estimation/filtering.cpp.i

src/CMakeFiles/estimation.dir/estimation/filtering.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/estimation.dir/estimation/filtering.cpp.s"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/estimation/filtering.cpp -o CMakeFiles/estimation.dir/estimation/filtering.cpp.s

src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o.requires:

.PHONY : src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o.requires

src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o.provides: src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/estimation.dir/build.make src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o.provides.build
.PHONY : src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o.provides

src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o.provides.build: src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o


# Object files for target estimation
estimation_OBJECTS = \
"CMakeFiles/estimation.dir/common/Image.cpp.o" \
"CMakeFiles/estimation.dir/common/boxes.cpp.o" \
"CMakeFiles/estimation.dir/common/lodepng.cpp.o" \
"CMakeFiles/estimation.dir/estimation/a10.cpp.o" \
"CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o" \
"CMakeFiles/estimation.dir/estimation/filtering.cpp.o"

# External object files for target estimation
estimation_EXTERNAL_OBJECTS =

src/libestimation.a: src/CMakeFiles/estimation.dir/common/Image.cpp.o
src/libestimation.a: src/CMakeFiles/estimation.dir/common/boxes.cpp.o
src/libestimation.a: src/CMakeFiles/estimation.dir/common/lodepng.cpp.o
src/libestimation.a: src/CMakeFiles/estimation.dir/estimation/a10.cpp.o
src/libestimation.a: src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o
src/libestimation.a: src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o
src/libestimation.a: src/CMakeFiles/estimation.dir/build.make
src/libestimation.a: src/CMakeFiles/estimation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX static library libestimation.a"
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && $(CMAKE_COMMAND) -P CMakeFiles/estimation.dir/cmake_clean_target.cmake
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/estimation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/estimation.dir/build: src/libestimation.a

.PHONY : src/CMakeFiles/estimation.dir/build

src/CMakeFiles/estimation.dir/requires: src/CMakeFiles/estimation.dir/common/Image.cpp.o.requires
src/CMakeFiles/estimation.dir/requires: src/CMakeFiles/estimation.dir/common/boxes.cpp.o.requires
src/CMakeFiles/estimation.dir/requires: src/CMakeFiles/estimation.dir/common/lodepng.cpp.o.requires
src/CMakeFiles/estimation.dir/requires: src/CMakeFiles/estimation.dir/estimation/a10.cpp.o.requires
src/CMakeFiles/estimation.dir/requires: src/CMakeFiles/estimation.dir/estimation/basicImageManipulation.cpp.o.requires
src/CMakeFiles/estimation.dir/requires: src/CMakeFiles/estimation.dir/estimation/filtering.cpp.o.requires

.PHONY : src/CMakeFiles/estimation.dir/requires

src/CMakeFiles/estimation.dir/clean:
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src && $(CMAKE_COMMAND) -P CMakeFiles/estimation.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/estimation.dir/clean

src/CMakeFiles/estimation.dir/depend:
	cd /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src /workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/src/CMakeFiles/estimation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/estimation.dir/depend
