import QtQuick 2.0
import "finding"

FinderForm {
    id: finder

    onFind: {
        console.debug("click")
        internetController.find();
    }
}
