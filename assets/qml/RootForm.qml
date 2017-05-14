import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0 as Window
import "components/functional/"
import "views"

ApplicationWindow {
    id: window
    visible: true

    property real q: Math.min(width / 480, height / 640) * 3.7 / Window.Screen.logicalPixelDensity
    property alias viewport: viewport

    minimumWidth: 100
    minimumHeight: 100

    header: Rectangle {
        color: "red"
    }

    Item {
        id: content
        anchors {
            centerIn: parent
        }
        width: (parent.width + 1) / q
        height: (parent.height + 1) / q
        scale: q



        Item {
            id: viewport
            anchors {
                top: parent.top//header.bottom
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            property Screen currentItem: null

            StartPage {}

            function setView(view) {
                currentItem = view.create(viewport)
            }
        }
    }
}
