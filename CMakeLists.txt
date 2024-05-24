cmake_minimum_required(VERSION 3.26)

project(
  simdjson-py
  VERSION 0.0.1
  LANGUAGES C CXX
  DESCRIPTION "Python native bindings for simdjson"
  HOMEPAGE_URL "https://github.com/lqhuang/simdjson-py"
)

# ----------------------------- Setup -----------------------------
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION on)

if(NOT SKBUILD)
  message(WARNING "\
  This CMake file is meant to be executed using 'scikit-build'. Running
  it directly will almost certainly not produce the desired result. If
  you are a user trying to install this package, please use the command
  below, which will install all necessary build dependencies, compile
  the package in an isolated environment, and then install it.
  =====================================================================
   $ pip install .
  =====================================================================
  If you are a software developer, and this is your own package, then
  it is usually much more efficient to install the build dependencies
  in your environment once and use the following command that avoids
  a costly creation of a new virtual environment at every compilation:
  =====================================================================
   $ pip install nanobind scikit-build-core[pyproject]
   $ pip install --no-build-isolation -ve .
  =====================================================================
  You may optionally add -Ceditable.rebuild=true to auto-rebuild when
  the package is imported. Otherwise, you need to re-run the above
  after editing C++ files.")
endif()

if(VENV)
  set(Python_EXECUTABLE "./.venv/bin/python3" CACHE STRING)
endif()

# ----------------------------- Lib -----------------------------
include(FetchContent)

# Try to import all Python components potentially needed by nanobind
find_package(Python 3.9
  REQUIRED COMPONENTS Interpreter Development.Module
  OPTIONAL_COMPONENTS Development.SABIModule
)
include_directories(${Python_INCLUDE_DIRS})

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

# Current project installs nanobind as a Pip or Conda package
# The following command query the package to detect the installed
# nanobind package path and import it into CMake
execute_process(
  COMMAND "${Python_EXECUTABLE}" -m nanobind --cmake_dir
  OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE NB_DIR)
list(APPEND CMAKE_PREFIX_PATH "${NB_DIR}")

# Import nanobind through CMake's find_package mechanism
find_package(nanobind CONFIG REQUIRED)

FetchContent_Declare(
  simdjson
  GIT_REPOSITORY https://github.com/simdjson/simdjson.git
  GIT_TAG tags/v3.6.0
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(simdjson)
include_directories(${simdjson_SOURCE_DIR}/include)

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/src/lib)

# ----------------------------- Installation -----------------------------
include(GNUInstallDirs)
