# Logger integration
If the library detects, that the [Logger](https://github.com/KROIA/Logger) dependency is available, a library wide logger instance gets included.

``` C++
// LibraryName_debug.h
// The Logger library is automaticly included if the logger dependency .cmake file is available
#if LOGGER_LIBRARY_AVAILABLE == 1
    #include "Logger.h"
#endif
```
The macro `LOGGER_LIBRARY_AVAILABLE` gets defined by the [Logger.cmake](https://github.com/KROIA/Logger/blob/main/Logger.cmake)  dependency file.

The Logger is availabe using the singelton implementation `LibraryNamespace::Logger`.
This class contains a `Log::LogObject` instance with the name of the library.
Use this instance as logger for your library.



## How to use the loger
``` C++
// MyClass.cpp
#include "MyClass.h"

namespace LibraryNamespace
{
    MyClass::MyClass()
    {
    }   
    MyClass::~MyClass()
    {
    }

    void MyClass::printMessage()
    {
    	Logger::logInfo("Hello from MyClass");
    }
}
```
In this example a simple class methode does print a text to the logger.
`Logger` is a static class for easy access.

---

``` C++
#include <QApplication>
#include "LibraryName.h"

int main(int argc, char* argv[])
{
	QApplication app(argc, argv);

	Log::UI::createConsoleView(Log::UI::qConsoleView);
	Log::UI::QConsoleView::getStaticInstance()->show();

	LibraryNamespace::MyClass myClass;
	myClass.printMessage();

	return app.exec();
}
```
In order to see the logs in a console, you have to open a console. The example in this code creates one type of console.

``` C++
Log::UI::createConsoleView(Log::UI::qConsoleView);
Log::UI::QConsoleView::getStaticInstance()->show();

Log::UI::createConsoleView(Log::UI::nativeConsoleView);
Log::UI::NativeConsoleView::getStaticInstance()->show();

Log::UI::createConsoleView(Log::UI::qTreeConsoleView);
Log::UI::QTreeConsoleView::getStaticInstance()->show();
```
A list of all available console types is shown in the code above.

---


## Custom logger
``` C++ 
// MyClass.h
#pragma once
#include "LibraryName_base.h"

namespace LibraryNamespace
{
    class LIBRARY_NAME_API MyClass
    {
        public:
            MyClass();
            ~MyClass(); 
    	    void printMessage();
    	private:
            Log::LogObject customLogger;
    };
}
```

``` C++
// MyClass.cpp
#include "MyClass.h"

namespace LibraryNamespace
{
    MyClass::MyClass()
        : customLogger("customLoggerName")
    {
        // Set the custom logger as child of the library logger
        customLogger.setParentID(Logger::getParentID())
    }   
    MyClass::~MyClass()
    {
    }

    void MyClass::printMessage()
    {
    	customLogger.logInfo("Hello from MyClass");
    }
}
```



