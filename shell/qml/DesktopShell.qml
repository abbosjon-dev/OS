import QtQuick
import QtQuick.Layouts
import "components"
import "theme"

Item {
    id: root
    anchors.fill: parent

    Wallpaper {}

    // Top panel
    Rectangle {
        id: topPanel
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 36
        color: Qt.rgba(0.04, 0.10, 0.08, 0.85)
        border.color: Theme.stroke
        border.width: 0

        Rectangle { // bottom hairline
            anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
            height: 1; color: Theme.stroke
        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: Theme.spaceMd
            anchors.rightMargin: Theme.spaceMd
            spacing: Theme.spaceMd

            // Logo / activities
            Rectangle {
                Layout.preferredHeight: 24
                Layout.preferredWidth: 70
                radius: Theme.radSm
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: Theme.accent }
                    GradientStop { position: 1.0; color: Theme.accentSoft }
                }
                Text {
                    anchors.centerIn: parent
                    text: "Zamin"
                    color: "#0A1814"
                    font.family: Theme.fontFamily
                    font.bold: true
                    font.pixelSize: 12
                }
            }

            // Window title
            Text {
                text: "Fayllar  —  Hujjatlar"
                color: Theme.textMid
                font.family: Theme.fontFamily
                font.pixelSize: 12
            }

            Item { Layout.fillWidth: true }

            // Tray icons
            Row {
                spacing: Theme.spaceMd
                Text { text: "Wi-Fi"; color: Theme.textMid; font.pixelSize: 12 }
                Text { text: "🔊"; color: Theme.textHi; font.pixelSize: 13 }
                Text { text: "🔋 78%"; color: Theme.textHi; font.pixelSize: 12 }
            }

            // Clock
            Column {
                Layout.preferredWidth: 90
                spacing: -2
                Text {
                    text: "9:41"
                    color: Theme.textHi
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.bold: true
                    horizontalAlignment: Text.AlignRight
                    width: parent.width
                }
                Text {
                    text: "Sesh, 28 Apr"
                    color: Theme.textMid
                    font.family: Theme.fontFamily
                    font.pixelSize: 10
                    horizontalAlignment: Text.AlignRight
                    width: parent.width
                }
            }

            // Avatar
            Rectangle {
                Layout.preferredWidth: 24; Layout.preferredHeight: 24
                radius: 12
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.gold }
                    GradientStop { position: 1.0; color: Theme.earth }
                }
                Text { anchors.centerIn: parent; text: "A"; color: "#1A1108"; font.bold: true; font.pixelSize: 12 }
            }
        }
    }

    // Window 1: File manager
    Rectangle {
        id: win1
        x: 60; y: 80
        width: 520; height: 360
        radius: Theme.radMd
        color: Qt.rgba(0.06, 0.14, 0.12, 0.96)
        border.color: Theme.stroke
        border.width: 1

        // Title bar
        Rectangle {
            id: tb1
            anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right
            height: 32
            radius: Theme.radMd
            color: Qt.rgba(0.04, 0.09, 0.07, 1.0)

            // mask the bottom corners
            Rectangle {
                anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                height: parent.radius; color: parent.color
            }
            Rectangle {
                anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                height: 1; color: Theme.stroke
            }

            Row {
                anchors.left: parent.left; anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8
                Repeater {
                    model: [Theme.danger, Theme.gold, Theme.success]
                    delegate: Rectangle {
                        width: 12; height: 12; radius: 6; color: modelData
                    }
                }
            }
            Text {
                anchors.centerIn: parent
                text: "Fayllar  —  Hujjatlar"
                color: Theme.textMid
                font.family: Theme.fontFamily
                font.pixelSize: 12
            }
        }

        Row {
            anchors.top: tb1.bottom; anchors.left: parent.left; anchors.right: parent.right
            anchors.bottom: parent.bottom
            spacing: 0

            // Sidebar
            Rectangle {
                width: 140; height: parent.height
                color: Qt.rgba(0.04, 0.10, 0.08, 1.0)
                Column {
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 6

                    Text { text: "JOYLAR"; color: Theme.textDim; font.pixelSize: 9; font.bold: true; font.letterSpacing: 1 }
                    Repeater {
                        model: [
                            { l: "🏠  Bosh papka",  active: false },
                            { l: "📄  Hujjatlar",   active: true  },
                            { l: "⬇  Yuklamalar",   active: false },
                            { l: "🖼  Rasmlar",     active: false },
                            { l: "♫  Musiqa",       active: false },
                            { l: "📺  Videolar",    active: false }
                        ]
                        delegate: Rectangle {
                            width: parent.width; height: 26
                            radius: 6
                            color: modelData.active ? Qt.rgba(0.12, 0.71, 0.65, 0.18) : "transparent"
                            Text {
                                anchors.left: parent.left; anchors.leftMargin: 8
                                anchors.verticalCenter: parent.verticalCenter
                                text: modelData.l
                                color: modelData.active ? Theme.accentSoft : Theme.textMid
                                font.family: Theme.fontFamily
                                font.pixelSize: 11
                            }
                        }
                    }
                }
            }

            // Vertical divider
            Rectangle { width: 1; height: parent.height; color: Theme.stroke }

            // File grid
            Item {
                width: parent.width - 141; height: parent.height
                GridLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    columns: 4
                    rowSpacing: 12
                    columnSpacing: 12

                    Repeater {
                        model: [
                            { n: "Reja.pdf",       g: "📄", t1: "#E5484D", t2: "#F47075" },
                            { n: "Suratlar",       g: "📁", t1: "#E8B14F", t2: "#F4CB7A" },
                            { n: "Loyiha",         g: "📁", t1: "#E8B14F", t2: "#F4CB7A" },
                            { n: "Hisobot.xlsx",   g: "📊", t1: "#30A46C", t2: "#4FC48C" },
                            { n: "Slaydlar.odp",   g: "📊", t1: "#9B6BFF", t2: "#B894FF" },
                            { n: "Skript.sh",      g: "</>","t1": "#1FB6A5", t2: "#3FD9C8" },
                            { n: "Logotip.svg",    g: "🖼", t1: "#3D8BFF", t2: "#6FACFF" },
                            { n: "Eslatma.md",     g: "📝", t1: "#C28B5A", t2: "#D9A87A" }
                        ]
                        delegate: Column {
                            spacing: 4
                            Layout.alignment: Qt.AlignHCenter
                            Rectangle {
                                width: 56; height: 56; radius: Theme.radSm
                                anchors.horizontalCenter: parent.horizontalCenter
                                gradient: Gradient {
                                    GradientStop { position: 0.0; color: modelData.t1 }
                                    GradientStop { position: 1.0; color: modelData.t2 }
                                }
                                Text { anchors.centerIn: parent; text: modelData.g; font.pixelSize: 22 }
                            }
                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: modelData.n
                                color: Theme.textHi
                                font.family: Theme.fontFamily
                                font.pixelSize: 10
                            }
                        }
                    }
                }
            }
        }
    }

    // Window 2: Terminal
    Rectangle {
        id: win2
        x: 620; y: 200
        width: 540; height: 300
        radius: Theme.radMd
        color: Qt.rgba(0.03, 0.08, 0.06, 0.97)
        border.color: Theme.stroke
        border.width: 1

        Rectangle {
            id: tb2
            anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right
            height: 32
            radius: Theme.radMd
            color: Qt.rgba(0.02, 0.06, 0.04, 1.0)
            Rectangle {
                anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                height: parent.radius; color: parent.color
            }
            Rectangle {
                anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
                height: 1; color: Theme.stroke
            }
            Row {
                anchors.left: parent.left; anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8
                Repeater {
                    model: [Theme.danger, Theme.gold, Theme.success]
                    delegate: Rectangle { width: 12; height: 12; radius: 6; color: modelData }
                }
            }
            Text {
                anchors.centerIn: parent
                text: "Terminal  —  zsh"
                color: Theme.textMid
                font.family: Theme.fontFamily
                font.pixelSize: 12
            }
        }

        Column {
            anchors.top: tb2.bottom
            anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom
            anchors.margins: 12
            spacing: 2

            Text { text: "❯  neofetch"; color: Theme.accentSoft; font.family: "monospace"; font.pixelSize: 11 }
            Text { text: "  OS:      ZaminOS rolling aarch64";   color: Theme.textHi;  font.family: "monospace"; font.pixelSize: 11 }
            Text { text: "  Host:    PinePhone 1.2";              color: Theme.textHi;  font.family: "monospace"; font.pixelSize: 11 }
            Text { text: "  Kernel:  6.8.0-zamin1-pinephone";     color: Theme.textHi;  font.family: "monospace"; font.pixelSize: 11 }
            Text { text: "  Shell:   zaminshell 0.1.0";           color: Theme.textHi;  font.family: "monospace"; font.pixelSize: 11 }
            Text { text: "  WM:      KWin (Wayland)";              color: Theme.textHi;  font.family: "monospace"; font.pixelSize: 11 }
            Text { text: "  Mode:    desktop (HDMI ulangan)";     color: Theme.gold;    font.family: "monospace"; font.pixelSize: 11 }
            Text { text: ""; font.pixelSize: 4 }
            Text { text: "❯  uname -m"; color: Theme.accentSoft; font.family: "monospace"; font.pixelSize: 11 }
            Text { text: "  aarch64";                              color: Theme.textHi;  font.family: "monospace"; font.pixelSize: 11 }
            Text { text: "❯  _";        color: Theme.accentSoft; font.family: "monospace"; font.pixelSize: 11 }
        }
    }

    // Bottom dock
    Rectangle {
        id: bottomDock
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.spaceSm
        height: 56
        width: dockRow.width + Theme.spaceLg
        radius: Theme.radLg
        color: Qt.rgba(0.04, 0.10, 0.08, 0.88)
        border.color: Theme.stroke
        border.width: 1

        Row {
            id: dockRow
            anchors.centerIn: parent
            spacing: Theme.spaceSm

            Repeater {
                model: [
                    { g: "📁", t1: "#E8B14F", t2: "#F4CB7A" },
                    { g: "🌐", t1: "#1FB6A5", t2: "#3FD9C8" },
                    { g: "✉",  t1: "#9B6BFF", t2: "#B894FF" },
                    { g: "💬", t1: "#3D8BFF", t2: "#6FACFF" },
                    { g: "📷", t1: "#3A4A45", t2: "#5A6A65" },
                    { g: "♫", t1: "#E5484D", t2: "#F47075" },
                    { g: "</>", t1: "#1FB6A5", t2: "#3FD9C8" },
                    { g: "⚙", t1: "#3A4A45", t2: "#5A6A65" }
                ]
                delegate: Rectangle {
                    width: 40; height: 40
                    radius: Theme.radSm
                    anchors.verticalCenter: parent.verticalCenter
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: modelData.t1 }
                        GradientStop { position: 1.0; color: modelData.t2 }
                    }
                    Text { anchors.centerIn: parent; text: modelData.g; font.pixelSize: 18 }
                }
            }
        }
    }
}
