import QtQuick 2.0
import QtQuick.Controls 2.1
import "../components/functional"
import "../components/visual"

Screen {
    id: startPage
    property alias debugArea: debugArea
    property alias debugText: text

    title: "Debug window"

    background: Rectangle {
        color: "#2E2F30"
    }

    Text {
        id: myIp
        anchors {
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        font {
            pointSize: 14
        }
        color: defs.textColor
        text: "My IP: " + broadcaster.localIP()
    }

    Text {
        id: deviceIp
        anchors {
            top: myIp.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        font {
            pointSize: 14
        }

        color: defs.textColor
        text: "Device IP: " + broadcaster.deviceIP()
    }


    Rectangle {
        id: debugArea
        anchors {
            top: deviceIp.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        color: "white"

        width: parent.width * 0.8
        height: parent.height * 0.6
        radius: 5
        ListView {
            id: text
            model: internetController.messages
            clip: true
            anchors {
                fill: parent
                margins: 10
            }
            verticalLayoutDirection: ListView.BottomToTop
            delegate: Text {
                id: textDelegate
                width: parent.width
                height: 20
                clip: true
                font {
                   pointSize: 12

                }
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                state: model.type ? model.type : "input"

                states: [
                    State {
                        name: "system"
                        PropertyChanges {
                            target: textDelegate
                            color: defs.systemColor
                            font.italic: true
                            text: "system: " + model.text
                        }

                    },
                    State {
                        name: "output"
                        PropertyChanges {
                            target: textDelegate
                            color: defs.inputColor
                            text: "you: " + model.text
                        }
                    },
                    State {
                        name: "input"
                        PropertyChanges {
                            target: textDelegate
                            color: defs.outputColor
                            text: "device: " + model.text
                        }
                    }

                ]

                maximumLineCount: 120
                color: "black"
            }
        }


    }

    TextField {
        id: inputArea
        anchors {
            top: debugArea.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }

        background: Rectangle {
            anchors.fill: parent
            radius: 5
            color: "white"
        }
        font {
            pointSize: 15
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
                internetController.messages.insert(0, {text: state,
                                                    type: "system"})
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
        width: 100
        height: 40

        text: "Send"
        background: Rectangle {
            anchors.fill: parent
            radius: 5
            color: "white"
        }

        PressEffect {
            id: sendPressEffect
            width: 50
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                internetController.sendRequest(inputArea.text)
                inputArea.clear()
                sendPressEffect.trigger()
            }
        }
    }
}
