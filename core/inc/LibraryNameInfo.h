#pragma once
#include "LibraryNameShort_base.h"
#include <sstream>



namespace LibraryNamespace
{
	class LIBRARY_NAME_EXPORT LibraryInfo
	{
		LibraryInfo() = delete;
		LibraryInfo(const LibraryInfo&) = delete;
	public:
		// Current version of the library
		static constexpr int versionMajor				= 0;
		static constexpr int versionMinor				= 0;
		static constexpr int versionPatch				= 0;

		// Library name
		static constexpr const char* name				= "LibraryName";
		static constexpr const char* author				= "";
		static constexpr const char* email				= "";
		static constexpr const char* website			= "";
		static constexpr const char* license			= "MIT";
		static constexpr const char* compilationDate	= __DATE__;
		static constexpr const char* compilationTime	= __TIME__;

		// Compiler information
#ifdef _MSC_VER
		static constexpr const char* compiler			= "MSVC";
		static constexpr const long compilerVersion		= _MSC_VER;
#elif defined(__GNUC__)
		static constexpr const char* compiler			= "GCC";
		static constexpr const long compilerVersion		= __VERSION__;
#elif defined(__clang__)

		static constexpr const char* compiler			= "Clang";
		static constexpr const long compilerVersion		= __clang_version__;
#else
		static constexpr const char* compiler			= "Unknown";
		static constexpr const long compilerVersion		= "Unknown";
#endif

		// Build type
		enum class BuildType
		{
			debug,
			release
		};
#ifdef NDEBUG
		static constexpr const char* buildTypeStr		= "Release";
		static constexpr const BuildType buildType		= BuildType::release;
#else
		static constexpr const char* buildTypeStr		= "Debug";
		static constexpr const BuildType buildType		= BuildType::debug;
#endif

		static const std::string& versionStr()
		{
			static const std::string str = {
				'0' + versionMajor / 10,
				'0' + versionMajor % 10,
				'.',
				'0' + versionMinor / 10,
				'0' + versionMinor % 10,
				'.',
				'0' + versionPatch / 10,
				'0' + versionPatch % 10
			};
			return str;
		}

		static void printInfo();
		static void printInfo(std::ostream& stream);
	};
}