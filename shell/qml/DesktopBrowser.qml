import QtQuick
import "components"
import "theme"

// Desktop Browser — tabs, address bar, page content.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    DesktopChrome { menuApp: "Brauzer" }

    Window_ {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -14
        width: 1160; height: 680
        title: "ZaminOS — Yangiliklar"

        Item {
            anchors.fill: parent

            // Tab strip
            Rectangle {
                id: tabs
                anchors.top: parent.top
                anchors.left: parent.left; anchors.right: parent.right
                height: 36
                color: Qt.rgba(0.07, 0.07, 0.09, 0.7)

                Row {
                    anchors.left: parent.left; anchors.leftMargin: 12
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.bottom: parent.bottom
                    spacing: 4

                    Repeater {
                        model: [
                            { fav: "Z", title: "ZaminOS — Yangiliklar", active: true  },
                            { fav: "G", title: "GitHub — abbosjon-dev/os", active: false },
                            { fav: "M", title: "MDN — Web docs",         active: false },
                            { fav: "Y", title: "YouTube",                active: false }
                        ]
                        delegate: Rectangle {
                            width: 220; height: 32
                            radius: 7
                            color: modelData.active ? Qt.rgba(0.13, 0.13, 0.15, 1.0) : "transparent"
                            anchors.bottom: parent.bottom

                            Row {
                                anchors.left: parent.left; anchors.leftMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: 10
                                Rectangle {
                                    width: 16; height: 16; radius: 3
                                    color: index === 0 ? Theme.cyan : index === 1 ? Theme.grey1 : index === 2 ? Theme.orange : Theme.red
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text { anchors.centerIn: parent; text: modelData.fav; color: "white"; font.bold: true; font.pixelSize: 10 }
                                }
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: modelData.title
                                    color: modelData.active ? Theme.label : Theme.labelSecondary
                                    font.family: Theme.fontFamily
                                    font.pixelSize: 12
                                    elide: Text.ElideRight
                                    width: 170
                                    renderType: Text.NativeRendering
                                }
                            }
                            Icon {
                                visible: modelData.active
                                anchors.right: parent.right
                                anchors.rightMargin: 8
                                anchors.verticalCenter: parent.verticalCenter
                                name: "x"; weight: "bold"; color: Theme.labelSecondary; size: 11
                            }
                        }
                    }

                    // New tab
                    Rectangle {
                        width: 28; height: 28; radius: 7
                        color: "transparent"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 2
                        Icon { anchors.centerIn: parent; name: "plus"; weight: "bold"; color: Theme.labelSecondary; size: 14 }
                    }
                }
            }

            // Address bar
            Rectangle {
                id: addr
                anchors.top: tabs.bottom
                anchors.left: parent.left; anchors.right: parent.right
                height: 44
                color: Qt.rgba(0.13, 0.13, 0.15, 1.0)

                Row {
                    anchors.left: parent.left; anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 12
                    Icon { name: "caret-left";  weight: "bold"; color: Theme.labelTertiary;   size: 18; anchors.verticalCenter: parent.verticalCenter }
                    Icon { name: "caret-right"; weight: "bold"; color: Theme.labelTertiary;   size: 18; anchors.verticalCenter: parent.verticalCenter }
                    Icon { name: "arrow-clockwise"; weight: "bold"; color: Theme.label;       size: 16; anchors.verticalCenter: parent.verticalCenter }
                }

                Rectangle {
                    anchors.left: parent.left; anchors.leftMargin: 100
                    anchors.right: parent.right; anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    height: 28
                    radius: 7
                    color: Theme.fillSec

                    Row {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        spacing: 8
                        Icon { name: "lock-simple"; weight: "fill"; color: Theme.green; size: 12; anchors.verticalCenter: parent.verticalCenter }
                        Text { text: "zaminos.uz/yangilikar"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 12; anchors.verticalCenter: parent.verticalCenter; renderType: Text.NativeRendering }
                    }

                    Icon {
                        anchors.right: parent.right
                        anchors.rightMargin: 8
                        anchors.verticalCenter: parent.verticalCenter
                        name: "bookmark-simple"; weight: "fill"; color: Theme.labelSecondary; size: 14
                    }
                }

                Row {
                    anchors.right: parent.right; anchors.rightMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 14
                    Icon { name: "share-network"; weight: "bold"; color: Theme.label; size: 16; anchors.verticalCenter: parent.verticalCenter }
                    Icon { name: "user";          weight: "fill"; color: Theme.label; size: 16; anchors.verticalCenter: parent.verticalCenter }
                    Icon { name: "dots-three";    weight: "bold"; color: Theme.label; size: 16; anchors.verticalCenter: parent.verticalCenter }
                }

                Rectangle { anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom; height: 1; color: Theme.separator }
            }

            // Page content
            Item {
                anchors.top: addr.bottom
                anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom

                Rectangle { anchors.fill: parent; color: Qt.rgba(0.16, 0.16, 0.18, 1.0) }

                Column {
                    anchors.fill: parent
                    anchors.margins: 36
                    spacing: 22

                    // Hero
                    Rectangle {
                        width: parent.width; height: 200
                        radius: 14
                        antialiasing: true
                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 0.0; color: "#0B0B23" }
                            GradientStop { position: 0.5; color: "#1A0F4D" }
                            GradientStop { position: 1.0; color: "#0F4A6E" }
                        }
                        Column {
                            anchors.left: parent.left; anchors.leftMargin: 30
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 8
                            Rectangle {
                                width: badge.implicitWidth + 24; height: 24; radius: 12
                                color: Qt.rgba(1, 1, 1, 0.18)
                                Text { id: badge; anchors.centerIn: parent; text: "YANGI"; color: "white"; font.family: Theme.fontFamily; font.pixelSize: 11; font.weight: Font.Bold; font.letterSpacing: 0.6; renderType: Text.NativeRendering }
                            }
                            Text { text: "ZaminOS 1.0 chiqdi"; color: "white"; font.family: Theme.fontDisplay; font.pixelSize: 36; font.weight: Font.Bold; renderType: Text.NativeRendering }
                            Text { text: "Bir qurilma — ikki ish rejimi. Bugun yangilang."; color: Qt.rgba(1, 1, 1, 0.85); font.family: Theme.fontFamily; font.pixelSize: 14; renderType: Text.NativeRendering }
                            Item { width: 1; height: 4 }
                            Button { text: "Yangilash"; style: "filled" }
                        }
                    }

                    // Articles
                    Row {
                        spacing: 22
                        Repeater {
                            model: [
                                { tag: "Yangiliklar", t: "Konvergensiya: telefon va kompyuter — bir qurilma", c1: Theme.blue,   c2: Theme.cyan },
                                { tag: "Dizayn",     t: "ZaminOS uchun yangi ikonkalar to'plami",          c1: Theme.orange, c2: Theme.yellow },
                                { tag: "Maxfiylik",  t: "Sizning ma'lumotlaringiz qurilmangizda qoladi",     c1: Theme.green,  c2: Theme.mint }
                            ]
                            delegate: Rectangle {
                                width: 320; height: 180
                                radius: 12
                                color: Qt.rgba(0.13, 0.13, 0.15, 1.0)
                                border.color: Theme.separator
                                border.width: 1
                                antialiasing: true

                                Rectangle {
                                    anchors.top: parent.top
                                    anchors.left: parent.left; anchors.right: parent.right
                                    height: 90
                                    radius: 12
                                    gradient: Gradient {
                                        orientation: Gradient.Horizontal
                                        GradientStop { position: 0.0; color: modelData.c2 }
                                        GradientStop { position: 1.0; color: modelData.c1 }
                                    }
                                    // Mask bottom corners
                                    Rectangle {
                                        anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                                        height: parent.radius
                                        color: parent.gradient && index < 0 ? "" : modelData.c1
                                    }
                                }

                                Column {
                                    anchors.top: parent.top
                                    anchors.topMargin: 102
                                    anchors.left: parent.left; anchors.leftMargin: 16
                                    anchors.right: parent.right; anchors.rightMargin: 16
                                    spacing: 6
                                    Text { text: modelData.tag; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 0.4; renderType: Text.NativeRendering }
                                    Text {
                                        width: parent.width
                                        text: modelData.t
                                        color: Theme.label
                                        font.family: Theme.fontFamily
                                        font.pixelSize: 14
                                        font.weight: Font.DemiBold
                                        wrapMode: Text.WordWrap
                                        renderType: Text.NativeRendering
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
