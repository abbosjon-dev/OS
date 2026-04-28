import QtQuick
import "components"
import "theme"

// Desktop Music — Now Playing over a sidebar of playlists and library.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    DesktopChrome { menuApp: "Musiqa" }

    Window_ {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -14
        width: 1140; height: 660
        title: "Musiqa — Yangiroq"

        Row {
            anchors.fill: parent
            spacing: 0

            // Sidebar
            Item {
                width: 220; height: parent.height
                Rectangle { anchors.fill: parent; color: Qt.rgba(0.07, 0.07, 0.09, 0.7) }
                Rectangle { anchors.right: parent.right; anchors.top: parent.top; anchors.bottom: parent.bottom; width: 1; color: Theme.separator }

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 14

                    Column {
                        spacing: 2; width: parent.width
                        Text { text: "KUTUBXONA"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 0.4; leftPadding: 6; renderType: Text.NativeRendering }
                        Repeater {
                            model: [
                                { i: "music-note",  l: "Hozirgi qo'shiq", sel: true  },
                                { i: "music-notes", l: "Qo'shiqlar",      sel: false },
                                { i: "user",        l: "Ijrochilar",      sel: false },
                                { i: "image",       l: "Albomlar",        sel: false },
                                { i: "heart-fill",  l: "Sevimlilar",      sel: false }
                            ]
                            delegate: Rectangle {
                                width: parent.width; height: 30
                                radius: 7
                                color: modelData.sel ? Qt.rgba(1, 0.22, 0.37, 0.22) : "transparent"
                                Row {
                                    anchors.left: parent.left; anchors.leftMargin: 8
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 10
                                    Icon { anchors.verticalCenter: parent.verticalCenter; name: modelData.i; weight: "fill"; color: modelData.sel ? Theme.pink : Theme.labelSecondary; size: 16 }
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: modelData.l
                                        color: Theme.label
                                        font.family: Theme.fontFamily
                                        font.pixelSize: 13
                                        font.weight: modelData.sel ? Font.DemiBold : Font.Normal
                                        renderType: Text.NativeRendering
                                    }
                                }
                            }
                        }
                    }

                    Column {
                        spacing: 2; width: parent.width
                        Text { text: "PLEYLISTLAR"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 0.4; leftPadding: 6; renderType: Text.NativeRendering }
                        Repeater {
                            model: ["Yangi 2026", "Mehnat soatlari", "Hayotni sevish", "Avtomobilda", "Eski qo'shiqlar"]
                            delegate: Rectangle {
                                width: parent.width; height: 26
                                color: "transparent"
                                Text {
                                    anchors.left: parent.left; anchors.leftMargin: 14
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: modelData
                                    color: Theme.label
                                    font.family: Theme.fontFamily
                                    font.pixelSize: 12
                                    renderType: Text.NativeRendering
                                }
                            }
                        }
                    }
                }
            }

            // Main pane
            Item {
                width: parent.width - 220 - 320; height: parent.height
                Rectangle { anchors.fill: parent; color: Qt.rgba(0.10, 0.10, 0.12, 1.0) }

                Column {
                    anchors.fill: parent
                    anchors.margins: 32
                    spacing: 20

                    // Album art big
                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 220; height: 220
                        radius: 18
                        antialiasing: true
                        gradient: Gradient {
                            orientation: Gradient.Vertical
                            GradientStop { position: 0.0; color: "#FF6B8A" }
                            GradientStop { position: 1.0; color: "#FF375F" }
                        }
                        Icon { anchors.centerIn: parent; name: "music-notes"; weight: "fill"; color: "white"; size: 80 }
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Yo'lda"
                        color: Theme.label
                        font.family: Theme.fontDisplay
                        font.pixelSize: 30
                        font.weight: Font.Bold
                        renderType: Text.NativeRendering
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Munisa  ·  Yangiroq albomi  ·  2026"
                        color: Theme.labelSecondary
                        font.family: Theme.fontFamily
                        font.pixelSize: 14
                        renderType: Text.NativeRendering
                    }

                    // Progress bar
                    Item {
                        width: parent.width
                        height: 28

                        Text { anchors.left: parent.left; text: "1:42"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 11; renderType: Text.NativeRendering }
                        Text { anchors.right: parent.right; text: "−2:18"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 11; renderType: Text.NativeRendering }

                        Rectangle {
                            anchors.left: parent.left; anchors.leftMargin: 32
                            anchors.right: parent.right; anchors.rightMargin: 38
                            anchors.verticalCenter: parent.verticalCenter
                            height: 4
                            radius: 2
                            color: Theme.fillSec
                            Rectangle {
                                anchors.left: parent.left
                                anchors.top: parent.top; anchors.bottom: parent.bottom
                                width: parent.width * 0.42
                                radius: 2
                                color: Theme.label
                            }
                            Rectangle {
                                width: 12; height: 12; radius: 6
                                color: "white"
                                anchors.verticalCenter: parent.verticalCenter
                                x: parent.width * 0.42 - 6
                                antialiasing: true
                            }
                        }
                    }

                    // Controls
                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 32
                        Icon { name: "shuffle";       weight: "bold"; color: Theme.labelSecondary; size: 20; anchors.verticalCenter: parent.verticalCenter }
                        Icon { name: "skip-back";     weight: "fill"; color: Theme.label; size: 28; anchors.verticalCenter: parent.verticalCenter }
                        Rectangle {
                            anchors.verticalCenter: parent.verticalCenter
                            width: 56; height: 56; radius: 28
                            color: Theme.label
                            Icon { anchors.centerIn: parent; name: "pause"; weight: "fill"; color: Theme.bgSystem; size: 24 }
                        }
                        Icon { name: "skip-forward";  weight: "fill"; color: Theme.label; size: 28; anchors.verticalCenter: parent.verticalCenter }
                        Icon { name: "repeat";        weight: "bold"; color: Theme.labelSecondary; size: 20; anchors.verticalCenter: parent.verticalCenter }
                    }
                }
            }

            // Up next
            Item {
                width: 320; height: parent.height
                Rectangle { anchors.fill: parent; color: Qt.rgba(0.08, 0.08, 0.10, 1.0) }
                Rectangle { anchors.left: parent.left; anchors.top: parent.top; anchors.bottom: parent.bottom; width: 1; color: Theme.separator }

                Column {
                    anchors.fill: parent
                    anchors.margins: 18
                    spacing: 10

                    Text {
                        text: "Keyingi"
                        color: Theme.label
                        font.family: Theme.fontDisplay
                        font.pixelSize: 18
                        font.weight: Font.Bold
                        renderType: Text.NativeRendering
                    }

                    Repeater {
                        model: [
                            { t: "Sahar yelpig'i",  a: "Munisa", d: "3:42", playing: false },
                            { t: "Tonggi quyosh",    a: "Munisa", d: "4:08", playing: false },
                            { t: "Bahor nafasi",     a: "Munisa", d: "3:21", playing: false },
                            { t: "Tog'lar tongida",  a: "Sevinch", d: "4:55", playing: false },
                            { t: "Yo'lda",           a: "Sevinch", d: "3:18", playing: false }
                        ]
                        delegate: Item {
                            width: parent.width; height: 44

                            Row {
                                anchors.fill: parent
                                anchors.leftMargin: 4; anchors.rightMargin: 4
                                spacing: 12

                                Rectangle {
                                    width: 40; height: 40; radius: 6
                                    anchors.verticalCenter: parent.verticalCenter
                                    gradient: Gradient {
                                        GradientStop { position: 0.0; color: index % 2 === 0 ? Theme.indigo : Theme.cyan }
                                        GradientStop { position: 1.0; color: index % 2 === 0 ? Theme.purple : Theme.blue }
                                    }
                                    Icon { anchors.centerIn: parent; name: "music-note"; weight: "fill"; color: "white"; size: 18 }
                                }

                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 1
                                    Text { text: modelData.t; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 13; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
                                    Text { text: modelData.a; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 11; renderType: Text.NativeRendering }
                                }
                            }

                            Text {
                                anchors.right: parent.right; anchors.rightMargin: 4
                                anchors.verticalCenter: parent.verticalCenter
                                text: modelData.d
                                color: Theme.labelSecondary
                                font.family: Theme.fontFamily
                                font.pixelSize: 11
                                renderType: Text.NativeRendering
                            }
                        }
                    }
                }
            }
        }
    }
}
