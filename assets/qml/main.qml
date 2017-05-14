import QtQuick 2.7
import "Components"
import "Views"
import "Defs"

RootForm {
    id: root
    property Defs defs: Defs {}
    property real ratio: Math.min(root.width / 480, root.height / 640)

    property Navigator navigator: Navigator{
        property View startPage: View { item: StartPage {} }
        property View tests: View { item: Tests {} }
        property View stat: View { item: Stat {} }

        routes: {
            "startPage": {
                view: startPage
            }
        }
    }

    width: 480
    height: 640

    Component.onCompleted: {
        navigator.select("startPage")
    }
}
