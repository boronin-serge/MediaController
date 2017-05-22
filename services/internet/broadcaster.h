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


    public slots:
        void bind(int port);
        void send(QString str, qint8 type);
        void read();

    private:
        int _port;
};

#endif // BROADCASTER_H

