import QtQuick 2.0
import QtQuick.Controls 2.1
import "../Components/functional"
import "../Components/visual"

Screen {
    id: startPage

    background: Rectangle {
        color: "#2E2F30"
    }

    Rectangle {
        id: debugArea
        anchors.centerIn: parent
        color: "white"

        width: parent.width * 0.8
        height: parent.height * 0.6
        radius: 5
        Text {
            anchors {
                fill: parent
                margins: 10
            }
            clip: true
            text: "Response"
            font {
               pointSize: 15
            }
            color: "black"
        }
    }

    Button {
        id: doGood
        anchors {
            top: debugArea.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
        text: "Request"
    }
}
