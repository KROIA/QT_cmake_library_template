## description: EASTL stands for Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance. 
include(FetchContent)

function(dep LIBRARY_MACRO_NAME SHARED_LIB STATIC_LIB STATIC_PROFILE_LIB INCLUDE_PATHS)
    set(LIB_NAME EASTL)
	set(LIB_MACRO_NAME EASTL_LIBRARY_AVAILABLE)
    set(GIT_REPO https://github.com/electronicarts/EASTL.git)
    set(GIT_TAG master)

    # Allow old CMakeLists.txt to work: suppress the version-too-old error by telling CMake
    # to interpret cmake_minimum_required(VERSION 3.5) as if it was cmake_minimum_required(VERSION 3.20)
    set(CMAKE_POLICY_VERSION_MINIMUM 3.5)

    downloadExternalLibrary()
endfunction()

dep(DEPENDENCY_NAME_MACRO 
    DEPENDENCIES_FOR_SHARED_LIB 
    DEPENDENCIES_FOR_STATIC_LIB 
    DEPENDENCIES_FOR_STATIC_PROFILE_LIB 
    DEPENDENCIES_INCLUDE_PATHS)