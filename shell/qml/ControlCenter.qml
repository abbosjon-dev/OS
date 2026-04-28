import QtQuick
import "components"
import "theme"

// Mobile Control Center — iOS layout, plain Column-based vertical stack.
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
        battery: 84
    }

    Column {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: statusBar.bottom
        anchors.leftMargin: root.pad
        anchors.rightMargin: root.pad
        anchors.topMargin: 8
        spacing: root.gap

        // ─── Row 1 ─── connectivity quad + music tile ───
        Item {
            width: parent.width
            height: 154

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
                            { g: "✈", t: Theme.orange, on: false },
                            { g: "≋", t: Theme.blue,   on: true  },
                            { g: "✦", t: Theme.blue,   on: true  },
                            { g: "↥", t: Theme.green,  on: false }
                        ]
                        delegate: Rectangle {
                            width: 50; height: 50; radius: 25
                            color: modelData.on ? modelData.t : Qt.rgba(1, 1, 1, 0.18)
                            antialiasing: true
                            Text {
                                anchors.centerIn: parent
                                text: modelData.g
                                color: "white"
                                font.family: Theme.fontFamily
                                font.pixelSize: 22
                                font.bold: true
                            }
                        }
                    }
                }
            }

            CCTile {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: root.colW
                glyph: "♪"
                title: "Yangiroq"
                subtitle: "Munisa - Yo'lda"
                tint: Theme.pink
                active: true
            }
        }

        // ─── Row 2 ─── vertical sliders ───
        Item {
            width: parent.width
            height: 240
            implicitHeight: 240

            Rectangle {
                anchors.left: parent.left
                width: root.colW
                height: 240
                radius: 28
                color: Qt.rgba(1, 1, 1, 0.10)
                antialiasing: true
                clip: true

                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    height: parent.height * 0.78
                    radius: parent.radius
                    color: "white"
                    antialiasing: true
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 16
                    text: "☀"
                    color: Theme.bgSystem
                    font.family: Theme.fontFamily
                    font.pixelSize: 24
                    font.bold: true
                }
            }

            Rectangle {
                anchors.right: parent.right
                width: root.colW
                height: 240
                radius: 28
                color: Qt.rgba(1, 1, 1, 0.10)
                antialiasing: true
                clip: true

                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    height: parent.height * 0.55
                    radius: parent.radius
                    color: "white"
                    antialiasing: true
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 16
                    text: "♪"
                    color: Theme.bgSystem
                    font.family: Theme.fontFamily
                    font.pixelSize: 24
                    font.bold: true
                }
            }
        }

        // ─── Row 3 ─── 4×2 quick action grid ───
        Grid {
            id: qaGrid
            width: parent.width
            columns: 4
            rowSpacing: root.gap
            columnSpacing: root.gap

            property real cellW: (width - root.gap * 3) / 4

            Repeater {
                model: [
                    { g: "☾",  a: true,  t: Theme.indigo },
                    { g: "🔒", a: false, t: Theme.grey3  },
                    { g: "📷", a: false, t: Theme.grey3  },
                    { g: "🔦", a: false, t: Theme.grey3  },
                    { g: "⏱",  a: false, t: Theme.grey3  },
                    { g: "🧮", a: false, t: Theme.orange },
                    { g: "✎",  a: false, t: Theme.grey3  },
                    { g: "🎙", a: true,  t: Theme.red    }
                ]
                delegate: Rectangle {
                    width: qaGrid.cellW; height: 64
                    radius: 22
                    color: modelData.a ? modelData.t : Qt.rgba(1, 1, 1, 0.12)
                    antialiasing: true
                    Text {
                        anchors.centerIn: parent
                        text: modelData.g
                        color: "white"
                        font.family: Theme.fontFamily
                        font.pixelSize: 22
                    }
                }
            }
        }

        // ─── Row 4 ─── edit pill ───
        Item {
            width: parent.width
            height: 32

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: 130; height: 32
                radius: 16
                color: Qt.rgba(1, 1, 1, 0.15)
                antialiasing: true
                Text {
                    anchors.centerIn: parent
                    text: "+ Tahrirlash"
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.DemiBold
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
