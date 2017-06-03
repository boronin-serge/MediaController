#include <QtNetwork>
#include "broadcaster.h"
#include <QNetworkInterface>

Broadcaster::Broadcaster(QObject *parent) : QObject(parent)
{
      socket = new QUdpSocket(this);
      connect(socket, SIGNAL(readyRead()), SLOT(read()));
      _port = 45454;
      socket->bind(QHostAddress::Any, _port);
      qDebug() << "binded";
}


QString Broadcaster::localIP()
{
  QString locIP;
  QList<QHostAddress> addr = QNetworkInterface::allAddresses();
  locIP = addr.first().toString();
  return locIP;
}


QString Broadcaster::deviceIP()
{
    if (deviceAdress == nullptr) {
        return "null";
    }

    QString ip = deviceAdress->toString().right(13);
    return ip;
}

void Broadcaster::send(QString str, qint8 type) {
  qDebug() << "my ip: " << localIP();
  QByteArray data;
  QDataStream out(&data, QIODevice::WriteOnly);
  out << qint64(0);
  out << qint8(type);
  out << str;
  out.device()->seek(qint64(0));
  out << qint64(data.size() - sizeof(qint64));
  socket->writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Broadcaster::read() {
  QByteArray datagram;
  datagram.resize(socket->pendingDatagramSize());
  QHostAddress *address = new QHostAddress();
  socket->readDatagram(datagram.data(), datagram.size(), address);

  QDataStream in(&datagram, QIODevice::ReadOnly);

  qint64 size = -1;
  if(in.device()->size() > sizeof(qint64)) {
    in >> size;
  } else return;
  if (in.device()->size() - sizeof(qint64) < size) return;

  qint8 type = 0;
  in >> type;
  QString str;
  in >> str;
  qDebug() << "readed: " << str << ": " << address->toString();

  if (address != nullptr) {
      deviceAdress = address;
      emit finded();
  }

//  if (type == USUAL_MESSAGE) {
//    QString str;
//    in >> str;
//    // код по перенаправке сообщения в классы выше //
//  } else if (type == PERSON_ONLINE) {
//    // Добавление пользователя с считанным QHostAddress //
//  } else if (type == WHO_IS_ONLINE) {
//    sending(nickname, qint8(PERSON_ONLINE));
//  }
}
