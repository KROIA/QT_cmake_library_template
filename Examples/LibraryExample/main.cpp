#include <QApplication>
#include <iostream>
#include "LibraryName.h"

int main(int argc, char* argv[])
{
	QApplication app(argc, argv);
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
	QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);



	return app.exec();
}