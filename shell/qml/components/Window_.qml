import QtQuick
import "../theme"

// Reusable desktop window chrome — title bar with traffic lights + a slot for
// content. Used so every full-window desktop screen looks consistent.
Item {
    id: root
    default property alias content: holder.children
    property string title: "Oyna"
    property bool active: true
    property real radius: 14
    property color background: Qt.rgba(0.10, 0.10, 0.12, 0.98)

    // Soft shadow ring (4 stacked rectangles)
    Repeater {
        model: 4
        delegate: Rectangle {
            anchors.fill: parent
            anchors.margins: -(index + 1) * 3
            radius: root.radius + 4 + index
            color: "transparent"
            border.color: Qt.rgba(0, 0, 0, 0.16 - index * 0.035)
            border.width: 1
        }
    }

    Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.background
        antialiasing: true
        border.color: Qt.rgba(1, 1, 1, 0.06)
        border.width: 1
        clip: true

        // Title bar
        Item {
            id: tb
            anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right
            height: 38

            Rectangle {
                anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                height: 1; color: Theme.separator
            }

            Row {
                anchors.left: parent.left
                anchors.leftMargin: 14
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8
                Rectangle { width: 13; height: 13; radius: 6.5; color: root.active ? Theme.red    : Theme.grey3; antialiasing: true }
                Rectangle { width: 13; height: 13; radius: 6.5; color: root.active ? Theme.yellow : Theme.grey3; antialiasing: true }
                Rectangle { width: 13; height: 13; radius: 6.5; color: root.active ? Theme.green  : Theme.grey3; antialiasing: true }
            }

            Text {
                anchors.centerIn: parent
                text: root.title
                color: root.active ? Theme.label : Theme.labelSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 13
                font.weight: Font.DemiBold
                renderType: Text.NativeRendering
            }
        }

        Item {
            id: holder
            anchors.top: tb.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }
}
