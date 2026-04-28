import QtQuick
import "components"
import "theme"

// Desktop — Files (file manager) full window over wallpaper.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    DesktopChrome { menuApp: "Fayllar" }

    Window_ {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -14
        width: 1080; height: 640
        title: "Fayllar — Hujjatlar"

        Row {
            anchors.fill: parent
            spacing: 0

            // ─── Sidebar ───
            Item {
                width: 220; height: parent.height
                Rectangle { anchors.fill: parent; color: Qt.rgba(0.07, 0.07, 0.09, 0.7) }
                Rectangle { anchors.right: parent.right; anchors.top: parent.top; anchors.bottom: parent.bottom; width: 1; color: Theme.separator }

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 12

                    // Section: Sevimlilar
                    Text { text: "SEVIMLI";       color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 0.4; leftPadding: 6; renderType: Text.NativeRendering }
                    Column {
                        spacing: 2; width: parent.width
                        Repeater {
                            model: [
                                { i: "house",       l: "Bosh papka",   sel: false, c: Theme.blue   },
                                { i: "file-text",   l: "Hujjatlar",    sel: true,  c: Theme.blue   },
                                { i: "image",       l: "Rasmlar",      sel: false, c: Theme.pink   },
                                { i: "music-note",  l: "Musiqa",       sel: false, c: Theme.pink   },
                                { i: "file-arrow-down", l: "Yuklamalar", sel: false, c: Theme.green },
                                { i: "trash",       l: "Savatcha",     sel: false, c: Theme.grey1  }
                            ]
                            delegate: Rectangle {
                                width: parent.width; height: 30
                                radius: 7
                                color: modelData.sel ? Qt.rgba(0.04, 0.52, 1.0, 0.22) : "transparent"
                                Row {
                                    anchors.left: parent.left; anchors.leftMargin: 8
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 10
                                    Icon { anchors.verticalCenter: parent.verticalCenter; name: modelData.i; weight: "fill"; color: modelData.c; size: 16 }
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

                    // Section: Teglar
                    Text { text: "TEGLAR";  color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 0.4; leftPadding: 6; topPadding: 6; renderType: Text.NativeRendering }
                    Column {
                        spacing: 2; width: parent.width
                        Repeater {
                            model: [
                                { c: Theme.red,    l: "Muhim" },
                                { c: Theme.orange, l: "Ish" },
                                { c: Theme.green,  l: "Shaxsiy" },
                                { c: Theme.purple, l: "Idea" }
                            ]
                            delegate: Item {
                                width: parent.width; height: 26
                                Row {
                                    anchors.left: parent.left; anchors.leftMargin: 14
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 10
                                    Rectangle { width: 10; height: 10; radius: 5; color: modelData.c; anchors.verticalCenter: parent.verticalCenter }
                                    Text { text: modelData.l; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 12; anchors.verticalCenter: parent.verticalCenter; renderType: Text.NativeRendering }
                                }
                            }
                        }
                    }
                }
            }

            // ─── Toolbar + grid ───
            Item {
                width: parent.width - 220; height: parent.height

                // Toolbar
                Item {
                    id: toolbar
                    anchors.top: parent.top
                    anchors.left: parent.left; anchors.right: parent.right
                    height: 44

                    Row {
                        anchors.left: parent.left; anchors.leftMargin: 14
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10
                        Icon { name: "caret-left";  weight: "bold"; color: Theme.labelSecondary; size: 18; anchors.verticalCenter: parent.verticalCenter }
                        Icon { name: "caret-right"; weight: "bold"; color: Theme.labelTertiary;  size: 18; anchors.verticalCenter: parent.verticalCenter }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "Hujjatlar"
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            renderType: Text.NativeRendering
                        }
                    }

                    Row {
                        anchors.right: parent.right; anchors.rightMargin: 14
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 8

                        // View segmented
                        Rectangle {
                            width: 70; height: 26; radius: 7
                            color: Theme.fillSec
                            Row {
                                anchors.fill: parent
                                Rectangle { width: parent.width / 2; height: parent.height; color: Theme.grey4; radius: 6
                                    Icon { anchors.centerIn: parent; name: "squares-four"; weight: "fill"; color: Theme.label; size: 13 }
                                }
                                Item { width: parent.width / 2; height: parent.height
                                    Icon { anchors.centerIn: parent; name: "list"; weight: "bold"; color: Theme.labelSecondary; size: 13 }
                                }
                            }
                        }

                        // Search
                        Rectangle {
                            width: 180; height: 26; radius: 7
                            color: Theme.fillSec
                            Row {
                                anchors.fill: parent
                                anchors.leftMargin: 8
                                spacing: 6
                                Icon { anchors.verticalCenter: parent.verticalCenter; name: "magnifying-glass"; weight: "bold"; color: Theme.labelSecondary; size: 13 }
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "Qidirish"
                                    color: Theme.labelSecondary
                                    font.family: Theme.fontFamily
                                    font.pixelSize: 12
                                    renderType: Text.NativeRendering
                                }
                            }
                        }
                    }

                    Rectangle {
                        anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                        height: 1; color: Theme.separator
                    }
                }

                // File grid
                Grid {
                    anchors.top: toolbar.bottom
                    anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                    anchors.margins: 24
                    columns: 6
                    rowSpacing: 24
                    columnSpacing: 24
                    property real cellW: (width - 5 * 24) / 6

                    Repeater {
                        model: [
                            { name: "Reja.pdf",          icon: "file-pdf",  c: Theme.red    },
                            { name: "Suratlar",          icon: "folder",    c: Theme.blue   },
                            { name: "Loyiha",            icon: "folder",    c: Theme.blue   },
                            { name: "Hisobot.xlsx",      icon: "file-doc",  c: Theme.green  },
                            { name: "Slaydlar.pdf",      icon: "file-pdf",  c: Theme.red    },
                            { name: "Skript.sh",         icon: "code",      c: Theme.grey1  },
                            { name: "Logotip.svg",       icon: "file-image", c: Theme.purple },
                            { name: "Eslatma.md",        icon: "file-text", c: Theme.orange },
                            { name: "Musiqa",            icon: "folder",    c: Theme.pink   },
                            { name: "Backup.zip",        icon: "file-zip",  c: Theme.brown  },
                            { name: "Uchrashuv.mp4",     icon: "file-video", c: Theme.indigo },
                            { name: "Soundtrack.mp3",    icon: "file-audio", c: Theme.pink   }
                        ]
                        delegate: Column {
                            spacing: 6
                            Rectangle {
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: 64; height: 64
                                radius: width * Theme.squircle
                                gradient: Gradient {
                                    GradientStop { position: 0.0; color: Qt.lighter(modelData.c, 1.25) }
                                    GradientStop { position: 1.0; color: modelData.c }
                                }
                                antialiasing: true
                                Icon { anchors.centerIn: parent; name: modelData.icon; weight: "fill"; color: "white"; size: 30 }
                            }
                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: modelData.name
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
    }
}
