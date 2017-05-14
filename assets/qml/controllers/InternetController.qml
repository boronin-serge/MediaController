import QtQuick 2.0

Item {
    id: controller

    function sendRequest(data, success) {
        if (data && data != "") {
            console.log(internetService.socket.active)
            internetService.request(data)
        }
        else {
            console.log("incorrect request data")
        }

    }
}
