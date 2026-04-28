import QtQuick
import QtQuick.Shapes
import "../theme"

// iOS app icon — a continuous-curvature squircle with a gradient fill
// and a subtle inner highlight.
Item {
    id: root
    property string label: ""
    property string glyph: ""
    property color tint: Theme.blue
    property color tint2: Qt.lighter(tint, 1.25)
    property bool showLabel: true
    property real iconSize: 60
    property bool dotted: false   // notification dot
    width: iconSize + 8
    height: iconSize + (showLabel ? 22 : 0)

    Item {
        id: icon
        width: root.iconSize; height: root.iconSize
        anchors.horizontalCenter: parent.horizontalCenter

        // Squircle background (rounded rect ≈ continuous corner)
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

        // Top-edge highlight
        Rectangle {
            anchors.fill: parent
            radius: width * Theme.squircle
            color: "transparent"
            border.color: Qt.rgba(1, 1, 1, 0.16)
            border.width: 1
            antialiasing: true
        }

        // Glyph
        Text {
            anchors.centerIn: parent
            text: root.glyph
            color: "white"
            font.family: Theme.fontFamily
            font.pixelSize: root.iconSize * 0.50
            font.weight: Font.Bold
        }

        // Notification dot
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
        anchors.top: icon.bottom
        anchors.topMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter
        text: root.label
        color: Theme.label
        font.family: Theme.fontFamily
        font.pixelSize: 12
        font.weight: Font.Normal
    }
}
