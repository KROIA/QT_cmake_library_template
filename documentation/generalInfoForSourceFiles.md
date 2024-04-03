# General info for template files
This template is designed to be upgraded using a newer version of the template.
Since it is possible that you need specific changes in the cmake/c++ files it is nessesarry that such changes are not overwritten during the upgrade process.
For this purpose are specific user sections defined in the template files.

For cmake files, these sections look like this:<br>
``` cmake
...
## USER_SECTION_START 1

## USER_SECTION_END
...
## USER_SECTION_START 2

## USER_SECTION_END
...
``` 
For .cpp/.h files, these sections look like this:<br>
``` c++
...
/// USER_SECTION_START 1

/// USER_SECTION_END
...
/// USER_SECTION_START 2

/// USER_SECTION_END
...
``` 

Do not change the number because this is used to identify the location, where the user section belongs to.
In the upgrade process, the sections will be sorted back to the section with the same number in the upgraded file.
If you see that the numbers are not sorted in the file, don't worry, that only means that the template got some additional new usersections. 
The numbers can not be changed because if the number order is changed in the template, the inserted user code would be at a different location.

