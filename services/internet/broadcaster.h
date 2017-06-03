#ifndef BROADCASTER_H
#define BROADCASTER_H

#include <QObject>
#include <QUdpSocket>


class Broadcaster : public QObject
{
        Q_OBJECT

    public:
        Broadcaster(QObject *parent = 0);

        QUdpSocket *socket;

    signals:
        void finded();

    public slots:
        void send(QString str, qint8 type);
        void read();
        QString localIP();
        QString deviceIP();

    private:
        int _port;
        QHostAddress* deviceAdress;
};

#endif // BROADCASTER_H

