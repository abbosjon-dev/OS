import QtQuick
import "components"
import "theme"

// App switcher — three app cards: prev / current / next, current centered and
// full-size, neighbours peek from the sides.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.55) }

    StatusBar { id: statusBar; anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right }

    readonly property var apps: [
        { app: "Brauzer",   icon: "compass",     col: "#0A84FF", bg: "#0F2540" },
        { app: "Eslatma",   icon: "note-pencil", col: "#FF9F0A", bg: "#3A2410" },
        { app: "Xabarlar",  icon: "chats",       col: "#34C759", bg: "#0F2A20" }
    ]

    // Centered "name" label of the current app — placed below status bar.
    Row {
        anchors.top: statusBar.bottom
        anchors.topMargin: 14
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 8
        z: 10
        Rectangle {
            width: 28; height: 28
            radius: width * Theme.squircle
            color: root.apps[1].col
            anchors.verticalCenter: parent.verticalCenter
            Icon { anchors.centerIn: parent; name: root.apps[1].icon; weight: "fill"; color: "white"; size: 16 }
        }
        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: root.apps[1].app
            color: Theme.label
            font.family: Theme.fontFamily
            font.pixelSize: 16
            font.weight: Font.DemiBold
            renderType: Text.NativeRendering
        }
    }

    Item {
        anchors.top: statusBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 56
        anchors.bottomMargin: 80

        Repeater {
            model: root.apps
            delegate: Item {
                width: parent.width * 0.78
                height: parent.height
                x: index === 1 ? (parent.width - width) / 2
                   : index === 0 ? -width * 0.35
                   : parent.width - width * 0.65
                z: index === 1 ? 2 : 1
                scale: index === 1 ? 1.0 : 0.92

                // Card
                Rectangle {
                    id: card
                    anchors.fill: parent
                    radius: 36
                    color: modelData.bg
                    antialiasing: true
                    border.color: Qt.rgba(1, 1, 1, 0.08)
                    border.width: 1

                    // Status bar inside the snapshot
                    Row {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 22
                        Text {
                            text: "9:41"
                            color: "white"
                            font.family: Theme.fontFamily
                            font.bold: true
                            font.pixelSize: 14
                            renderType: Text.NativeRendering
                        }
                        Item { height: 1; width: parent.width - 80 }
                        Icon { name: "wifi-high"; weight: "bold"; color: "white"; size: 13 }
                    }

                    // Big icon + title
                    Icon {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * 0.18
                        name: modelData.icon
                        weight: "fill"
                        color: modelData.col
                        size: 88
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * 0.18 + 110
                        text: modelData.app
                        color: Theme.label
                        font.family: Theme.fontDisplay
                        font.pixelSize: 30
                        font.weight: Font.Bold
                        renderType: Text.NativeRendering
                    }

                    // Line previews
                    Column {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.topMargin: parent.height * 0.18 + 170
                        anchors.leftMargin: 28
                        anchors.rightMargin: 28
                        spacing: 12
                        Repeater {
                            model: 5
                            delegate: Rectangle {
                                width: parent.width * (1.0 - index * 0.10)
                                height: 14
                                radius: 7
                                color: Qt.rgba(1, 1, 1, 0.10 - index * 0.012)
                            }
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        width: 134; height: 5
        radius: 2.5
        color: "white"
        opacity: 0.85
    }
}
