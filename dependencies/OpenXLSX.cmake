## description: OpenXLSX is a C++ library for reading, writing, creating and modifying Microsoft Excel® files, with the .xlsx format.

# All credits go to the owner of the OpenXLSX repository
function(dep LIBRARY_MACRO_NAME SHARED_LIB STATIC_LIB STATIC_PROFILE_LIB INCLUDE_PATHS)
    # Define the git repository and tag to download from
    set(LIB_NAME OpenXLSX)								# Change this line
    set(LIB_MACRO_NAME OPEN_XLSX_LIBRARY_AVAILABLE)
    set(GIT_REPO https://github.com/troldal/OpenXLSX.git)	# Change this line
    set(GIT_TAG master)										# Change this line

    downloadExternalLibrary()
endfunction()

dep(DEPENDENCY_NAME_MACRO 
    DEPENDENCIES_FOR_SHARED_LIB 
    DEPENDENCIES_FOR_STATIC_LIB 
    DEPENDENCIES_FOR_STATIC_PROFILE_LIB 
    DEPENDENCIES_INCLUDE_PATHS)