
function delay(interval, cb) {
    function Timer() {
        return Qt.createQmlObject("import QtQuick 2.0; Timer {}", root);
    }

    var timer = new Timer
    timer.interval = interval
    timer.repeat = false

    if(cb) {
        timer.triggered.connect(cb)
    }

    timer.start()

    return timer
}

function date() {
    return new Date()
}

function timestamp() {
    return Math.floor(new Date().getTime() / 1000)
}

function daysInMonth(month, year) {
    return new Date(year, month, 0).getDate();
}

function assign(obj, key, val) {
    if(val === null || val === undefined) {
        if(typeof obj[key] == "string") {
            obj[key] = ""
        } else {
            obj[key] = 0
        }
    } else {
        obj[key] = val
    }
}

Array.diff = function(x, y) {
    return x.filter(function(i) { return y.indexOf(i) === -1 })
}

Array.merge = function(x, y) {
    return Array.diff(x, y).concat(y)
}

Object.merge = function(a, b) {
    var out = {}

    for(var i in a) {
        out[i] = a[i]
    }

    for(var i in b) {
        out[i] = b[i]
    }

    return out
}

Object.invert = function(a) {
    var out = {}

    for(var i in a) {
        out[a[i]] = i
    }

    return out
}
