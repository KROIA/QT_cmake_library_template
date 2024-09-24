# Logger integration
If the library detects, that the [Logger](https://github.com/KROIA/Logger) dependency is available,<br>
A library wide logger instance gets included.

``` C++
// The Logger library is automaticly included if the logger dependency .cmake file is available
#if defined(LOGGER)
    #include "Logger.h"
#endif
```
The macro "LOGGER" gets defined by the [Logger.cmake](https://github.com/KROIA/Logger/blob/main/Logger.cmake)  dependency file.<br>

The Logger is availabe using the singelton implementation LibraryNamespace::Logger.<br>
This class contains a Log::LogObject instance with the name of the library.
Use this instance as logger for your library.<br>
You can add more specific logger instances in your library but make sure to set the parent id from the LibraryNamespace::Logger::getParentID() to the child instances to preserve the hirarchy.<br>

