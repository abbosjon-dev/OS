import QtQuick
import "../theme"

// iOS-style slider. orientation: "horizontal" | "vertical".
// Vertical: fills bottom→top.  Horizontal: fills left→right.
Item {
    id: root
    property real value: 0.5  // 0..1
    property string orientation: "horizontal"
    property string leadingGlyph: ""
    property color fillColor: Theme.label
    property color trackColor: Qt.rgba(1, 1, 1, 0.10)

    readonly property bool vert: orientation === "vertical"
    readonly property real cornerR: vert ? width / 2 : height / 2

    // Track
    Rectangle {
        anchors.fill: parent
        radius: root.cornerR
        color: root.trackColor
        antialiasing: true
        clip: true

        // Fill — vertical
        Rectangle {
            visible: root.vert
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: Math.max(parent.width, parent.height * root.value)
            color: root.fillColor
            antialiasing: true
        }

        // Fill — horizontal
        Rectangle {
            visible: !root.vert
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: Math.max(parent.height, parent.width * root.value)
            color: root.fillColor
            antialiasing: true
        }
    }

    // Glyph — vertical: bottom-center; horizontal: left-center.
    Text {
        visible: root.leadingGlyph !== ""
        text: root.leadingGlyph
        color: Theme.bgSystem
        font.family: Theme.fontFamily
        font.pixelSize: 22
        font.bold: true
        anchors.horizontalCenter: root.vert ? parent.horizontalCenter : undefined
        anchors.verticalCenter: !root.vert ? parent.verticalCenter : undefined
        anchors.bottom: root.vert ? parent.bottom : undefined
        anchors.bottomMargin: root.vert ? 14 : 0
        anchors.left: !root.vert ? parent.left : undefined
        anchors.leftMargin: !root.vert ? 14 : 0
    }
}
