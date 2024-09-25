# How to use a library, made from this template

## Usage in an other library based on the tamplate
Each library that was created using this template, shuld contain a LibraryName.cmake file in the main folder of the repository. This cmake file is used, when the library is added as a dependency.<br>
Simply copy that cmake file to your projects dependency folder and reconfigure cmake in visual studio.

## Standalone build
Download the repository and run the build.bat file or compile the library using visual studio.
In visual studio, make shure to "build->install" the project. That creates a new folder: "installation".<br>
In the installation folder, you can find all binaries and library files and also the headers, ready to be included in your main project that depends on that library.


