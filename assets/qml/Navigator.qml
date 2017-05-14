import QtQuick 2.0

Item {
    id: navigator
    property var routes: ({})
    readonly property variant route: routes[currentIndex]
    property string currentIndex: ""
    property var history: []

    function select(route) {
        if (navigator.routes.hasOwnProperty(route)) {
            var r = navigator.routes[route]
            if (r.view) {
                navigator.currentIndex = route
                navigator.history.push(route)
                console.log("Curent route %1".arg(route))
            }
        }
        else {
            console.log("Unknowm route %1".arg(route))
        }
    }

    function next() {
        if (navigator.route.next) {
            navigator.select(navigator.route.next)
            console.debug("Next route %1".arg(navigator.currentIndex));
        }
    }

    function back() {
        if (navigator.history.length > 0) {
            navigator.currentIndex = history.pop()
            console.debug("Previous route %1".arg(navigator.currentIndex));
        }
    }

    onHistoryChanged: {
        if (history.length > 5) {
            history.shift()
        }
    }

    onCurrentIndexChanged: {
        if (!currentIndex) {
            return
        }

        var current = routes[currentIndex]
        if (current.view) {
            viewport.setView(current.view);
        }
    }
}
