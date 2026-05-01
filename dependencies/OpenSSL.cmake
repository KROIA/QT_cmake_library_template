## description: OpenSSL is a cryptographic library that enables an open source implementation of Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols.

function(dep LIBRARY_MACRO_NAME SHARED_LIB STATIC_LIB STATIC_PROFILE_LIB INCLUDE_PATHS)
    # Define the git repository and tag to download from
    set(LIB_NAME OpenSSL)
	set(LIB_MACRO_NAME OPEN_SSL)

    # Install the library using the QT Maintenance Tool
    # Change the path to the installation directory of the library
    set(OPENSSL_ROOT_DIR "C:/Program Files/OpenSSL-Win64")
    set(OPENSSL_MSVC_STATIC_RT True)
    set(OPENSSL_USE_STATIC_LIBS  True)
    find_package(${LIB_NAME} REQUIRED COMPONENTS SSL Crypto)

    # Add this library to the specific profiles of this project
    list(APPEND DEPS_FOR_SHARED_LIB OpenSSL::SSL OpenSSL::Crypto)
    list(APPEND DEPS_FOR_STATIC_LIB OpenSSL::SSL OpenSSL::Crypto)
    list(APPEND DEPS_FOR_STATIC_PROFILE_LIB OpenSSL::SSL OpenSSL::Crypto)

	set(${LIBRARY_MACRO_NAME} "${${LIBRARY_MACRO_NAME}};${LIB_MACRO_NAME}" PARENT_SCOPE)
    set(${SHARED_LIB} "${${SHARED_LIB}};${DEPS_FOR_SHARED_LIB}" PARENT_SCOPE)
    set(${STATIC_LIB} "${${STATIC_LIB}};${DEPS_FOR_STATIC_LIB}" PARENT_SCOPE)
    set(${STATIC_PROFILE_LIB} "${${STATIC_PROFILE_LIB}};${DEPS_FOR_STATIC_PROFILE_LIB}" PARENT_SCOPE)
endfunction()

dep(DEPENDENCY_NAME_MACRO 
    DEPENDENCIES_FOR_SHARED_LIB 
    DEPENDENCIES_FOR_STATIC_LIB 
    DEPENDENCIES_FOR_STATIC_PROFILE_LIB 
    DEPENDENCIES_INCLUDE_PATHS)



#[[
# install-openssl.ps1
# Installs OpenSSL (full dev package) via winget on Windows x64.
# Includes headers, import libs, and DLLs required for CMake C++ projects.
# Run as Administrator for a system-wide install.

$packageId = "ShiningLight.OpenSSL.Dev"
$installDir = "C:\Program Files\OpenSSL-Win64"

Write-Host "Checking for existing OpenSSL installation..."
if (Test-Path "$installDir\include\openssl\ssl.h") {
    Write-Host "OpenSSL is already installed at: $installDir"
    Write-Host "To force reinstall, uninstall first: winget uninstall $packageId"
    exit 0
}

Write-Host "Installing OpenSSL Dev (headers + libs + DLLs)..."
winget install $packageId --accept-package-agreements --accept-source-agreements

if ($LASTEXITCODE -ne 0) {
    Write-Error "winget install failed (exit code $LASTEXITCODE). Make sure winget is available and you have internet access."
    exit 1
}

Write-Host ""
Write-Host "OpenSSL installed successfully."
Write-Host "Install path : $installDir"
Write-Host "Include path : $installDir\include"
Write-Host "Lib path     : $installDir\lib\VC\x64\MD"
Write-Host ""
Write-Host "CMake usage:"
Write-Host "  cmake -DOPENSSL_ROOT_DIR=`"$installDir`" .."
Write-Host "  -- or set OPENSSL_ROOT_DIR in your environment --"
Write-Host ""
Write-Host "CMakeLists.txt snippet:"
Write-Host "  find_package(OpenSSL REQUIRED)"
Write-Host "  target_link_libraries(your_target OpenSSL::SSL OpenSSL::Crypto)"
]]