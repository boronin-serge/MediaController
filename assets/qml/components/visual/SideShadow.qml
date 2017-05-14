import QtQuick 2.0

Rectangle {
    property real side: Qt.AlignBottom
    width: parent.width
    height: 15
    rotation: side == Qt.AlignBottom ? 0 : side == Qt.AlignTop ? 180 : side == Qt.AlignLeft ? 90 : -90
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#20000000"
        }
        GradientStop {
            position: 1.0
            color: "transparent"
        }
    }
}
