cmake_minimum_required(VERSION 3.20)


## --------------------------------------------------------------------------------
## -------------------- Project settings ------------------------------------------
## --------------------------------------------------------------------------------

set(LIBRARY_NAME LibraryName)                           # Name of the library
set(LIB_DEFINE LIBRARY_NAME_LIB)                        # Define is only active if the library is built
set(LIB_PROFILE_DEFINE LIBRARY_NAME_SHORT_PROFILING)    # macro to enable profiling



set(QT_ENABLE ON)	# Enable/disable QT modules
set(QT_DEPLOY ON)	# Enable/disable QT deployment

# Needed QT modules
set(QT_MODULES
    Core
    Widgets
    # Add any other required modules here
)

# Library file name settings
set(DEBUG_POSTFIX_STR  "-d")
set(STATIC_POSTFIX_STR "-s")
set(PROFILING_POSTFIX_STR "-p")

# Langauge settings
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --------------------------------------------------------------------------------
# -------------------- Build settings --------------------------------------------
# --------------------------------------------------------------------------------

set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR})   # Default install path
set(RELATIVE_BUILD_FOLDER build)                # Relative path to the build folder
set(RELATIVE_INSTALL_FOLDER lib)                # Relative path to the install folder

# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------

project(${LIBRARY_NAME})
 
# Set output paths
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/${RELATIVE_BUILD_FOLDER}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/${RELATIVE_BUILD_FOLDER}")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/${RELATIVE_BUILD_FOLDER}")

set(INSTALL_LIB_PATH "${CMAKE_INSTALL_PREFIX}/${RELATIVE_INSTALL_FOLDER}")
set(INSTALL_BIN_PATH "${CMAKE_INSTALL_PREFIX}/bin")
# create bin folder

link_directories(${CMAKE_LIBRARY_OUTPUT_DIRECTORY})


include(cmake/QtLocator.cmake)
include(cmake/utility.cmake)
include(cmake/dependencies.cmake)


add_subdirectory(core)
add_subdirectory(examples)
add_subdirectory(unitTests)

