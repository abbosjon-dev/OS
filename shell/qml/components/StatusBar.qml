import QtQuick
import QtQuick.Shapes
import "../theme"

// iOS-style status bar. On a phone, the time sits inside a notional "Dynamic
// Island" pill on the left, signal/wifi/battery on the right.
Item {
    id: root
    height: 44
    property string time: "9:41"
    property int battery: 78
    property bool charging: false
    property bool desktop: false

    // Time
    Text {
        anchors.left: parent.left
        anchors.leftMargin: 28
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 1
        text: root.time
        color: Theme.label
        font.family: Theme.fontFamily
        font.pixelSize: 17
        font.weight: Font.DemiBold
    }

    // Dynamic island (iPhone 14+ style)
    Rectangle {
        visible: !root.desktop
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 124; height: 34
        radius: 17
        color: "#000000"
    }

    // Right side: signal · wifi · battery
    Row {
        anchors.right: parent.right
        anchors.rightMargin: 24
        anchors.verticalCenter: parent.verticalCenter
        spacing: 6

        // Signal bars
        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 2
            Repeater {
                model: 4
                delegate: Rectangle {
                    width: 3
                    height: 4 + index * 2
                    radius: 1
                    color: Theme.label
                    anchors.bottom: parent.bottom
                }
            }
        }

        // Wi-Fi glyph (three arcs)
        Shape {
            width: 16; height: 12
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            ShapePath {
                strokeColor: "transparent"
                fillColor: Theme.label
                startX: 8; startY: 11
                PathArc { x: 11; y: 11; radiusX: 1.5; radiusY: 1.5 }
            }
            ShapePath {
                strokeColor: Theme.label
                strokeWidth: 1.6
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap
                startX: 4; startY: 7
                PathArc { x: 12; y: 7; radiusX: 4; radiusY: 4; useLargeArc: false }
            }
            ShapePath {
                strokeColor: Theme.label
                strokeWidth: 1.6
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap
                startX: 1; startY: 4
                PathArc { x: 15; y: 4; radiusX: 7; radiusY: 7; useLargeArc: false }
            }
        }

        // Battery
        Item {
            width: 30; height: 14
            anchors.verticalCenter: parent.verticalCenter
            Rectangle {
                anchors.fill: parent
                anchors.rightMargin: 2
                radius: 4
                color: "transparent"
                border.color: Qt.rgba(1, 1, 1, 0.45)
                border.width: 1.2
            }
            Rectangle {
                anchors.left: parent.left
                anchors.leftMargin: 3
                anchors.verticalCenter: parent.verticalCenter
                width: (parent.width - 8) * (root.battery / 100.0)
                height: parent.height - 6
                radius: 2
                color: root.battery > 20 ? Theme.label : Theme.red
            }
            Rectangle {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                width: 2; height: 6
                radius: 1
                color: Qt.rgba(1, 1, 1, 0.45)
            }
        }
    }
}
