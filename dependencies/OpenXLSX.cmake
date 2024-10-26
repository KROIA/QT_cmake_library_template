## description: OpenXLSX is a C++ library for reading, writing, creating and modifying Microsoft Excel® files, with the .xlsx format.
include(FetchContent)

# All credits go to the owner of the OpenXLSX repository
function(dep LIBRARY_MACRO_NAME SHARED_LIB STATIC_LIB STATIC_PROFILE_LIB)
    # Define the git repository and tag to download from
    set(LIB_NAME OpenXLSX)								# Change this line
    set(LIB_MACRO_NAME OPEN_XLSX_LIBRARY_AVAILABLE)
    set(GIT_REPO https://github.com/troldal/OpenXLSX.git)	# Change this line
    set(GIT_TAG master)										# Change this line

    FetchContent_Declare(
        ${LIB_NAME}
        GIT_REPOSITORY ${GIT_REPO}
        GIT_TAG        ${GIT_TAG}
    )
   
    # Check if the library has already been populated
    FetchContent_GetProperties(${LIB_NAME})
    if(NOT ${LIB_NAME}_ALREADY_POPULATED OR NOT ${LIB_NAME}_SOURCE_DIR OR NOT ${LIB_NAME}_BINARY_DIR)
        message("Downloading dependency: ${LIB_NAME} from: ${GIT_REPO} tag: ${GIT_TAG}")
        FetchContent_MakeAvailable(${LIB_NAME})
        # Set a persistent cache variable to mark the library as populated
        set(${LIB_NAME}_ALREADY_POPULATED TRUE CACHE INTERNAL "Mark ${LIB_NAME} as populated")
    else()
        # Re-run MyLibrary's CMakeLists.txt to set up include dirs, libraries, etc.
        add_subdirectory("${${LIB_NAME}_SOURCE_DIR}" "${${LIB_NAME}_BINARY_DIR}" EXCLUDE_FROM_ALL)
    endif()

    # Add this library to the specific profiles of this project
    list(APPEND DEPS_FOR_SHARED_LIB ${LIB_NAME})
    list(APPEND DEPS_FOR_STATIC_LIB ${LIB_NAME})
    list(APPEND DEPS_FOR_STATIC_PROFILE_LIB ${LIB_NAME}) # only use for static profiling profile

    set(${LIBRARY_MACRO_NAME} "${${LIBRARY_MACRO_NAME}};${LIB_MACRO_NAME}" PARENT_SCOPE)
    set(${SHARED_LIB} "${${SHARED_LIB}};${DEPS_FOR_SHARED_LIB}" PARENT_SCOPE)
    set(${STATIC_LIB} "${${STATIC_LIB}};${DEPS_FOR_STATIC_LIB}" PARENT_SCOPE)
    set(${STATIC_PROFILE_LIB} "${${STATIC_PROFILE_LIB}};${DEPS_FOR_STATIC_PROFILE_LIB}" PARENT_SCOPE)
endfunction()

dep(DEPENDENCY_NAME_MACRO DEPENDENCIES_FOR_SHARED_LIB DEPENDENCIES_FOR_STATIC_LIB DEPENDENCIES_FOR_STATIC_PROFILE_LIB)