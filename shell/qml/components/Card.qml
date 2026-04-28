import QtQuick
import "../theme"

// Translucent material card (frosted glass approximation).
Item {
    id: root
    default property alias content: holder.children
    property real radius: 22
    property color tint: Theme.material
    property bool stroke: true

    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.tint
        antialiasing: true
    }
    Rectangle {
        visible: root.stroke
        anchors.fill: parent
        radius: root.radius
        color: "transparent"
        border.color: Qt.rgba(1, 1, 1, 0.06)
        border.width: 1
        antialiasing: true
    }

    Item {
        id: holder
        anchors.fill: parent
    }
}
