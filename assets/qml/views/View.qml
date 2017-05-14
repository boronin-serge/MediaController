import QtQuick 2.0

Item {
    id: view

    property Component item

    function create(parent) {
        return item.createObject(parent)
    }
}
