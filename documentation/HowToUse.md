# How to use
## Overview
* [Setup the environment](#setup-the-environment)
  * [Dependencies](#dependencies)
  * [Qt installation](#qt-installation)
* [Library structure](#library-structure)
* [Library setup](#library-setup)
* [Library configuration](ConfigureTheProject.md)
* [Library modification](ModifyingTheProject.md)
* [Implementation of your library code](ImplementingYourOwnCode.md)
* [Dependencies and local development](Dependencies.md)

---
## Setup the environment
This library template is designed for Qt projects. Therefore Qt is required.
### Dependencies
* [CMake](https://cmake.org/download/)
* [Visual Studio](https://visualstudio.microsoft.com/de/downloads/)
  * [CMake plugin](https://learn.microsoft.com/en-us/cpp/build/cmake-projects-in-visual-studio?view=msvc-170) (may be integrated already in Visual Studio)
  * [Qt Visual Studio Tools](https://doc.qt.io/qtvstools/qtvstools-how-to-install.html)
* [Qt](https://www.qt.io/download-dev)
  * Qt5 or Qt6
  * Any MSVC compiler
* [Git](https://git-scm.com/)


### Qt installation
Install Qt normally. Make sure to install it to the path: **C:\Qt** — otherwise you have to change the Qt path for every project you create from this template. **C:\Qt** is the default path.

---

## Library structure
The folder structure of a library using this template looks like this:<br>
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
- **cmake folder** —
This folder contains CMake files that are used by the library template. Do not change them.
- **[core folder](CoreFolder.md)** —
The core folder contains the source code of the library.
- **[examples folder](ExamplesFolder.md)** —
Example projects automatically receive the dependency of the library and can be used to create examples of how to use the library.
- **[unitTests folder](UnitTestsFolder.md)** —
Unit tests can be used to automatically test your library.
- **[dependencies folder](Dependencies.md)** —
Contains `.cmake` files that define each external dependency. See the [Dependencies](Dependencies.md) page for details on adding dependencies and on the local-dependency workflow.

A **build** folder gets created automatically. It contains the compiled binaries and library files.
For a clean build, delete this folder and reconfigure the CMake cache.

An **installation** folder gets created when you install the library. It contains a copy of the binaries, libraries, and header files ready to include in any other project. 

### Cleaning the build
`build.bat` provides three clean targets so you do not have to wipe everything by hand:

* `build.bat clean` — removes `build/Debug`, `build/Release`, and `installation/`. **Preserves** the dependency cache under `build/dependencies/`, so the next build does not have to re-fetch external dependencies.
* `build.bat clean-deps` — removes `build/dependencies/cache/*-build` and `build/dependencies/cache/*-subbuild`. **Preserves** the `*-src` source downloads, so dependencies are not re-fetched, only re-configured. Useful after a generator mismatch.
* `build.bat clean-all` — removes everything under `build/` and `installation/`. Forces a full re-fetch on the next build.

All targets are idempotent — they are safe to run from a fresh checkout or any partial state.
Run `build.bat help` to print the list.

---

## Library setup
There are two ways to create and manage a library using this template:
* **(Recommended)** Using the [CMake Lib Creator](https://github.com/KROIA/CmakeLibCreator).
Go to its repo to learn how to use the tool.
* If you want to do everything manually, [click here](CreateLibraryManually.md).

---

## Library configuration
[Click here to visit this chapter](ConfigureTheProject.md)
## Library modification
[Click here to visit this chapter](ModifyingTheProject.md)
## Implementation of your library code
[Click here to visit this chapter](ImplementingYourOwnCode.md)
