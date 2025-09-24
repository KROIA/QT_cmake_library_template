## description: This description will be used as tooltip
include(FetchContent)

function(dep LIBRARY_MACRO_NAME SHARED_LIB STATIC_LIB STATIC_PROFILE_LIB INCLUDE_PATHS)
    # Define the git repository and tag to download from
    set(LIB_NAME AppSettings)								# Change this line
    set(LIB_MACRO_NAME APP_SETTINGS_LIBRARY_AVAILABLE)		# Change this line
    set(GIT_REPO https://github.com/KROIA/AppSettings.git)	# Change this line
    set(GIT_TAG main)										# Change this line
    set(NO_EXAMPLES True)	
    set(NO_UNITTESTS True)
    set(ADDITIONAL_INCLUDE_PATHS )

    downloadStandardLibrary()
endfunction()

dep(DEPENDENCY_NAME_MACRO
    DEPENDENCIES_FOR_SHARED_LIB 
    DEPENDENCIES_FOR_STATIC_LIB 
    DEPENDENCIES_FOR_STATIC_PROFILE_LIB 
    DEPENDENCIES_INCLUDE_PATHS)
