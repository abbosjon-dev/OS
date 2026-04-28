import QtQuick
import QtQuick.Layouts
import "components"
import "theme"

// Desktop shell — top menu bar, two windows (Settings + Notes), iOS dock.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }

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

            Repeater {
                model: ["Zamin", "Fayl", "Tahrirlash", "Ko'rinish", "Oyna", "Yordam"]
                delegate: Text {
                    text: modelData
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: index === 0 ? Font.Bold : Font.Medium
                    renderType: Text.NativeRendering
                }
            }

            Item { Layout.fillWidth: true }

            Row {
                spacing: 14
                Icon { name: "wifi-high";    weight: "bold"; color: Theme.label; size: 14; anchors.verticalCenter: parent.verticalCenter }
                Icon { name: "speaker-high"; weight: "bold"; color: Theme.label; size: 14; anchors.verticalCenter: parent.verticalCenter }
                Icon { name: "battery-full"; weight: "bold"; color: Theme.label; size: 16; anchors.verticalCenter: parent.verticalCenter }
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

    // ─── Window 1 — Settings ───
    Item {
        id: win1
        x: 70; y: 56
        width: 580; height: 460

        Repeater {
            model: 4
            delegate: Rectangle {
                anchors.fill: parent
                anchors.margins: -(index + 1) * 3
                radius: 18 + index
                color: "transparent"
                border.color: Qt.rgba(0, 0, 0, 0.15 - index * 0.03)
                border.width: 1
            }
        }

        Card {
            anchors.fill: parent
            radius: 14
            tint: Qt.rgba(0.11, 0.11, 0.13, 0.97)
            stroke: true

            // Title bar
            Item {
                id: tb1
                anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right
                height: 38
                Rectangle { anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom; height: 1; color: Theme.separator }
                Row {
                    anchors.left: parent.left; anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8
                    Repeater {
                        model: [Theme.red, Theme.yellow, Theme.green]
                        delegate: Rectangle { width: 12; height: 12; radius: 6; color: modelData; antialiasing: true }
                    }
                }
                Text { anchors.centerIn: parent; text: "Sozlamalar"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 13; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
            }

            Row {
                anchors.top: tb1.bottom; anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                spacing: 0

                // Sidebar
                Item {
                    width: 190; height: parent.height
                    Rectangle { anchors.fill: parent; color: Qt.rgba(0.07, 0.07, 0.09, 0.7) }
                    Rectangle { anchors.right: parent.right; anchors.top: parent.top; anchors.bottom: parent.bottom; width: 1; color: Theme.separator }

                    Column {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 2
                        Repeater {
                            model: [
                                { i: "wifi-high",    t: "Wi-Fi",       sel: false, c: Theme.blue   },
                                { i: "bluetooth",   t: "Bluetooth",   sel: false, c: Theme.blue   },
                                { i: "sun",          t: "Ekran",       sel: true,  c: Theme.indigo },
                                { i: "speaker-high", t: "Tovush",      sel: false, c: Theme.pink   },
                                { i: "keyboard",     t: "Klaviatura",  sel: false, c: Theme.grey1  },
                                { i: "calendar",     t: "Vaqt",        sel: false, c: Theme.purple },
                                { i: "arrow-clockwise", t: "Yangilash", sel: false, c: Theme.green },
                                { i: "user",         t: "Foydalanuvchi", sel: false, c: Theme.grey1 }
                            ]
                            delegate: Rectangle {
                                width: parent.width; height: 32
                                radius: 7
                                color: modelData.sel ? Qt.rgba(0.04, 0.52, 1.0, 0.22) : "transparent"
                                Row {
                                    anchors.left: parent.left; anchors.leftMargin: 8
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 10
                                    Rectangle {
                                        width: 22; height: 22; radius: 5
                                        color: modelData.c
                                        anchors.verticalCenter: parent.verticalCenter
                                        Icon { anchors.centerIn: parent; name: modelData.i; weight: "fill"; color: "white"; size: 13 }
                                    }
                                    Text {
                                        text: modelData.t
                                        color: Theme.label
                                        font.family: Theme.fontFamily
                                        font.pixelSize: 13
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.weight: modelData.sel ? Font.DemiBold : Font.Normal
                                        renderType: Text.NativeRendering
                                    }
                                }
                            }
                        }
                    }
                }

                Item {
                    width: parent.width - 190; height: parent.height

                    Column {
                        anchors.fill: parent
                        anchors.margins: 18
                        spacing: 14

                        Text { text: "Ekran"; color: Theme.label; font.family: Theme.fontDisplay; font.pixelSize: 22; font.weight: Font.Bold; renderType: Text.NativeRendering }

                        Segmented { width: parent.width; options: ["Yorqin", "Tungi", "Avtomatik"]; current: 1 }

                        Card {
                            width: parent.width
                            height: 56 * 3
                            radius: 12
                            tint: Theme.bgSecondary
                            stroke: false
                            Column {
                                anchors.fill: parent
                                ListRow { iconName: "sun";              iconColor: Theme.orange; title: "Yorqinlik";       value: "78%";       trailing: "value" }
                                ListRow { iconName: "moon";             iconColor: Theme.blue;   title: "True Tone";       trailing: "switch"; checked: true }
                                ListRow { iconName: "clock-counter-clockwise"; iconColor: Theme.grey1; title: "Avtomatik qulflash"; value: "2 daqiqa"; trailing: "value"; divider: false }
                            }
                        }

                        Card {
                            width: parent.width
                            height: 56 * 2
                            radius: 12
                            tint: Theme.bgSecondary
                            stroke: false
                            Column {
                                anchors.fill: parent
                                ListRow { iconName: "squares-four"; iconColor: Theme.green;  title: "Tashqi ekran";   subtitle: "1920×1080 · 60 Hz · faol";  trailing: "chevron" }
                                ListRow { iconName: "share-network"; iconColor: Theme.indigo; title: "Konvergensiya";  subtitle: "Avtomatik desktop rejim";   trailing: "switch"; checked: true; divider: false }
                            }
                        }

                        Row {
                            spacing: 10
                            anchors.right: parent.right
                            Button { text: "Bekor qilish"; style: "tinted" }
                            Button { text: "Qo'llash"; style: "filled" }
                        }
                    }
                }
            }
        }
    }

    // ─── Window 2 — Notes ───
    Item {
        id: win2
        x: 720; y: 220
        width: 460; height: 320

        Repeater {
            model: 4
            delegate: Rectangle {
                anchors.fill: parent
                anchors.margins: -(index + 1) * 3
                radius: 18 + index
                color: "transparent"
                border.color: Qt.rgba(0, 0, 0, 0.15 - index * 0.03)
                border.width: 1
            }
        }

        Card {
            anchors.fill: parent
            radius: 14
            tint: Qt.rgba(0.11, 0.11, 0.13, 0.97)
            stroke: true

            Item {
                id: tb2
                anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right
                height: 38
                Rectangle { anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom; height: 1; color: Theme.separator }
                Row {
                    anchors.left: parent.left; anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8
                    Repeater {
                        model: [Theme.red, Theme.yellow, Theme.green]
                        delegate: Rectangle { width: 12; height: 12; radius: 6; color: modelData; antialiasing: true }
                    }
                }
                Text { anchors.centerIn: parent; text: "Eslatma"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 13; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
            }

            Column {
                anchors.top: tb2.bottom; anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                anchors.margins: 18
                spacing: 8

                Text { text: "ZaminOS reja — 1.0 versiya"; color: Theme.label; font.family: Theme.fontDisplay; font.pixelSize: 18; font.weight: Font.Bold; renderType: Text.NativeRendering }
                Text { text: "28 aprel · soat 9:41"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 12; renderType: Text.NativeRendering }
                Item { width: 1; height: 6 }

                Repeater {
                    model: [
                        { t: "Konvergent qobiq dizayni — tayyor",        d: true },
                        { t: "iOS uslubidagi komponentlar — tugma, switch, list", d: true },
                        { t: "Haqiqiy SVG ikonkalar — Phosphor",          d: true },
                        { t: "Sozlamalar oynasi — list rows + segmented", d: true },
                        { t: "Qulay klaviatura va ovozli yordamchi",      d: false },
                        { t: "Birinchi yangilanish — keyingi haftaga",    d: false }
                    ]
                    delegate: Row {
                        spacing: 10
                        Rectangle {
                            width: 18; height: 18; radius: 9
                            color: modelData.d ? Theme.green : Qt.rgba(1,1,1,0.05)
                            border.color: modelData.d ? Theme.green : Theme.grey3
                            border.width: 1.4
                            antialiasing: true
                            anchors.verticalCenter: parent.verticalCenter
                            Icon { visible: modelData.d; anchors.centerIn: parent; name: "check"; weight: "bold"; color: "white"; size: 11 }
                        }
                        Text {
                            text: modelData.t
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 14
                            anchors.verticalCenter: parent.verticalCenter
                            opacity: modelData.d ? 0.55 : 1.0
                            renderType: Text.NativeRendering
                        }
                    }
                }
            }
        }
    }

    // ─── Dock ───
    Card {
        id: dock
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
                    { i: "phone",         t1: "#34C759", t2: "#5AE07F", run: true  },
                    { i: "chats",         t1: "#34C759", t2: "#5AE07F", run: true  },
                    { i: "envelope",      t1: "#0A84FF", t2: "#5AC8FA", run: true  },
                    { i: "image",         t1: "#FF375F", t2: "#FF6B8A", run: false },
                    { i: "map-trifold",   t1: "#0A84FF", t2: "#5AC8FA", run: false },
                    { i: "music-note",    t1: "#FF375F", t2: "#FF6B8A", run: false },
                    { i: "note-pencil",   t1: "#FF9F0A", t2: "#FFC04A", run: false },
                    { i: "compass",       t1: "#0A84FF", t2: "#5AC8FA", run: false },
                    { i: "calculator",    t1: "#FF9F0A", t2: "#FFC04A", run: false },
                    { i: "gear",          t1: "#8E8E93", t2: "#AEAEB2", run: false }
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
                        border.color: Qt.rgba(1,1,1,0.16)
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
