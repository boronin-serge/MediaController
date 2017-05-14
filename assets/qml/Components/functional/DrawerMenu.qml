import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "../functional"
import "../visual"

Drawer {
    property color bodyColor: "white"
    height: parent.height - y
    width: parent.width * 0.8
    background: Rectangle {
        anchors.fill: parent
        color: bodyColor

    }
    Item {
        anchors {
            fill: parent
        }
        scale: q
        ColumnLayout {
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                topMargin: 50
            }
            Repeater {
                model: [{
                    name: "Stat",
                    link: "stat"
                }]
                delegate: MenuButton {
                    bodyColor: "#20ffffff"
                    height: 50
                    Text {
                        color: "white"
                        font.pointSize: 15
                        anchors {
                            centerIn: parent
                        }
                        text: modelData.name
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            close()
                        }
                    }
                }
            }
        }
    }
}

