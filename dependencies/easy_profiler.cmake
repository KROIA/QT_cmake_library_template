cmake_minimum_required(VERSION 3.1.0)


include(FetchContent)

set(DEBUG_POSTFIX_STR "-d")


FetchContent_Declare(
    EASY_PROFILER
    GIT_REPOSITORY https://github.com/yse/easy_profiler.git
    GIT_TAG        develop
)

set(EASY_PROFILER_NO_SAMPLES True)
set(BUILD_SHARED_LIBS OFF CACHE BOOL "Build easy_profiler as static library.")
FetchContent_MakeAvailable(EASY_PROFILER)

#set(EASY_PROFILER_NO_GUI False)
set_target_properties(easy_profiler PROPERTIES CMAKE_RUNTIME_OUTPUT_DIRECTORY ${RUNTIME_OUTPUT_DIRECTORY})
set_target_properties(easy_profiler PROPERTIES CMAKE_LIBRARY_OUTPUT_DIRECTORY ${RUNTIME_OUTPUT_DIRECTORY})
set_target_properties(easy_profiler PROPERTIES CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${RUNTIME_OUTPUT_DIRECTORY})
set_target_properties(easy_profiler PROPERTIES DEBUG_POSTFIX ${DEBUG_POSTFIX_STR})
target_compile_definitions(easy_profiler PUBLIC EASY_PROFILER_STATIC)

# Assuming LibraryA produces a target named "LibraryA::LibraryA", you can link it to your target
list(APPEND LIBRARIES_FROM_DEPENDENCIES easy_profiler)




## External dependencies
#include(FetchContent)
#set(FETCHCONTENT_BASE_DIR "${CMAKE_SOURCE_DIR}/dependencies/cache")
#set(RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/${RELATIVE_BUILD_FOLDER}")
#set(LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/${RELATIVE_BUILD_FOLDER}")
#set(ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/${RELATIVE_BUILD_FOLDER}")
#set(DEBUG_POSTFIX_STR "-d")
#
#function(setup_dep_easy_profiler)
##  EasyProfiler
#	set(EASY_GIT_REPO  https://github.com/yse/easy_profiler.git)
#	set(EASY_GIT_TAG   develop)
#
#
#	FetchContent_Declare(
#		EASY_PROFILER
#		GIT_REPOSITORY	${EASY_GIT_REPO}
#		GIT_TAG			${EASY_GIT_TAG}
#	)
#	message("Download dependency: ${EASY_GIT_REPO}")
#
#	set(EASY_PROFILER_NO_SAMPLES True)
#	set(BUILD_SHARED_LIBS OFF CACHE BOOL "Build easy_profiler as static library.")
#	FetchContent_MakeAvailable(EASY_PROFILER)
#
#
#	#set(EASY_PROFILER_NO_GUI False)
#	set_target_properties(easy_profiler PROPERTIES CMAKE_RUNTIME_OUTPUT_DIRECTORY ${RUNTIME_OUTPUT_DIRECTORY})
#	set_target_properties(easy_profiler PROPERTIES CMAKE_LIBRARY_OUTPUT_DIRECTORY ${RUNTIME_OUTPUT_DIRECTORY})
#	set_target_properties(easy_profiler PROPERTIES CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${RUNTIME_OUTPUT_DIRECTORY})
#	set_target_properties(easy_profiler PROPERTIES DEBUG_POSTFIX ${DEBUG_POSTFIX_STR})
#	target_compile_definitions(easy_profiler PUBLIC EASY_PROFILER_STATIC)
#
#endfunction()
#
#function(load_dep_easy_profiler libsContainer)
#	
#
#	#
#	set(${libsContainer} ${${libsContainer}} "easy_profiler" PARENT_SCOPE)
#endfunction()