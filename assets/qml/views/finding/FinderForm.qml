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
