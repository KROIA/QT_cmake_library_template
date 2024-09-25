
# Create a library manually
In this chapter you will learn:
* How to create a library manually.
* How to change the projects name to your library name.
* Which things in the code must be changed to fit your library.

## Preparation
1) Make shure you have installed the enviroment correctly. 
Check out [Setup the enviroment](SetupEnviroment.md) 
2) Define a Library name for your library.
I will use the name **MyLibrary** in this tutorial.


## Download
1) Clone this repository to your local drive.
2) Change the downloaded folder name to your libraries name.

## Prepare placeholder replacements
The template contains many placeholders that have to be modified in order to fit your library's name.

* **LIBRARY_NAME_SHORT**
Short form of the library name, used in some macros of the library.
* **LIBRARY_NAME** 


| Placeholder    | replaced with |
| -------- | ------- |
| LIBRARY_NAME_SHORT    | ML    |
| LIBRARY_NAME | MY_LIBRARY     |
| LibraryNamespace | MyLibrary |
| LibraryName  | MyLibrary    |

## Necessary file modifications
* For every file below, find and replace every placeholder with its counterpart.
* Replace all filenames that contain a placeholder text with its counterpart.
For example the file LibraryName_base.h ➡️ MyLibrary_base.h

>💡 
Texts are case sensitive 
Texts are't necesarry whole words

>⚠️**It is important that you replace the placeholders in the exact order as the table has listed them.**
⚠️**Make sure you do the modifications to all these files.**


* Library files
  * LibraryName.h
  * LibraryName_base.h
  * LibraryName_debug.h
  * LibraryName_global.h
  * LibraryName_info.h
  * LibraryName_info.cpp
  * LibraryName_debug.cpp
* Example project files
  * main.cpp
* Unittest project files
  * main.cpp



The file CMakeLists.txt in the root folder needs special replacements:
``` cmake
... Original
# Name of the library
set(LIBRARY_NAME LibraryName)                   # <AUTO_REPLACED>
# Define is only active if the library is built
set(LIB_DEFINE LIBRARY_NAME_LIB)                # <AUTO_REPLACED>
# macro to enable profiling
set(LIB_PROFILE_DEFINE LIBRARY_NAME_SHORT_PROFILING)  # <LIB_PROFILE_DEFINE>  
...
```
``` cmake
... Modified
# Name of the library
set(LIBRARY_NAME MyLibrary)                   # <AUTO_REPLACED>
# Define is only active if the library is built
set(LIB_DEFINE MY_LIBRARY_LIB)                # <AUTO_REPLACED>
# macro to enable profiling
set(LIB_PROFILE_DEFINE ML_PROFILING)  # <LIB_PROFILE_DEFINE>  
...
```
