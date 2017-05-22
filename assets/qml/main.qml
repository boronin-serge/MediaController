import QtQuick 2.7
import Internet 1.0

import "components"
import "controllers"
import "views"
import "defs"

RootForm {
    id: root
    property Defs defs: Defs {}
    property Broadcaster broadcaster: Broadcaster {}

    property InternetService internetService: InternetService {}
    property InternetController internetController: InternetController {}

    property real ratio: Math.min(root.width / 480, root.height / 640)

    property Navigator navigator: Navigator{
        property View startPage: View { item: StartPage {} }
        property View tests: View { item: Tests {} }
        property View stat: View { item: Stat {} }
        property View finder: View { item: Finder {} }

        routes: {
            "finder" : {
                view: finder,
                next: startPage
            },
            "startPage": {
                view: startPage
            }
        }
    }

    width: 480
    height: 640

    Component.onCompleted: {
        navigator.select("finder")
    }
}
