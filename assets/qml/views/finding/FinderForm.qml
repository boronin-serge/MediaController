import QtQuick 2.0
import QtQuick.Controls 2.1
import "../../components/functional"
import "../../components/visual"

Screen {
    id: screen
    background: Rectangle {
        color: "#2E2F30"
    }
    property alias findButtonArea: findButtonArea
    signal find

    Button {
        id: findButton
        text: "Find"
        anchors {
            centerIn: parent
        }
        width: 100
        height: 100

        background: Rectangle {
            anchors.fill: parent
            radius: 5
            color: "white"
        }
        PressEffect {
            id: findPressEffect
            width: 50
        }

        MouseArea {
            id: findButtonArea
            anchors.fill: parent
            onClicked: {
                find()
                findPressEffect.trigger()
            }
        }
    }
}
