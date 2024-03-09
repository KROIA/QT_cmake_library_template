#ifdef QT_ENABLED
#include <QApplication>
#endif
#include <iostream>
#include "LibraryName.h"

#ifdef QT_WIDGETS_ENABLED
#include <QWidget>
#endif


int main(int argc, char* argv[])
{
#ifdef QT_WIDGETS_ENABLED
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
	QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);
#endif
#ifdef QT_ENABLED
	QApplication app(argc, argv);
#endif

	LibraryNamespace::LibraryInfo::printInfo();
#ifdef QT_WIDGETS_ENABLED
	QWidget* widget = LibraryNamespace::LibraryInfo::createInfoWidget();
	if (widget)
		widget->show();
#endif
#ifdef QT_ENABLED
	return app.exec();
#else
	return 0;
#endif
}