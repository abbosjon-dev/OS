import QtQuick
import "components"
import "theme"

// Mobile Control Center — proper icons, vertical sliders.
Item {
    id: root
    anchors.fill: parent

    readonly property real pad: 12
    readonly property real gap: 10
    readonly property real colW: (width - pad * 2 - gap) / 2

    Wallpaper { variant: "midnight" }
    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.45) }

    StatusBar {
        id: statusBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Column {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: statusBar.bottom
        anchors.leftMargin: root.pad
        anchors.rightMargin: root.pad
        anchors.topMargin: 8
        spacing: root.gap

        // ─── Row 1: connectivity quad + music ───
        Item {
            width: parent.width; height: 154

            Card {
                id: connQuad
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: root.colW
                radius: 22
                tint: Theme.material

                Grid {
                    anchors.centerIn: parent
                    columns: 2
                    rowSpacing: 14
                    columnSpacing: 14
                    Repeater {
                        model: [
                            { i: "airplane",   t: Theme.orange, on: false },
                            { i: "wifi-high",  t: Theme.blue,   on: true  },
                            { i: "bluetooth",  t: Theme.blue,   on: true  },
                            { i: "share-network", t: Theme.green, on: false }
                        ]
                        delegate: Rectangle {
                            width: 50; height: 50; radius: 25
                            color: modelData.on ? modelData.t : Qt.rgba(1, 1, 1, 0.18)
                            antialiasing: true
                            Icon { anchors.centerIn: parent; name: modelData.i; weight: "fill"; color: "white"; size: 22 }
                        }
                    }
                }
            }

            CCTile {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: root.colW
                iconName: "music-note"
                title: "Yangiroq"
                subtitle: "Munisa - Yo'lda"
                tint: Theme.pink
                active: true
            }
        }

        // ─── Row 2: vertical sliders ───
        Item {
            width: parent.width; height: 240

            Rectangle {
                anchors.left: parent.left
                width: root.colW; height: 240
                radius: 28
                color: Qt.rgba(1, 1, 1, 0.10)
                antialiasing: true; clip: true

                Rectangle {
                    anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                    height: parent.height * 0.78; radius: parent.radius
                    color: "white"; antialiasing: true
                }
                Icon {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 16
                    name: "sun"; weight: "fill"
                    color: Theme.bgSystem; size: 26
                }
            }

            Rectangle {
                anchors.right: parent.right
                width: root.colW; height: 240
                radius: 28
                color: Qt.rgba(1, 1, 1, 0.10)
                antialiasing: true; clip: true

                Rectangle {
                    anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                    height: parent.height * 0.55; radius: parent.radius
                    color: "white"; antialiasing: true
                }
                Icon {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 16
                    name: "speaker-high"; weight: "fill"
                    color: Theme.bgSystem; size: 26
                }
            }
        }

        // ─── Row 3: 4×2 quick actions ───
        Grid {
            id: qaGrid
            width: parent.width
            columns: 4
            rowSpacing: root.gap
            columnSpacing: root.gap
            property real cellW: (width - root.gap * 3) / 4

            Repeater {
                model: [
                    { i: "moon",        a: true,  t: Theme.indigo },
                    { i: "lock-simple", a: false, t: Theme.grey3  },
                    { i: "camera",      a: false, t: Theme.grey3  },
                    { i: "flashlight",  a: false, t: Theme.grey3  },
                    { i: "alarm",       a: false, t: Theme.grey3  },
                    { i: "calculator",  a: false, t: Theme.orange },
                    { i: "note-pencil", a: false, t: Theme.grey3  },
                    { i: "microphone",  a: true,  t: Theme.red    }
                ]
                delegate: Rectangle {
                    width: qaGrid.cellW; height: 64
                    radius: 22
                    color: modelData.a ? modelData.t : Qt.rgba(1, 1, 1, 0.12)
                    antialiasing: true
                    Icon { anchors.centerIn: parent; name: modelData.i; weight: "fill"; color: "white"; size: 26 }
                }
            }
        }

        Item {
            width: parent.width; height: 32
            Rectangle {
                anchors.centerIn: parent
                width: 130; height: 32
                radius: 16
                color: Qt.rgba(1, 1, 1, 0.15)
                antialiasing: true
                Row {
                    anchors.centerIn: parent
                    spacing: 4
                    Icon { name: "plus"; weight: "bold"; color: Theme.label; size: 12; anchors.verticalCenter: parent.verticalCenter }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Tahrirlash"
                        color: Theme.label
                        font.family: Theme.fontFamily
                        font.pixelSize: 13
                        font.weight: Font.DemiBold
                        renderType: Text.NativeRendering
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
