# Configure the project
All the settings described here can be edited using the [Cmake Lib Creator](https://github.com/KROIA/CmakeLibCreator).

## Overview
* [Root CMakeLists.txt](#root-cmakeliststxt)
* [Dependencies](#dependencies)
* [C++ Headers](#c-headers)
  * [LibraryName_info.h](#libraryname_infoh)

## CMake
### Root CMakeLists.txt
The root CMakeLists.txt contains settings to configure the library. 

> 💡 **set_if_not_defined** is a function that checks if a CMake variable exists, if it does exist, the value will not be changed.<br>If it does not exist, the value gets assigned to the variable. 

---
``` cmake
# Name of the library
set(LIBRARY_NAME LibraryName)                   # <AUTO_REPLACED>
```
The **LIBRARY_NAME** variable holds the name of the library.

---
``` cmake
# Define is only active if the library is built
set(LIB_DEFINE LIBRARY_NAME_LIB)                # <AUTO_REPLACED>
```
The **LIB_DEFINE** creates a macro name which enables the dllexport/import switch in the LibraryName_global.h

---
``` cmake
# macro to enable profiling
set(LIB_PROFILE_DEFINE LIBRARY_NAME_SHORT_PROFILING)  # <LIB_PROFILE_DEFINE>  
```
The LIB_PROFILE_DEFINE creates a macro name which gets automaticly defined when selecting the profile version of the targets inside visual studio.

---
``` cmake
# Enable/disable QT modules
set(QT_ENABLE ON)	                            # <AUTO_REPLACED> 
# Enable/disable QT deployment
set_if_not_defined(QT_DEPLOY ON)	            # <AUTO_REPLACED> 

# Needed QT modules                             # <AUTO_REPLACED> 
set(QT_MODULES
  Core
  Widgets
)
```
* **QT_ENABLE** If you disable this setting, CMake will not search for Qt modules and also does not create moc headers. The compiler will stil be used from the Qt installation.
* **QT_DEPLOY** If set to ON, CMake will automaticly use the [windeployqt.exe](https://doc.qt.io/qt-5/windows-deployment.html) on all your executables when you install the library.
If it is set to OFF, you have to call [windeployqt.exe](https://doc.qt.io/qt-5/windows-deployment.html)  manually.
* **QT_MODULES** Defines a list of Qt modules, needed for your library to work. 

---
``` cmake
# Library file name settings
set(DEBUG_POSTFIX_STR "-d")                     # <AUTO_REPLACED> 
set(STATIC_POSTFIX_STR "-s")                    # <AUTO_REPLACED> 
set(PROFILING_POSTFIX_STR "-p")                 # <AUTO_REPLACED>  

# Langauge settings
set(CMAKE_CXX_STANDARD 23)                      # <AUTO_REPLACED> 
set(CMAKE_CXX_STANDARD_REQUIRED ON)             # <AUTO_REPLACED> 
```
* The postfix strings are used to name the dll's and lib files. Usefull because you can compile all variants without overriding the files. Depending on which one you need, you than can include a specific type in the project that uses your library.
* CMAKE_CXX_STANDARD defines the c++ standard for your library.

---
``` cmake
# User specific defines which are added as defines to the compiler
# Note: The defines are only available inside the library.
#       Do not use them in headers which are visible by the user of the library.
# Example:
# list(APPEND USER_SPECIFIC_DEFINES 
#    "TEST_DEFINE"
# )
# 
list(APPEND USER_SPECIFIC_DEFINES 
)
```
The list USER_SPECIFIC_DEFINES holds custom macro names used for compilating the library.
>⚠️ These defines are not defined when you use this library as dependency. It is only available during compilation of the library. If you use a macro in a header file of your library for example to generate code, the code will not be generated in the main application that includes your library.

---
``` cmake
set_if_not_defined(QT_INSTALL_BASE "C:/Qt")
set_if_not_defined(QT_MAJOR_VERSION 5)
set_if_not_defined(QT_VERSION "autoFind")
set_if_not_defined(QT_COMPILER "autoFind")
```
Settings for your Qt installation. 
* **QT_INSTALL_BASE** Set the path to your Qt installation.
* **QT_MAJOR_VERSION** Define which major version of Qt you want to use 5 or 6.
* **QT_VERSION** Define which exact Qt version you want to use.
"5.15.1" for example. If you set it to "autoFind", CMake will try to search for the newest installed version that fits you major version setting.
* **QT_COMPILER** Define which exact compiler of that Qt version you want to use.
"msvc2019_64" for example. If you set it to "autoFind", CMake will try to search for the newest installed compiler version that fits you given Qt version setting.

---
## Dependencies
If you need external dependencies for your library to work you have to know if your dependency uses this tamplate too or not.

### Dependency uses this template
If the creator of that dependency did everithing right, you simply can go to his git repository and search for its **LibraryName.cmake** file which should be located in the root folder. Copy that file to your libraries **dependencies** folder. 
To load the dependency, you have to clean the CMake cache and reconfigure it.

### Dependency does not use this template
You have to create a DependencyName.cmake file for your dependency. If your dependency does not use CMake as build system, you have to be crative in order to make it available for cmake in that DependencyName.cmake file.
I can't cover that here.
[click here to learn how to create a cmake file for special repositories.](dependencies.md#Create-a-dependency-file-from-special-repository)

---
## C++ Headers
### LibraryName_info.h

``` C++
class LIBRARY_NAME_EXPORT LibraryInfo
{
...
public:
...
    // Current version of the library
    static constexpr int versionMajor				= 0;
    static constexpr int versionMinor				= 0;
    static constexpr int versionPatch				= 0;

    static constexpr Version version{ versionMajor, versionMinor, versionPatch };

    // Library name
    static constexpr const char* name				= "LibraryName";
    static constexpr const char* author				= "";
    static constexpr const char* email				= "";
    static constexpr const char* website			= "";
    static constexpr const char* license			= "MIT";
    static constexpr const char* compilationDate                = __DATE__;
    static constexpr const char* compilationTime                = __TIME__;
    ...
};
```
This header is used to do define informations about your library. It is self-explanatory which parameters stand for what. Do not change the variable names.