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