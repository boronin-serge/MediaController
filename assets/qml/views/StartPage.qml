import QtQuick 2.0
import QtQuick.Controls 2.1
import "../components/functional"

Screen {
    id: startPage
    property alias debugArea: debugArea
    property alias debugText: text

    title: "Debug window"

    background: Rectangle {
        color: "#2E2F30"
    }

    Rectangle {
        id: debugArea
        anchors {
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        color: "white"

        width: parent.width * 0.8
        height: parent.height * 0.6
        radius: 5
        Text {
            id: text
            anchors {
                fill: parent
                margins: 10
            }
            clip: true
            text: "Response"
            font {
               pointSize: 15
            }
            maximumLineCount: 120
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            color: "black"
        }
    }

    TextField {
        id: inputArea
        anchors {
            top: debugArea.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }

        width: debugArea.width
        height: 50
    }

    Column {
        anchors {
            left: debugArea.left
            verticalCenter: doGood.verticalCenter
        }
        Switch {
            id: connection
            onPositionChanged: {
                var state = position == 0.0 ? "Connection is closed" :
                                             "Connection is open"
                text.text += "\n" + state
                if (position == 1.0) {
                    internetService.openConnection()
                }
                else {
                    internetService.closeConnection()
                }
            }
        }
        Text {
            text: "Connection"
            color: "white"
        }
    }

    Button {
        id: doGood
        anchors {
            top: inputArea.bottom
            topMargin: 20
            right: debugArea.right
        }
        text: "Request"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                internetController.sendRequest(inputArea.text)
            }
        }
    }
}
