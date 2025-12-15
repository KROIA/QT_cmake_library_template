# How to modify the template files
This template is designed to be upgraded with a newer version of the template.
To be able to upgrade the template files, they have to be replaced.
Since it is possible that you need specific changes in the cmake/c++ files it is nessesarry that such changes are not overwritten during the upgrade process.
For this purpose, specific user sections are defined which can hold your modifications.

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

**Do not change the number** of the sections, because this is used to identify the location, where the user section belongs to.
In the upgrade process, the sections will be sorted back to the section with the same number in the upgraded file.
If you see that the numbers are not sorted in the file, don't worry, that only means that the template got some additional new usersections. 
The numbers can not be changed because if the number order is changed in the template, the inserted user code would be at a different location.
**Do not add/remove user sections**, because that may cause problems to upgrade the files.

## Example
In the file LibraryName_global.h is a section with the following code:
``` C++
/// USER_SECTION_START 4

/// USER_SECTION_END

#if defined(LIBRARY_NAME_LIB)
	#pragma warning (error : 4715) // not all control paths return a value should be an error instead of a warning
	#pragma warning (error : 4700) // uninitialized local variable used should be an error instead of a warning
	#pragma warning (error : 4244) // Implicit conversions between data types 
	#pragma warning (error : 4100) // Unused variables
	#pragma warning (error : 4018) // Type mismatch 
	#pragma warning (error : 4996) // Unsafe function calls
	#pragma warning (error : 4456) // declaration of 'x' hides previous local declaration
	#pragma warning (error : 4065) // switch statement contains 'default' but no 'case' labels
	#pragma warning (error : 4189) // Unused return value
	#pragma warning (error : 4996) // unsafe function calls
	#pragma warning (error : 4018) // signed/unsigned mismatch
	#pragma warning (error : 4172) // Returning address of local temporary object
#endif

/// USER_SECTION_START 5

/// USER_SECTION_END
```

If you don't want this code in your library, don't remove it! Just make it commented out:
``` C++
/// USER_SECTION_START 4
/*
/// USER_SECTION_END

#if defined(LIBRARY_NAME_LIB)
	#pragma warning (error : 4715) // not all control paths return a value should be an error instead of a warning
	#pragma warning (error : 4700) // uninitialized local variable used should be an error instead of a warning
	#pragma warning (error : 4244) // Implicit conversions between data types 
	#pragma warning (error : 4100) // Unused variables
	#pragma warning (error : 4018) // Type mismatch 
	#pragma warning (error : 4996) // Unsafe function calls
	#pragma warning (error : 4456) // declaration of 'x' hides previous local declaration
	#pragma warning (error : 4065) // switch statement contains 'default' but no 'case' labels
	#pragma warning (error : 4189) // Unused return value
	#pragma warning (error : 4996) // unsafe function calls
	#pragma warning (error : 4018) // signed/unsigned mismatch
	#pragma warning (error : 4172) // Returning address of local temporary object
#endif

/// USER_SECTION_START 5
*/
/// USER_SECTION_END
```
