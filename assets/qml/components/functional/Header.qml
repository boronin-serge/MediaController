import QtQuick 2.0
import "../visual"

Rectangle {

    property string text
    property color backgroundColor
    property color textColor: "white"
    property alias rButtonText: rButtonText
    property alias rButtonImage: rButtonImage

    property alias lButtonText: lButtonText
    property alias lButtonImage: lButtonImage
    property alias lArea: lArea
    property alias rArea: rArea

    color: backgroundColor
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }
    height: parent.height / 13
    width: parent.width

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: parent.text
        color: textColor
        font.pointSize: 18
    }

    Item {
        width: 50
        height: parent.height
        anchors {
            right: parent.right
            rightMargin: 10
            top: parent.top
        }


        Image {
            id: rButtonImage
            anchors.centerIn: parent
        }

        Text {
            id: rButtonText
            anchors.centerIn: parent
            color: textColor
            font.pointSize: parent.height / 2
        }


        MouseArea {
            id: rArea
            anchors.fill: parent
            visible: rButtonText.text != "" || rButtonImage.source != ""
        }
    }

    Item {
        width: 50
        height: parent.height
        anchors {
            left: parent.left
            leftMargin: 10
            top: parent.top
        }

        Image {
            id: lButtonImage
            anchors.centerIn: parent
        }

        Text {
            id: lButtonText
            anchors.centerIn: parent
            color: textColor
            font.pointSize: parent.height / 2
        }
        MouseArea {
            id: lArea
            anchors.fill: parent
            visible: lButtonText.text != "" || lButtonImage.source != ""
        }
    }

    SideShadow {
        anchors.top: parent.bottom
        side: Qt.AlignBottom
    }
}
