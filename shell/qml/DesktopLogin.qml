import QtQuick
import "components"
import "theme"

// Desktop login screen.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.18) }

    // Top bar (no menus, just clock)
    Row {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 14
        spacing: 14
        Icon { name: "wifi-high"; weight: "bold"; color: Theme.label; size: 14; anchors.verticalCenter: parent.verticalCenter }
        Icon { name: "battery-full"; weight: "bold"; color: Theme.label; size: 16; anchors.verticalCenter: parent.verticalCenter }
        Text { text: "9:41 · Sesh, 28 Apr"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 13; anchors.verticalCenter: parent.verticalCenter; renderType: Text.NativeRendering }
    }

    Column {
        anchors.centerIn: parent
        spacing: 14

        // Avatar
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 132; height: 132
            radius: 66
            gradient: Gradient {
                GradientStop { position: 0.0; color: Theme.orange }
                GradientStop { position: 1.0; color: Theme.pink }
            }
            antialiasing: true
            Text {
                anchors.centerIn: parent
                text: "A"
                color: "white"
                font.bold: true
                font.pixelSize: 64
                font.family: Theme.fontDisplay
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Abbosjon Karimov"
            color: Theme.label
            font.family: Theme.fontDisplay
            font.pixelSize: 26
            font.weight: Font.DemiBold
            renderType: Text.NativeRendering
        }

        // Password field
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 280; height: 38
            radius: 19
            color: Qt.rgba(1, 1, 1, 0.16)
            antialiasing: true
            Row {
                anchors.fill: parent
                anchors.leftMargin: 14
                spacing: 6
                anchors.rightMargin: 14
                Repeater {
                    model: 6
                    delegate: Rectangle {
                        width: 8; height: 8; radius: 4
                        color: Theme.label
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Item { width: 1; height: 1 }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "|"
                    color: Theme.label
                    font.pixelSize: 14
                }
            }

            Icon {
                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                name: "caret-right"; weight: "bold"; color: Theme.label; size: 14
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Touch ID yoki parolni kiriting"
            color: Theme.labelSecondary
            font.family: Theme.fontFamily
            font.pixelSize: 12
            renderType: Text.NativeRendering
        }
    }

    // Bottom buttons
    Row {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 50

        Column {
            spacing: 6
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 44; height: 44; radius: 22
                color: Qt.rgba(1, 1, 1, 0.18)
                Icon { anchors.centerIn: parent; name: "moon"; weight: "fill"; color: Theme.label; size: 20 }
            }
            Text { anchors.horizontalCenter: parent.horizontalCenter; text: "Uyqu";  color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 11; renderType: Text.NativeRendering }
        }
        Column {
            spacing: 6
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 44; height: 44; radius: 22
                color: Qt.rgba(1, 1, 1, 0.18)
                Icon { anchors.centerIn: parent; name: "arrow-clockwise"; weight: "bold"; color: Theme.label; size: 20 }
            }
            Text { anchors.horizontalCenter: parent.horizontalCenter; text: "Qayta yuklash"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 11; renderType: Text.NativeRendering }
        }
        Column {
            spacing: 6
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 44; height: 44; radius: 22
                color: Qt.rgba(1, 1, 1, 0.18)
                Icon { anchors.centerIn: parent; name: "x-circle"; weight: "fill"; color: Theme.label; size: 20 }
            }
            Text { anchors.horizontalCenter: parent.horizontalCenter; text: "O'chirish"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 11; renderType: Text.NativeRendering }
        }
    }
}
