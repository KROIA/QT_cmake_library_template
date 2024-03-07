#include <QApplication>
#include <iostream>
#include "LibraryName.h"
#include <easy/profiler.h>

int main(int argc, char* argv[])
{
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
	QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);

	QApplication app(argc, argv);

	LibraryNamespace::LibraryInfo::printInfo();
	EASY_PROFILER_ENABLE;
	/* do work */
	profiler::dumpBlocksToFile("test_profile.prof");
	return app.exec();
}