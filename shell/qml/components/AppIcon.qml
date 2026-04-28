import QtQuick
import "../theme"

Item {
    id: root
    property string label: ""
    property string glyph: ""
    property color tint: Theme.accent
    property color tint2: Theme.accentSoft
    property bool showLabel: true
    width: 80
    height: showLabel ? 96 : 64

    Rectangle {
        id: tile
        width: 64; height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        radius: Theme.radMd
        gradient: Gradient {
            GradientStop { position: 0.0; color: root.tint }
            GradientStop { position: 1.0; color: root.tint2 }
        }

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: "transparent"
            border.color: Qt.rgba(1, 1, 1, 0.18)
            border.width: 1
        }

        Text {
            anchors.centerIn: parent
            text: root.glyph
            font.pixelSize: 30
            font.family: Theme.fontFamily
        }
    }

    Text {
        visible: root.showLabel
        anchors.top: tile.bottom
        anchors.topMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter
        text: root.label
        color: Theme.textHi
        font.family: Theme.fontFamily
        font.pixelSize: 11
        font.bold: false
    }
}
