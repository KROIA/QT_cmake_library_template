## USER_SECTION_START 1

## USER_SECTION_END

# Find the necessary QT modules
#[[
set(QT_MODULES
    Core
    Widgets
    Gui
)
]]#

## Override the QT_MODULES if you want to use other modules
## USER_SECTION_START 2

## USER_SECTION_END

set(use_qt ${QT_ENABLE})                                # Use the same setting as the library, change to ON or OFF to enable or disable
set(deploy_qt {QT_DEPLOY})                              # Use the same setting as the library, change to ON or OFF to enable or disable
set(APP_ICON "${CMAKE_CURRENT_SOURCE_DIR}/AppIcon.rc")  # Set the icon for the application
list(APPEND ADDITONAL_SOURCES ${APP_ICON})               

## USER_SECTION_START 3

## USER_SECTION_END

list(APPEND ADDITIONAL_LIBRARIES UnitTest_static) 

## USER_SECTION_START 4

## USER_SECTION_END

exampleMaster(${LIBRARY_NAME} ${LIB_PROFILE_DEFINE} use_qt deploy_qt "${QT_MODULES}" "${ADDITONAL_SOURCES}" "${ADDITIONAL_LIBRARIES}" "${INSTALL_BIN_PATH}")

## USER_SECTION_START 5

## USER_SECTION_END
