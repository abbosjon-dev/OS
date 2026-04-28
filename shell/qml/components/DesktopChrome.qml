import QtQuick
import QtQuick.Layouts
import "../theme"

// Top menu bar + bottom dock used by every desktop screen.
// Place this AFTER the wallpaper and before any window stack.
Item {
    id: root
    anchors.fill: parent
    property string menuApp: "Zamin"
    property bool showDock: true

    // ─── Top bar ───
    Card {
        id: topbar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 30
        radius: 0
        tint: Theme.materialThick
        stroke: false

        Rectangle {
            anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
            height: 1; color: Theme.separator
        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 14
            anchors.rightMargin: 14
            spacing: 18

            Rectangle {
                Layout.preferredWidth: 20; Layout.preferredHeight: 20
                radius: width * Theme.squircle
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.cyan }
                    GradientStop { position: 1.0; color: Theme.blue }
                }
                Text { anchors.centerIn: parent; text: "Z"; color: "white"; font.bold: true; font.pixelSize: 12 }
            }

            Text {
                text: root.menuApp
                color: Theme.label
                font.family: Theme.fontFamily
                font.pixelSize: 13
                font.weight: Font.Bold
                renderType: Text.NativeRendering
            }

            Repeater {
                model: ["Fayl", "Tahrirlash", "Ko'rinish", "O'tish", "Oyna", "Yordam"]
                delegate: Text {
                    text: modelData
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.Medium
                    renderType: Text.NativeRendering
                }
            }

            Item { Layout.fillWidth: true }

            Row {
                spacing: 14
                Icon { name: "wifi-high";    weight: "bold"; color: Theme.label; size: 14; anchors.verticalCenter: parent.verticalCenter }
                Icon { name: "speaker-high"; weight: "bold"; color: Theme.label; size: 14; anchors.verticalCenter: parent.verticalCenter }
                Icon { name: "battery-full"; weight: "bold"; color: Theme.label; size: 16; anchors.verticalCenter: parent.verticalCenter }
                Icon { name: "magnifying-glass"; weight: "bold"; color: Theme.label; size: 14; anchors.verticalCenter: parent.verticalCenter }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "9:41 · Sesh, 28 Apr"
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.Medium
                    renderType: Text.NativeRendering
                }
            }

            Rectangle {
                Layout.preferredWidth: 22; Layout.preferredHeight: 22
                radius: 11
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.orange }
                    GradientStop { position: 1.0; color: Theme.pink }
                }
                Text { anchors.centerIn: parent; text: "A"; color: "white"; font.bold: true; font.pixelSize: 12 }
            }
        }
    }

    // ─── Dock ───
    Card {
        id: dock
        visible: root.showDock
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        height: 70
        width: dockRow.width + 24
        radius: 18
        tint: Qt.rgba(0.20, 0.20, 0.22, 0.55)

        Row {
            id: dockRow
            anchors.centerIn: parent
            spacing: 6

            Repeater {
                model: [
                    { i: "phone",       t1: "#34C759", t2: "#5AE07F", run: true  },
                    { i: "chats",       t1: "#34C759", t2: "#5AE07F", run: false },
                    { i: "envelope",    t1: "#0A84FF", t2: "#5AC8FA", run: true  },
                    { i: "image",       t1: "#FF375F", t2: "#FF6B8A", run: false },
                    { i: "map-trifold", t1: "#0A84FF", t2: "#5AC8FA", run: false },
                    { i: "music-note",  t1: "#FF375F", t2: "#FF6B8A", run: true  },
                    { i: "note-pencil", t1: "#FF9F0A", t2: "#FFC04A", run: false },
                    { i: "compass",     t1: "#0A84FF", t2: "#5AC8FA", run: true  },
                    { i: "calendar",    t1: "#FF453A", t2: "#FF6B6B", run: false },
                    { i: "calculator",  t1: "#FF9F0A", t2: "#FFC04A", run: false },
                    { i: "folder",      t1: "#0A84FF", t2: "#5AC8FA", run: true  },
                    { i: "terminal-window", t1: "#1C1C1E", t2: "#48484A", run: false },
                    { i: "gear",        t1: "#8E8E93", t2: "#AEAEB2", run: false }
                ]
                delegate: Item {
                    width: 52; height: 52
                    anchors.verticalCenter: parent.verticalCenter

                    Rectangle {
                        anchors.fill: parent
                        radius: width * Theme.squircle
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: modelData.t2 }
                            GradientStop { position: 1.0; color: modelData.t1 }
                        }
                        antialiasing: true
                    }
                    Rectangle {
                        anchors.fill: parent
                        radius: width * Theme.squircle
                        color: "transparent"
                        border.color: Qt.rgba(1, 1, 1, 0.16)
                        border.width: 1
                        antialiasing: true
                    }
                    Icon { anchors.centerIn: parent; name: modelData.i; weight: "fill"; color: "white"; size: 26 }

                    Rectangle {
                        visible: modelData.run
                        width: 4; height: 4; radius: 2
                        color: Theme.label
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -7
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
}
