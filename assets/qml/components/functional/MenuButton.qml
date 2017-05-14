import QtQuick 2.0
import "../visual"

Item {
    property color borderColor: "#30FF4C55"
    property color bodyColor: "#15FF4C55"

    anchors {
        left: parent.left
        right: parent.right
        margins: 0
    }
    height: 80
    Rectangle {
        id: delimiter1
        height: 8
        anchors {
            top: button.top
            left: parent.left
            right: parent.right
        }
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "transparent"
            }
            GradientStop {
                position: 1.0
                color: borderColor
            }
        }
    }

    Rectangle {
        id: button
        width: parent.width
        height: parent.height
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        color: bodyColor
        PressEffect {
            id: pressEffect
            color: "white"

        }
        clip: true

        MouseArea {
            anchors.fill: parent
            onClicked: {
               pressEffect.trigger()
            }
        }
    }

    Rectangle {
        id: delimiter2
        height: 10
        anchors {
            bottom: button.bottom
            left: parent.left
            right: parent.right
        }
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: borderColor
            }
            GradientStop {
                position: 1.0
                color: "transparent"
            }
        }
    }
}
