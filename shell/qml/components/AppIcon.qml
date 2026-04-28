import QtQuick
import "../theme"

// iOS-style app icon: squircle gradient background + a centered Icon glyph
// + an optional label below. The icon weight defaults to "fill" (solid icons
// look correct on tinted squircles).
Item {
    id: root
    property string label: ""
    property string iconName: ""
    property string iconWeight: "fill"
    property color iconColor: "white"
    property color tint: Theme.blue
    property color tint2: Qt.lighter(tint, 1.25)
    property bool showLabel: true
    property real iconSize: 60
    property bool dotted: false

    width: iconSize + 8
    height: iconSize + (showLabel ? 22 : 0)

    Item {
        id: tile
        width: root.iconSize
        height: root.iconSize
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            anchors.fill: parent
            radius: width * Theme.squircle
            antialiasing: true
            gradient: Gradient {
                orientation: Gradient.Vertical
                GradientStop { position: 0.0; color: root.tint2 }
                GradientStop { position: 1.0; color: root.tint }
            }
        }
        Rectangle {
            anchors.fill: parent
            radius: width * Theme.squircle
            color: "transparent"
            border.color: Qt.rgba(1, 1, 1, 0.16)
            border.width: 1
            antialiasing: true
        }

        Icon {
            anchors.centerIn: parent
            name: root.iconName
            weight: root.iconWeight
            color: root.iconColor
            size: root.iconSize * 0.55
        }

        Rectangle {
            visible: root.dotted
            width: 14; height: 14; radius: 7
            color: Theme.red
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: -4
            anchors.topMargin: -4
            border.color: Theme.bgSystem
            border.width: 2
        }
    }

    Text {
        visible: root.showLabel
        anchors.top: tile.bottom
        anchors.topMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter
        text: root.label
        color: Theme.label
        font.family: Theme.fontFamily
        font.pixelSize: 12
        font.weight: Font.Medium
        renderType: Text.NativeRendering
    }
}
