#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <services/internet/broadcaster.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<Broadcaster>("Internet", 1, 0, "Broadcaster");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
