import QtQuick
import "components"
import "theme"

// Desktop Mail — three-pane: folders | message list | preview.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    DesktopChrome { menuApp: "Pochta" }

    Window_ {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -14
        width: 1140; height: 660
        title: "Pochta — Kiruvchi"

        Row {
            anchors.fill: parent
            spacing: 0

            // ─── Folders ───
            Item {
                width: 200; height: parent.height
                Rectangle { anchors.fill: parent; color: Qt.rgba(0.07, 0.07, 0.09, 0.7) }
                Rectangle { anchors.right: parent.right; anchors.top: parent.top; anchors.bottom: parent.bottom; width: 1; color: Theme.separator }

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 8

                    // Compose button
                    Rectangle {
                        width: parent.width; height: 32
                        radius: 7
                        color: Theme.blue
                        Row {
                            anchors.centerIn: parent
                            spacing: 6
                            Icon { name: "note-pencil"; weight: "fill"; color: "white"; size: 14; anchors.verticalCenter: parent.verticalCenter }
                            Text { text: "Yangi xat"; color: "white"; font.family: Theme.fontFamily; font.pixelSize: 13; font.weight: Font.DemiBold; anchors.verticalCenter: parent.verticalCenter; renderType: Text.NativeRendering }
                        }
                    }

                    Item { width: parent.width; height: 6 }

                    Repeater {
                        model: [
                            { i: "tray",            l: "Kiruvchi",   n: 4, sel: true  },
                            { i: "star",            l: "Yulduzli",   n: 0, sel: false },
                            { i: "file-text",       l: "Qoralama",   n: 2, sel: false },
                            { i: "paper-plane-tilt", l: "Yuborilgan", n: 0, sel: false },
                            { i: "trash",           l: "Savatcha",   n: 0, sel: false }
                        ]
                        delegate: Rectangle {
                            width: parent.width; height: 30
                            radius: 7
                            color: modelData.sel ? Qt.rgba(0.04, 0.52, 1.0, 0.22) : "transparent"

                            Row {
                                anchors.left: parent.left; anchors.leftMargin: 8
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: 10
                                Icon { anchors.verticalCenter: parent.verticalCenter; name: modelData.i === "paper-plane-tilt" ? "paperclip" : modelData.i; weight: "fill"; color: modelData.sel ? Theme.blue : Theme.labelSecondary; size: 16 }
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
                            Text {
                                visible: modelData.n > 0
                                anchors.right: parent.right
                                anchors.rightMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                text: modelData.n
                                color: Theme.labelSecondary
                                font.family: Theme.fontFamily
                                font.pixelSize: 12
                                renderType: Text.NativeRendering
                            }
                        }
                    }
                }
            }

            // ─── Message list ───
            Item {
                width: 360; height: parent.height
                Rectangle { anchors.fill: parent; color: Qt.rgba(0.10, 0.10, 0.12, 1.0) }
                Rectangle { anchors.right: parent.right; anchors.top: parent.top; anchors.bottom: parent.bottom; width: 1; color: Theme.separator }

                Item {
                    id: listToolbar
                    anchors.top: parent.top
                    anchors.left: parent.left; anchors.right: parent.right
                    height: 44

                    Text {
                        anchors.left: parent.left; anchors.leftMargin: 14
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Kiruvchi"
                        color: Theme.label
                        font.family: Theme.fontDisplay
                        font.pixelSize: 17
                        font.weight: Font.Bold
                        renderType: Text.NativeRendering
                    }
                    Text {
                        anchors.right: parent.right; anchors.rightMargin: 14
                        anchors.verticalCenter: parent.verticalCenter
                        text: "5 ta yangi"
                        color: Theme.labelSecondary
                        font.family: Theme.fontFamily
                        font.pixelSize: 12
                        renderType: Text.NativeRendering
                    }

                    Rectangle { anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom; height: 1; color: Theme.separator }
                }

                Column {
                    anchors.top: listToolbar.bottom
                    anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom

                    Repeater {
                        model: [
                            { from: "ZaminOS jamoasi",  subj: "Yangi versiya 1.0 chiqdi", body: "Salom! ZaminOS 1.0 versiyasi chiqdi — yangi konvergent qobiq, …", time: "9:21",  sel: true,  unread: true  },
                            { from: "Aziza",             subj: "Bugungi reja",             body: "Soat 14:00 ga uchrashuvga tayyor bo'lib turing", time: "8:42",  sel: false, unread: true  },
                            { from: "GitHub",            subj: "[abbosjon-dev/os] PR ochildi", body: "@claude tomonidan yangi pull request ochildi", time: "Sesh", sel: false, unread: true  },
                            { from: "Bank",              subj: "Karta hisobotingiz",       body: "April oyi uchun hisobot tayyor", time: "Sesh", sel: false, unread: false },
                            { from: "Uy bekasi",         subj: "Kommunal to'lovlar",       body: "Mart oyi to'lovlari haqida ma'lumot", time: "Yak",  sel: false, unread: true  }
                        ]
                        delegate: Item {
                            width: parent.width; height: 78

                            Rectangle {
                                anchors.fill: parent
                                color: modelData.sel ? Theme.blue : "transparent"
                            }

                            Rectangle {
                                visible: modelData.unread && !modelData.sel
                                anchors.left: parent.left
                                anchors.leftMargin: 6
                                anchors.verticalCenter: parent.verticalCenter
                                width: 8; height: 8; radius: 4
                                color: Theme.blue
                            }

                            Column {
                                anchors.left: parent.left; anchors.leftMargin: 22
                                anchors.right: parent.right; anchors.rightMargin: 14
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: 2

                                Row {
                                    width: parent.width
                                    Text {
                                        text: modelData.from
                                        color: modelData.sel ? "white" : Theme.label
                                        font.family: Theme.fontFamily
                                        font.pixelSize: 14
                                        font.weight: Font.DemiBold
                                        elide: Text.ElideRight
                                        width: parent.width - 50
                                        renderType: Text.NativeRendering
                                    }
                                    Text {
                                        text: modelData.time
                                        color: modelData.sel ? Qt.rgba(1, 1, 1, 0.7) : Theme.labelSecondary
                                        font.family: Theme.fontFamily
                                        font.pixelSize: 12
                                        renderType: Text.NativeRendering
                                    }
                                }
                                Text {
                                    text: modelData.subj
                                    color: modelData.sel ? "white" : Theme.label
                                    font.family: Theme.fontFamily
                                    font.pixelSize: 13
                                    font.weight: Font.Medium
                                    elide: Text.ElideRight
                                    width: parent.width
                                    renderType: Text.NativeRendering
                                }
                                Text {
                                    text: modelData.body
                                    color: modelData.sel ? Qt.rgba(1, 1, 1, 0.7) : Theme.labelSecondary
                                    font.family: Theme.fontFamily
                                    font.pixelSize: 12
                                    elide: Text.ElideRight
                                    width: parent.width
                                    renderType: Text.NativeRendering
                                }
                            }

                            Rectangle {
                                anchors.bottom: parent.bottom
                                anchors.left: parent.left; anchors.right: parent.right
                                height: 1
                                color: Theme.separator
                                opacity: 0.4
                            }
                        }
                    }
                }
            }

            // ─── Preview pane ───
            Item {
                width: parent.width - 200 - 360; height: parent.height
                Rectangle { anchors.fill: parent; color: Qt.rgba(0.11, 0.11, 0.13, 1.0) }

                Item {
                    anchors.fill: parent
                    anchors.margins: 28

                    Row {
                        id: msgHead
                        spacing: 14
                        Rectangle {
                            width: 44; height: 44; radius: 22
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: Theme.cyan }
                                GradientStop { position: 1.0; color: Theme.blue }
                            }
                            Text { anchors.centerIn: parent; text: "Z"; color: "white"; font.bold: true; font.pixelSize: 20 }
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 1
                            Text { text: "ZaminOS jamoasi"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 16; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
                            Text { text: "<jamoa@zaminos.uz>  →  Abbosjon"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 12; renderType: Text.NativeRendering }
                        }
                    }

                    Text {
                        id: msgSubj
                        anchors.top: msgHead.bottom
                        anchors.topMargin: 18
                        text: "Yangi versiya 1.0 chiqdi"
                        color: Theme.label
                        font.family: Theme.fontDisplay
                        font.pixelSize: 22
                        font.weight: Font.Bold
                        renderType: Text.NativeRendering
                    }
                    Text {
                        id: msgTime
                        anchors.top: msgSubj.bottom
                        anchors.topMargin: 4
                        text: "28 aprel · 9:21"
                        color: Theme.labelSecondary
                        font.family: Theme.fontFamily
                        font.pixelSize: 12
                        renderType: Text.NativeRendering
                    }

                    Rectangle {
                        anchors.top: msgTime.bottom
                        anchors.topMargin: 16
                        anchors.left: parent.left; anchors.right: parent.right
                        height: 1; color: Theme.separator
                    }

                    Column {
                        anchors.top: msgTime.bottom
                        anchors.topMargin: 30
                        anchors.left: parent.left; anchors.right: parent.right
                        spacing: 14

                        Text {
                            text: "Salom Abbosjon,"
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 14
                            renderType: Text.NativeRendering
                        }
                        Text {
                            width: parent.width
                            text: "ZaminOS 1.0 versiyasi chiqdi! Yangi konvergent qobiq, qaytadan loyihalangan ikonkalar to'plami va sezilarli ishlash yaxshilanishlari mavjud."
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 14
                            wrapMode: Text.WordWrap
                            renderType: Text.NativeRendering
                            lineHeight: 1.4
                        }
                        Text {
                            width: parent.width
                            text: "Qurilmangiz Wi-Fi ulanganda avtomatik yangilanadi. Yangiliklar: tashqi monitor avtomatik aniqlash, takomillashtirilgan kamera, 12 ta yangi til."
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 14
                            wrapMode: Text.WordWrap
                            renderType: Text.NativeRendering
                            lineHeight: 1.4
                        }
                        Text {
                            text: "Hurmat bilan,\nZaminOS jamoasi"
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 14
                            renderType: Text.NativeRendering
                            lineHeight: 1.4
                        }

                        Row {
                            spacing: 10
                            Button { text: "Javob"; style: "filled" }
                            Button { text: "Yo'naltirish"; style: "tinted" }
                            Button { text: "Arxiv"; style: "tinted" }
                        }
                    }
                }
            }
        }
    }
}
