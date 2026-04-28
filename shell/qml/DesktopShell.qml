import QtQuick
import QtQuick.Layouts
import "components"
import "theme"

// macOS-style desktop with iOS controls inside a Settings window — meant to
// showcase the same component vocabulary working in landscape, multi-window
// form. Brand chrome stays minimal: just "Zamin" on the menu bar.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }

    // ─────────────────────────────────────────────────────────────────
    // Top menu bar (translucent)
    // ─────────────────────────────────────────────────────────────────
    Card {
        id: topbar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 0
        height: 28
        radius: 0
        tint: Theme.materialThick
        stroke: false

        // bottom hairline
        Rectangle {
            anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
            height: 1; color: Theme.separator
        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 14
            anchors.rightMargin: 14
            spacing: 18

            // Z mark
            Rectangle {
                Layout.preferredWidth: 18; Layout.preferredHeight: 18
                radius: width * Theme.squircle
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.cyan }
                    GradientStop { position: 1.0; color: Theme.blue }
                }
                Text { anchors.centerIn: parent; text: "Z"; color: "white"; font.bold: true; font.pixelSize: 11 }
            }

            // Menu items
            Repeater {
                model: ["Zamin", "Fayl", "Tahrirlash", "Ko'rinish", "Oyna", "Yordam"]
                delegate: Text {
                    text: modelData
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: index === 0 ? Font.Bold : Font.Medium
                }
            }

            Item { Layout.fillWidth: true }

            // Status icons
            Row {
                spacing: 14
                Text { text: "≋";  color: Theme.label; font.pixelSize: 14 }   // wifi
                Text { text: "♪";  color: Theme.label; font.pixelSize: 14 }   // sound
                Text { text: "🔋"; font.pixelSize: 12 }
                Text { text: "9:41";   color: Theme.label; font.pixelSize: 13; font.weight: Font.DemiBold }
                Text { text: "Sesh, 28 Apr"; color: Theme.labelSecondary; font.pixelSize: 12 }
            }

            // Avatar
            Rectangle {
                Layout.preferredWidth: 20; Layout.preferredHeight: 20
                radius: 10
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.orange }
                    GradientStop { position: 1.0; color: Theme.pink }
                }
                Text { anchors.centerIn: parent; text: "A"; color: "white"; font.bold: true; font.pixelSize: 11 }
            }
        }
    }

    // ─────────────────────────────────────────────────────────────────
    // Window 1 — Settings (showcases iOS components)
    // ─────────────────────────────────────────────────────────────────
    Item {
        id: win1
        x: 70; y: 60
        width: 540; height: 420

        // Drop shadow proxies (4 stacked rectangles for soft falloff)
        Repeater {
            model: 4
            delegate: Rectangle {
                anchors.fill: parent
                anchors.margins: -(index + 1) * 3
                radius: 18 + index
                color: "transparent"
                border.color: Qt.rgba(0, 0, 0, 0.12 - index * 0.025)
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

                Rectangle {
                    anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                    height: 1; color: Theme.separator
                }

                Row {
                    anchors.left: parent.left; anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8
                    Repeater {
                        model: [Theme.red, Theme.yellow, Theme.green]
                        delegate: Rectangle {
                            width: 12; height: 12; radius: 6
                            color: modelData
                            antialiasing: true
                        }
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Sozlamalar"
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.DemiBold
                }
            }

            Row {
                anchors.top: tb1.bottom; anchors.left: parent.left; anchors.right: parent.right
                anchors.bottom: parent.bottom
                spacing: 0

                // Sidebar
                Item {
                    width: 170; height: parent.height
                    Rectangle { anchors.fill: parent; color: Qt.rgba(0.07, 0.07, 0.09, 0.6) }
                    Rectangle {
                        anchors.right: parent.right; anchors.top: parent.top; anchors.bottom: parent.bottom
                        width: 1; color: Theme.separator
                    }

                    Column {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 2
                        Repeater {
                            model: [
                                { l: "≋",  t: "Wi-Fi",      sel: false, c: Theme.blue },
                                { l: "✦",  t: "Bluetooth",  sel: false, c: Theme.blue },
                                { l: "▦",  t: "Ekran",      sel: true,  c: Theme.indigo },
                                { l: "♪",  t: "Tovush",     sel: false, c: Theme.pink },
                                { l: "⌨",  t: "Klaviatura", sel: false, c: Theme.grey1 },
                                { l: "⌚", t: "Vaqt",       sel: false, c: Theme.purple },
                                { l: "↻",  t: "Yangilash",  sel: false, c: Theme.green }
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
                                        Text { anchors.centerIn: parent; text: modelData.l; color: "white"; font.pixelSize: 13; font.bold: true }
                                    }
                                    Text {
                                        text: modelData.t
                                        color: Theme.label
                                        font.family: Theme.fontFamily
                                        font.pixelSize: 13
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.weight: modelData.sel ? Font.DemiBold : Font.Normal
                                    }
                                }
                            }
                        }
                    }
                }

                // Content pane
                Item {
                    width: parent.width - 170; height: parent.height

                    Column {
                        anchors.fill: parent
                        anchors.margins: 18
                        spacing: 14

                        Text {
                            text: "Ekran"
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 22
                            font.weight: Font.Bold
                        }

                        Segmented {
                            width: parent.width
                            options: ["Yorqin", "Tungi", "Avtomatik"]
                            current: 1
                        }

                        Card {
                            width: parent.width
                            height: 56 * 3
                            radius: 12
                            tint: Theme.bgSecondary
                            stroke: false
                            Column {
                                anchors.fill: parent
                                ListRow { title: "Yorqinlik";       value: "78%";  trailing: "value";   iconGlyph: "☀"; iconColor: Theme.orange }
                                ListRow { title: "True Tone";       trailing: "switch"; checked: true; iconGlyph: "◐"; iconColor: Theme.blue }
                                ListRow { title: "Avtomatik qulflash"; value: "2 daqiqa"; trailing: "value"; iconGlyph: "⏱"; iconColor: Theme.grey1; divider: false }
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
                                ListRow { title: "Tashqi ekran";  subtitle: "1920×1080 · 60 Hz · faol"; trailing: "chevron"; iconGlyph: "▭"; iconColor: Theme.green }
                                ListRow { title: "Konvergensiya"; subtitle: "Avtomatik desktop rejim";  trailing: "switch"; checked: true; iconGlyph: "↔"; iconColor: Theme.indigo; divider: false }
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

    // ─────────────────────────────────────────────────────────────────
    // Window 2 — Notes
    // ─────────────────────────────────────────────────────────────────
    Item {
        id: win2
        x: 660; y: 220
        width: 460; height: 300

        Repeater {
            model: 4
            delegate: Rectangle {
                anchors.fill: parent
                anchors.margins: -(index + 1) * 3
                radius: 18 + index
                color: "transparent"
                border.color: Qt.rgba(0, 0, 0, 0.12 - index * 0.025)
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
                Rectangle {
                    anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                    height: 1; color: Theme.separator
                }
                Row {
                    anchors.left: parent.left; anchors.leftMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8
                    Repeater {
                        model: [Theme.red, Theme.yellow, Theme.green]
                        delegate: Rectangle { width: 12; height: 12; radius: 6; color: modelData; antialiasing: true }
                    }
                }
                Text {
                    anchors.centerIn: parent
                    text: "Eslatma"
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.DemiBold
                }
            }

            Column {
                anchors.top: tb2.bottom; anchors.left: parent.left; anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 18
                spacing: 8

                Text {
                    text: "ZaminOS reja — 1.0 versiya"
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 18
                    font.weight: Font.Bold
                }
                Text {
                    text: "28 aprel · soat 9:41"
                    color: Theme.labelSecondary
                    font.family: Theme.fontFamily
                    font.pixelSize: 12
                }
                Item { width: 1; height: 6 }

                Repeater {
                    model: [
                        "Konvergent qobiq dizayni — tayyor ✓",
                        "iOS uslubidagi komponentlar — tugma, switch, list",
                        "Sozlamalar oynasi — list rows + segmented",
                        "Qulay klaviatura va ovozli yordamchi",
                        "Birinchi yangilanish — keyingi haftaga"
                    ]
                    delegate: Row {
                        spacing: 10
                        Rectangle {
                            width: 18; height: 18; radius: 9
                            color: index < 2 ? Theme.green : Qt.rgba(1,1,1,0.10)
                            border.color: index < 2 ? Theme.green : Theme.grey3
                            border.width: 1.4
                            antialiasing: true
                            Text {
                                visible: index < 2
                                anchors.centerIn: parent
                                text: "✓"; color: "white"; font.pixelSize: 11; font.bold: true
                            }
                        }
                        Text {
                            text: modelData
                            color: Theme.label
                            font.family: Theme.fontFamily
                            font.pixelSize: 14
                            anchors.verticalCenter: parent.verticalCenter
                            opacity: index < 2 ? 0.6 : 1.0
                        }
                    }
                }
            }
        }
    }

    // ─────────────────────────────────────────────────────────────────
    // Dock (macOS-style)
    // ─────────────────────────────────────────────────────────────────
    Card {
        id: dock
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        height: 64
        width: dockRow.width + 24
        radius: 18
        tint: Qt.rgba(0.20, 0.20, 0.22, 0.55)

        Row {
            id: dockRow
            anchors.centerIn: parent
            spacing: 6

            Repeater {
                model: [
                    { g: "☏",  t1: "#34C759", t2: "#5AE07F" },
                    { g: "✉",  t1: "#34C759", t2: "#5AE07F" },
                    { g: "✉",  t1: "#0A84FF", t2: "#5AC8FA" },
                    { g: "❀",  t1: "#FF375F", t2: "#FF6B8A" },
                    { g: "▲",  t1: "#0A84FF", t2: "#5AC8FA" },
                    { g: "♪",  t1: "#FF375F", t2: "#FF6B8A" },
                    { g: "✎",  t1: "#FF9F0A", t2: "#FFC04A" },
                    { g: "◐",  t1: "#0A84FF", t2: "#5AC8FA" },
                    { g: "⚙",  t1: "#8E8E93", t2: "#AEAEB2" }
                ]
                delegate: Item {
                    width: 48; height: 48
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
                    Text { anchors.centerIn: parent; text: modelData.g; color: "white"; font.pixelSize: 22; font.bold: true }

                    // Running dot
                    Rectangle {
                        visible: index < 3
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
