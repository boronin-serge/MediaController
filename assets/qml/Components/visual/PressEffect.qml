import QtQuick 2.7
import  "../../../js/Utils.js" as Utils

Rectangle {
    id: pressEffect

    anchors.centerIn: parent
    width: parent.width
    height: width

    color: "#fff"
    radius: width / 2
    scale:  _.triggered ? 4.0 : 0.0
    opacity: _.triggered ? 0.0 : 0.3

    QtObject {
        id: _
        property bool triggered: false
        property int duration: triggered ? 200 : 0
        property var timer: null

        onTriggeredChanged: {
            if(_.triggered) {
                if(_.timer) {
                    _.timer.stop()
                }

                _.timer = Utils.delay(200, function() {
                    _.triggered = false
                })
            } else {
                _.timer = null
            }
        }
    }

    function trigger() {
        _.triggered = false
        _.triggered = true
    }

    Behavior on opacity {
        OpacityAnimator {
            duration: _.duration * 0.9
        }
    }

    Behavior on scale {
        ScaleAnimator {
            duration: _.duration
        }
    }
}
