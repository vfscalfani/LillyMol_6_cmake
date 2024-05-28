cmake_minimum_required(VERSION 3.10.1)
project(LillyMol)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/build)
set(IW_EXTRA_LIBS -lz -lre2)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# Ensure static linking

# Licensing information for dependencies:
# This CMake file configures the build system to statically link with zlib and re2 libraries.
# zlib is licensed under the zlib License (https://www.zlib.net/zlib_license.html).
# re2 is licensed under the BSD License (https://github.com/google/re2/blob/main/LICENSE).

set(CMAKE_FIND_LIBRARY_SUFFIXES .a)
set(BUILD_SHARED_LIBS OFF)
set(CMAKE_EXE_LINKER_FLAGS "-static -lz -lre2")

add_compile_options(-march=native -DIW_IMPLEMENTATIONS_EXPOSED)

add_subdirectory(Foundational/iwaray)
add_subdirectory(Foundational/accumulator)
add_subdirectory(Foundational/iwstring)
add_subdirectory(Foundational/cmdline)
add_subdirectory(Foundational/cmdline_v2)
add_subdirectory(Foundational/data_source)
add_subdirectory(Foundational/histogram)
add_subdirectory(Foundational/iwbits)
add_subdirectory(Foundational/iwmisc)
add_subdirectory(Foundational/iwqsort)
add_subdirectory(Foundational/iw_tdt)
add_subdirectory(Foundational/jama)
add_subdirectory(Foundational/string_data_source)
add_subdirectory(Foundational/tnt)
add_subdirectory(Foundational/xmlParser)
add_subdirectory(Utilities/General)
add_subdirectory(Utilities/GFP_Tools)
add_subdirectory(Molecule_Lib)
add_subdirectory(Molecule_Tools)

# configure_file(Foundational/iwaray/iwaray.h iwaray.h)

