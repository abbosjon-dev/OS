import QtQuick
import "components"
import "theme"

// Mission Control — all open windows in expose grid.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.55) }
    DesktopChrome { menuApp: "Mission Control"; showDock: false }

    Item {
        anchors.fill: parent
        anchors.topMargin: 50
        anchors.bottomMargin: 80

        // Spaces strip
        Row {
            id: spaces
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12
            height: 80

            Repeater {
                model: [
                    { t: "Bosh stol",   active: true  },
                    { t: "Ish",        active: false },
                    { t: "Loyiha",     active: false }
                ]
                delegate: Rectangle {
                    width: 160; height: 80
                    radius: 10
                    color: Qt.rgba(0.13, 0.13, 0.15, 0.98)
                    border.color: modelData.active ? "white" : Qt.rgba(1, 1, 1, 0.20)
                    border.width: modelData.active ? 2 : 1
                    antialiasing: true
                    Text {
                        anchors.centerIn: parent
                        text: modelData.t
                        color: Theme.label
                        font.family: Theme.fontFamily
                        font.pixelSize: 13
                        font.weight: Font.DemiBold
                        renderType: Text.NativeRendering
                    }
                }
            }
        }

        // Window thumbnails
        Grid {
            anchors.top: spaces.bottom
            anchors.topMargin: 30
            anchors.left: parent.left; anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 60; anchors.rightMargin: 60
            columns: 3
            rowSpacing: 28
            columnSpacing: 28
            property real cellW: (width - 28 * 2) / 3
            property real cellH: (height - 28) / 2

            Repeater {
                model: [
                    { t: "Sozlamalar",   icon: "gear",            c: Theme.grey1,  bg: "#1C1C1E" },
                    { t: "Eslatma",      icon: "note-pencil",     c: Theme.orange, bg: "#3A2410" },
                    { t: "Brauzer",      icon: "compass",         c: Theme.blue,   bg: "#0F2540" },
                    { t: "Pochta",       icon: "envelope",        c: Theme.blue,   bg: "#0F2540" },
                    { t: "Fayllar",      icon: "folder",          c: Theme.blue,   bg: "#0F2540" },
                    { t: "Terminal",     icon: "terminal-window", c: Theme.grey1,  bg: "#0A0A0A" }
                ]
                delegate: Item {
                    width: parent.cellW; height: parent.cellH

                    // Header
                    Row {
                        anchors.bottom: card.top
                        anchors.bottomMargin: 8
                        anchors.left: card.left
                        spacing: 8
                        Rectangle {
                            width: 22; height: 22
                            radius: width * Theme.squircle
                            color: modelData.c
                            anchors.verticalCenter: parent.verticalCenter
                            Icon { anchors.centerIn: parent; name: modelData.icon; weight: "fill"; color: "white"; size: 13 }
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: modelData.t
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            renderType: Text.NativeRendering
                        }
                    }

                    // Card thumbnail
                    Rectangle {
                        id: card
                        anchors.fill: parent
                        anchors.topMargin: 30
                        radius: 12
                        color: modelData.bg
                        border.color: Qt.rgba(1, 1, 1, 0.10)
                        border.width: 1
                        antialiasing: true

                        // Title bar mini
                        Item {
                            anchors.top: parent.top
                            anchors.left: parent.left; anchors.right: parent.right
                            height: 24
                            Row {
                                anchors.left: parent.left; anchors.leftMargin: 8
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: 4
                                Repeater { model: 3; delegate: Rectangle { width: 7; height: 7; radius: 4; color: index === 0 ? Theme.red : index === 1 ? Theme.yellow : Theme.green; antialiasing: true } }
                            }
                            Rectangle { anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom; height: 1; color: Theme.separator }
                        }

                        // Content placeholder
                        Icon {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset: -12
                            name: modelData.icon
                            weight: "fill"
                            color: modelData.c
                            size: 56
                        }

                        Column {
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 24
                            anchors.left: parent.left; anchors.right: parent.right
                            anchors.leftMargin: 18; anchors.rightMargin: 18
                            spacing: 6
                            Repeater {
                                model: 3
                                delegate: Rectangle {
                                    width: parent.width * (1.0 - index * 0.15)
                                    height: 8; radius: 4
                                    color: Qt.rgba(1, 1, 1, 0.08 - index * 0.015)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
