# Hot to use

## Setup the enviroment
This library template is designed for QT projects. Therefore QT is required to work without any problems.
### Dependencies
* CMake
* Visual Studio
  * Cmake plugin (may be integrated already in visual studio)
  * QT Visual studio tools
* QT
  * QT5 or QT6
  * Any msvc compiler


### QT installation
Install QT normaly, make shure to install it to the Path: **C:\Qt** otherwise you have to change the Qt path for every project you create from this template. **C:\Qt** is the default path.

---

## Library structure
The folderstructure of a library using this template looks like this:<br>
``` 
├───cmake
├───core
│   ├───inc
│   ├───resources
│   │   └───icons
│   └───src
├───dependencies
├───examples
│   └───LibraryExample
└───unitTests
    └───ExampleTest
        └───tests
```
- **cmake folder**
This folder contains cmake files that are used by the library template, do not change them.
- **[core folder](documentation/CoreFolder.md)**
The core folder contains the source code of the library.
- **[examples folder](documentation/ExamplesFolder.md)**
Example projects automaticly receive the dependency of the library and can be used to create examples of how to use the library.
- **[unitTests folder](documentation/UnitTestsFolder.md)**
Unittests can be used to automaticly test your library.

A **build** folder gets created automaticly. It contains the compiled binaries and library files.
For a clean build, delete this folder and reconfigure the CMake cache.

A **installation** folder gets created when you install the library. It contains a copy of the binaries, libraries and header files ready to include in any other project. 

---

## Library setup
There are 2 ways how you can create and manage a library using this template. 
* **(Recommended)** Using the [Cmake Lib Creator](https://github.com/KROIA/CmakeLibCreator).
Go to its repo to learn how to use the tool.
* If you want to do all stuff manually, [click here](CreateLibraryManually.md)

---

## Library configuration
[click here to visit this chapter](ConfigureTheProject.md)
## Library modification
[click here to visit this chapter](ModifyingTheProject.md)
## Implementation of your library code
[click here to visit this chapter](ImplementingYourOwnCode.md)