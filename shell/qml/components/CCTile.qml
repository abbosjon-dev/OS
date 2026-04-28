import QtQuick
import "../theme"

// Control Center tile (square, rounded). Becomes filled when active.
Item {
    id: root
    property string iconName: ""
    property string iconWeight: "fill"
    property string title: ""
    property string subtitle: ""
    property color tint: Theme.blue
    property bool active: false

    Rectangle {
        anchors.fill: parent
        radius: 22
        antialiasing: true
        color: root.active ? root.tint : Qt.rgba(1, 1, 1, 0.12)
    }

    Item {
        anchors.fill: parent
        anchors.margins: 14

        Rectangle {
            id: badge
            width: 30; height: 30; radius: 15
            color: root.active ? Qt.rgba(1, 1, 1, 0.25) : root.tint
            antialiasing: true
            Icon {
                anchors.centerIn: parent
                name: root.iconName
                weight: root.iconWeight
                color: "white"
                size: 18
            }
        }

        Text {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 14
            text: root.title
            color: Theme.label
            font.family: Theme.fontFamily
            font.pixelSize: 14
            font.weight: Font.DemiBold
            renderType: Text.NativeRendering
        }
        Text {
            visible: root.subtitle !== ""
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            text: root.subtitle
            color: Theme.labelSecondary
            font.family: Theme.fontFamily
            font.pixelSize: 12
            renderType: Text.NativeRendering
        }
    }
}
