import QtQuick 2.0

Item {
    id: controller

    property ListModel messages: ListModel {}

    function find() {
        internetService.find()
    }

    function sendRequest(data, success) {
        if (data && data != "") {
            messages.insert(0, {text: data,
                             type: "output"})
            internetService.request(data)

            console.log("YOU")
        }
        else {
            var error = "Incorrect request data"
            messages.insert(0, {text: error,
                             type: "system"})
            console.log(error)
        }

    }

    Connections {
        target: internetService
        onReceived: {
            messages.insert(0, {text: message,
                             type: "input"})
            console.log("DEVICE")
        }
    }


}
