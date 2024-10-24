## description: Dear ImGui backend for use with SFML 
include(FetchContent)

function(dep LIBRARY_MACRO_NAME SHARED_LIB STATIC_LIB STATIC_PROFILE_LIB INCLUDE_PATHS)
    set(LIB_NAME_1 imgui)
	set(LIB_MACRO_NAME_1 IMGUI_LIBRARY_AVAILABLE)
    set(GIT_REPO_1 https://github.com/ocornut/imgui.git)
    set(GIT_TAG_1 master)

    set(LIB_NAME_2 imgui-sfml )
	set(LIB_MACRO_NAME_2 IMGUI_SFML_LIBRARY_AVAILABLE)
    set(GIT_REPO_2 https://github.com/KROIA/imgui-sfml-fork.git)
    set(GIT_TAG_2 2.6.x)

    FetchContent_Declare(
        ${LIB_NAME_1}
        GIT_REPOSITORY ${GIT_REPO_1}
        GIT_TAG        ${GIT_TAG_1}
    )
    FetchContent_Declare(
        ${LIB_NAME_2}
        GIT_REPOSITORY ${GIT_REPO_2}
        GIT_TAG        ${GIT_TAG_2}
    )
    message("Downloading dependency: ${LIB_NAME_1} from: ${GIT_REPO_1} tag: ${GIT_TAG_1}")
    FetchContent_MakeAvailable(${LIB_NAME_1})

    set(IMGUI_DIR ${imgui_SOURCE_DIR})
    set(IMGUI_SFML_FIND_SFML OFF)
    set(IMGUI_SFML_IMGUI_DEMO ON)


    
    message("Downloading dependency: ${LIB_NAME_2} from: ${GIT_REPO_2} tag: ${GIT_TAG_2}")
    FetchContent_MakeAvailable(${LIB_NAME_2})

    
    # Add this library to the specific profiles of this project
    list(APPEND DEPS_FOR_SHARED_LIB ImGui-SFML::ImGui-SFML)
    list(APPEND DEPS_FOR_STATIC_LIB ImGui-SFML::ImGui-SFML)
    list(APPEND DEPS_FOR_STATIC_PROFILE_LIB ImGui-SFML::ImGui-SFML) # only use for static profiling profile
    list(APPEND INCS ${IMGUI_DIR} ) 

	set(${LIBRARY_MACRO_NAME} "${${LIBRARY_MACRO_NAME}};${LIB_MACRO_NAME_1};${LIB_MACRO_NAME_2}" PARENT_SCOPE)
    set(${SHARED_LIB} "${${SHARED_LIB}};${DEPS_FOR_SHARED_LIB}" PARENT_SCOPE)
    set(${STATIC_LIB} "${${STATIC_LIB}};${DEPS_FOR_STATIC_LIB}" PARENT_SCOPE)
    set(${STATIC_PROFILE_LIB} "${${STATIC_PROFILE_LIB}};${DEPS_FOR_STATIC_PROFILE_LIB}" PARENT_SCOPE)
    set(${INCLUDE_PATHS} "${${INCLUDE_PATHS}};${INCS}" PARENT_SCOPE)
endfunction()

dep(DEPENDENCY_NAME_MACRO DEPENDENCIES_FOR_SHARED_LIB DEPENDENCIES_FOR_STATIC_LIB DEPENDENCIES_FOR_STATIC_PROFILE_LIB DEPENDENCIES_INCLUDE_PATHS)
