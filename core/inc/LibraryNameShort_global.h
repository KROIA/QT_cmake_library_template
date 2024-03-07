#pragma once

#include <QtCore/qglobal.h>
#include <chrono>

#ifndef BUILD_STATIC
#pragma message("LIBRARY_NAME_LIB is a shared library")
# if defined(LIBRARY_NAME_LIB)
#  define LIBRARY_NAME_EXPORT __declspec(dllexport)
# else
#  define LIBRARY_NAME_EXPORT __declspec(dllimport)
# endif
#else 
#pragma message("LIBRARY_NAME_LIB is a static library")
# define LIBRARY_NAME_EXPORT
#endif

#ifdef QT_ENABLED
#pragma message("QT is enabled")
#endif

// MSVC Compiler
#ifdef _MSC_VER 
#define __PRETTY_FUNCTION__ __FUNCSIG__
typedef std::chrono::steady_clock::time_point TimePoint;
#else
typedef std::chrono::system_clock::time_point TimePoint;
#endif





#define LIBRARY_NAME_SHORT_UNUSED(x) (void)x;

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
