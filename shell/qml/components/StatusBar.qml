import QtQuick
import "../theme"

// iOS-style status bar — time on the left, signal/wifi/battery on the right.
// Phone variant has a Dynamic Island pill in the centre.
Item {
    id: root
    height: 44
    property string time: "9:41"
    property int battery: 84
    property bool desktop: false

    Text {
        anchors.left: parent.left
        anchors.leftMargin: 28
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 1
        text: root.time
        color: Theme.label
        font.family: Theme.fontFamily
        font.pixelSize: 16
        font.weight: Font.DemiBold
        renderType: Text.NativeRendering
    }

    // Dynamic Island
    Rectangle {
        visible: !root.desktop
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 124; height: 34
        radius: 17
        color: "#000000"
    }

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

        Icon {
            name: "wifi-high"
            weight: "bold"
            color: Theme.label
            size: 17
            anchors.verticalCenter: parent.verticalCenter
        }

        // Battery
        Item {
            width: 28; height: 13
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
                radius: 1.5
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
