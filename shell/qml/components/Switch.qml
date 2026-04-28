import QtQuick
import "../theme"

// iOS toggle switch.
Item {
    id: root
    property bool checked: true
    width: 51; height: 31

    Rectangle {
        id: track
        anchors.fill: parent
        radius: height / 2
        color: root.checked ? Theme.green : Theme.grey3
        antialiasing: true
        Behavior on color { ColorAnimation { duration: 180 } }
    }

    Rectangle {
        id: knob
        width: 27; height: 27
        radius: height / 2
        color: "white"
        antialiasing: true
        anchors.verticalCenter: parent.verticalCenter
        x: root.checked ? parent.width - width - 2 : 2
        Behavior on x { NumberAnimation { duration: 180; easing.type: Easing.OutQuad } }

        // Subtle shadow
        Rectangle {
            anchors.fill: parent
            anchors.margins: -1
            anchors.topMargin: 0
            anchors.bottomMargin: -2
            z: -1
            radius: parent.radius
            color: Qt.rgba(0, 0, 0, 0.15)
        }
    }
}
