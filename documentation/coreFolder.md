# Folder core
This folder contains the source code of the library, it is splitted in **inc**, **src** and **resources**<br>
- **inc** This is the folder that contains all header files.
- **src** This is the folder that contains all cpp source files.
- **resources** This is the folder that contains resources such as icons, images...
<div style="text-align: center;">
	<img src="core_files.png" alt="Overview" width="300"/>
</div>

## Files
### LibraryName.h
This header will be included in any project that uses your library.
It only contains the includes of all headers you want to expose to the user.
``` C++
#pragma once

/// USER_SECTION_START 1

/// USER_SECTION_END

#include "LibraryName_info.h"

/// USER_SECTION_START 2

/// USER_SECTION_END
``` 

Edited during development of the library:
``` C++
#pragma once

/// USER_SECTION_START 1

/// USER_SECTION_END

#include "LibraryName_info.h"

/// USER_SECTION_START 2
#include "FileFromTheLibrary1.h"
#include "FileFromTheLibrary2.h"
/// USER_SECTION_END
``` 

### LibraryName_base.h
This header is the base include in every header from the library.
It includes all headers that shuld be available to all headers from the library.
``` C++
#pragma once

/// USER_SECTION_START 1

/// USER_SECTION_END

#include "LibraryName_global.h"
#include "LibraryName_debug.h"
#include "LibraryName_info.h"

/// USER_SECTION_START 2

/// USER_SECTION_END
``` 
### LibraryName_debug.h
This header is used to debug/profile your library.<br>
It contains usefull macros to write to the console or to create profiling blocks.<br>
Visit the [profiling](EasyProfilerIntegration.md) section for more infos about profiling.<br>
Visit the [Logging](loggerIntegration.md) section for more infos about the logging integration.<br>



### LibraryName_global.h
This header contains the dllimport/export switch.
``` C++
...
#ifndef BUILD_STATIC
    #pragma message("LIBRARY_NAME_LIB is a shared library")
    #if defined(LIBRARY_NAME_LIB)
        #define LIBRARY_NAME_EXPORT __declspec(dllexport)
    #else
        #define LIBRARY_NAME_EXPORT __declspec(dllimport)
    #endif
#else 
    #pragma message("LIBRARY_NAME_LIB is a static library")
    #define LIBRARY_NAME_EXPORT
#endif
...
``` 

It also defines a macro that can be used to specify if a parameter of a function is not used inside the function.
``` C++
...
#define LIBRARY_NAME_SHORT_UNUSED(x) (void)x;
...
``` 

To help a little to find some programming errors, some warnings are changed to errors.
``` C++
...
#if defined(LIBRARY_NAME_LIB)
	#pragma warning (error : 4715) // not all control paths return a value shuld be an error instead of a warning
	#pragma warning (error : 4700) // uninitialized local variable used shuld be an error instead of a warning
	#pragma warning (error : 4244) // Implicit conversions between data types 
	#pragma warning (error : 4100) // Unused variables
	#pragma warning (error : 4018) // Type mismatch 
	#pragma warning (error : 4996) // Unsafe function calls
	#pragma warning (error : 4456) // declaration of 'x' hides previous local declaration
	#pragma warning (error : 4065) // switch statement contains 'default' but no 'case' labels
	#pragma warning (error : 4189) // Unused return value
	#pragma warning (error : 4996) // unsafe function calls
	#pragma warning (error : 4018) // signed/unsigned mismatch
#endif
...
``` 
If you do not want that the warnings are changed to errors, you can do the following trick.
Using the user sections, you can comment the whole section out.
``` C++
...
/// USER_SECTION_START 4
/*
/// USER_SECTION_END

#if defined(LIBRARY_NAME_LIB)
	#pragma warning (error : 4715) // not all control paths return a value shuld be an error instead of a warning
	#pragma warning (error : 4700) // uninitialized local variable used shuld be an error instead of a warning
	#pragma warning (error : 4244) // Implicit conversions between data types 
	#pragma warning (error : 4100) // Unused variables
	#pragma warning (error : 4018) // Type mismatch 
	#pragma warning (error : 4996) // Unsafe function calls
	#pragma warning (error : 4456) // declaration of 'x' hides previous local declaration
	#pragma warning (error : 4065) // switch statement contains 'default' but no 'case' labels
	#pragma warning (error : 4189) // Unused return value
	#pragma warning (error : 4996) // unsafe function calls
	#pragma warning (error : 4018) // signed/unsigned mismatch
#endif

/// USER_SECTION_START 5
*/
/// USER_SECTION_END
...
``` 

### LibraryName_info.h
This header contains the class ```LibraryInfo```, it contains some informations about the library.
It also contains a function to create a QWidget with the library infos.
``` C++
...
namespace LibraryNamespace
{

/// USER_SECTION_START 4

/// USER_SECTION_END

	class LIBRARY_NAME_EXPORT LibraryInfo
	{
		LibraryInfo() = delete;
		LibraryInfo(const LibraryInfo&) = delete;
	public:
	
		struct Version
		{
			int major;
			int minor;
			int patch;

			// compare two versions
			bool operator<(const Version& other) const;

			bool operator==(const Version& other) const;
			bool operator!=(const Version& other) const;
			bool operator>(const Version& other) const;
			bool operator<=(const Version& other) const;
			bool operator>=(const Version& other) const;
			std::string toString() const;
		};

		// Current version of the library
		static constexpr int versionMajor               = 0;
		static constexpr int versionMinor               = 0;
		static constexpr int versionPatch               = 0;

		static constexpr Version version{ versionMajor, versionMinor, versionPatch };

		// Library name
		static constexpr const char* name               = "LibraryName";
		static constexpr const char* author             = "";
		static constexpr const char* email              = "";
		static constexpr const char* website            = "";
		static constexpr const char* license            = "MIT";
		static constexpr const char* compilationDate    = __DATE__;
		static constexpr const char* compilationTime    = __TIME__;
        ...
    };
    ...
}
...
``` 
