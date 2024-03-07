#include <QApplication>
#include <iostream>
#include "LibraryName.h"

#include <QWidget>


int main(int argc, char* argv[])
{
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
	QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);

	QApplication app(argc, argv);

	LibraryNamespace::LibraryInfo::printInfo();
//#ifdef QT_WIDGETS_ENABLED
	QWidget* widget = LibraryNamespace::LibraryInfo::createInfoWidget();
	widget->show();
//#endif
	return app.exec();
}