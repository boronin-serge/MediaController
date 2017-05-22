import QtQuick 2.0
import QtWebSockets 1.1
import Internet 1.0

Item {
    id: service
    property alias socket: socket
    signal received


    WebSocket {
        id: socket
        url: "ws://echo.websocket.org"
        onTextMessageReceived: {
            console.debug("Received message: " + message)
            received()
        }
        onStatusChanged: {
            if (socket.status == WebSocket.Error) {
                console.log("status: " + socket.errorString)
            } else if (socket.status == WebSocket.Open) {
                console.debug("status: socket is open")
            } else if (socket.status == WebSocket.Closed) {
                console.debug("status:  socket is closed")
            }
        }
        active: false
    }

    function find() {
        broadcaster.send("sended message", "sometype")
        broadcaster.bind(45454)
    }

    function request (data) {
        socket.sendTextMessage(data)
    }

    function openConnection() {
        socket.active = true
    }

    function closeConnection() {
        socket.active = false
    }

    function setUrl(url) {
        if (url && url != "") {
            socket.url = url
        }
    }
}
