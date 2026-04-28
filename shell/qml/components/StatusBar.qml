import QtQuick
import QtQuick.Layouts
import "../theme"

Item {
    id: root
    height: 32
    property string time: "9:41"
    property int battery: 78
    property bool desktopMode: false

    Rectangle {
        anchors.fill: parent
        color: Theme.bgDeep
        opacity: desktopMode ? 0.0 : 0.55
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: Theme.spaceMd
        anchors.rightMargin: Theme.spaceMd
        spacing: Theme.spaceSm

        Text {
            text: root.time
            color: Theme.textHi
            font.family: Theme.fontFamily
            font.pixelSize: 13
            font.bold: true
        }

        Item { Layout.fillWidth: true }

        Text { text: "5G"; color: Theme.accentSoft; font.pixelSize: 11; font.bold: true }
        Text { text: "·"; color: Theme.textDim; font.pixelSize: 11 }
        Text { text: "Wi-Fi"; color: Theme.textHi; font.pixelSize: 11 }
        Text { text: "·"; color: Theme.textDim; font.pixelSize: 11 }

        Rectangle {
            width: 28; height: 12
            radius: 3
            color: "transparent"
            border.color: Theme.textHi
            border.width: 1
            Rectangle {
                anchors.left: parent.left
                anchors.leftMargin: 2
                anchors.verticalCenter: parent.verticalCenter
                width: (parent.width - 4) * (root.battery / 100.0)
                height: parent.height - 4
                radius: 1
                color: root.battery > 20 ? Theme.success : Theme.danger
            }
            Rectangle {
                anchors.left: parent.right
                anchors.verticalCenter: parent.verticalCenter
                width: 2; height: 6
                color: Theme.textHi
            }
        }
        Text {
            text: root.battery + "%"
            color: Theme.textHi
            font.pixelSize: 11
            font.bold: true
        }
    }
}
