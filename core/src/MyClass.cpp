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