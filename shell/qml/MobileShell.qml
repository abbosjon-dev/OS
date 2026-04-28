import QtQuick
import QtQuick.Layouts
import "components"
import "theme"

// iOS-style home screen with a half-sheet "Sozlamalar" surfaced at the
// bottom — showcases status bar, app grid, dock, list rows, switches, buttons
// and a segmented control inside one composition.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }

    StatusBar {
        id: statusBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        battery: 84
    }

    // Search field — iOS Spotlight style
    Card {
        id: search
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: statusBar.bottom
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        anchors.topMargin: 6
        height: 38
        radius: 12
        tint: Theme.materialThin

        Row {
            anchors.fill: parent
            anchors.leftMargin: 12
            spacing: 8

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "⌕"
                color: Theme.labelSecondary
                font.pixelSize: 17
                font.bold: true
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "Qidirish"
                color: Theme.labelSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 15
            }
        }
    }

    // Notification stack
    Column {
        id: notifs
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: search.bottom
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.topMargin: 12
        spacing: 8

        Notification {
            anchors.left: parent.left; anchors.right: parent.right
            app: "Telegram"
            time: "hozir"
            title: "Aziza"
            body: "Salom! Bugun uchrashuv soat 14:00 da. Tayyormisan?"
            iconGlyph: "T"
            iconColor: Theme.cyan
        }
        Notification {
            anchors.left: parent.left; anchors.right: parent.right
            app: "Pochta"
            time: "8 daq oldin"
            title: "ZaminOS jamoasi"
            body: "Yangi versiya 1.0 chiqdi — qurilmangizni yangilang."
            iconGlyph: "✉"
            iconColor: Theme.blue
        }
    }

    // App grid
    GridLayout {
        id: appGrid
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: notifs.bottom
        anchors.topMargin: 24
        anchors.leftMargin: 14
        anchors.rightMargin: 14
        columns: 4
        rowSpacing: 18
        columnSpacing: 0

        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Telefon";  glyph: "☏";  tint: "#34C759"; tint2: "#5AE07F"; iconSize: 60 }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Xabarlar"; glyph: "✉";  tint: "#34C759"; tint2: "#5AE07F"; iconSize: 60; dotted: true }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Pochta";   glyph: "✉";  tint: "#0A84FF"; tint2: "#5AC8FA"; iconSize: 60 }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "FaceTime"; glyph: "▶";  tint: "#30D158"; tint2: "#5AE07F"; iconSize: 60 }

        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Galereya"; glyph: "❀";  tint: "#FF375F"; tint2: "#FF6B8A"; iconSize: 60 }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Kamera";   glyph: "◉";  tint: "#3A3A3C"; tint2: "#636366"; iconSize: 60 }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Xarita";   glyph: "▲";  tint: "#0A84FF"; tint2: "#5AC8FA"; iconSize: 60 }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Soat";     glyph: "⌚"; tint: "#1C1C1E"; tint2: "#48484A"; iconSize: 60 }

        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Eslatma";  glyph: "✎";  tint: "#FF9F0A"; tint2: "#FFC04A"; iconSize: 60 }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Musiqa";   glyph: "♪";  tint: "#FF375F"; tint2: "#FF6B8A"; iconSize: 60 }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Brauzer";  glyph: "◐";  tint: "#0A84FF"; tint2: "#5AC8FA"; iconSize: 60 }
        AppIcon { Layout.alignment: Qt.AlignHCenter; label: "Sozlash";  glyph: "⚙";  tint: "#8E8E93"; tint2: "#AEAEB2"; iconSize: 60 }
    }

    // Half-height "Sozlamalar" sheet — demonstrates list rows + switches +
    // a segmented control + a primary button. iOS sheet aesthetic.
    Card {
        id: sheet
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 408
        radius: 28
        tint: Theme.materialThick

        // Grabber
        Rectangle {
            anchors.top: parent.top
            anchors.topMargin: 6
            anchors.horizontalCenter: parent.horizontalCenter
            width: 36; height: 5
            radius: 2.5
            color: Theme.labelTertiary
        }

        Column {
            anchors.fill: parent
            anchors.topMargin: 22
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            anchors.bottomMargin: 28
            spacing: 12

            Text {
                text: "Tezkor sozlamalar"
                color: Theme.label
                font.family: Theme.fontFamily
                font.pixelSize: 22
                font.weight: Font.Bold
            }

            Segmented {
                width: parent.width
                options: ["Umumiy", "Ekran", "Tovush"]
                current: 0
            }

            // Settings list
            Card {
                width: parent.width
                height: 56 * 4
                radius: 14
                tint: Theme.bgSecondary
                stroke: false

                Column {
                    anchors.fill: parent
                    ListRow { title: "Wi-Fi";        subtitle: "Uy tarmog'i"; iconGlyph: "≋"; iconColor: Theme.blue;   trailing: "switch"; checked: true }
                    ListRow { title: "Bluetooth";    iconGlyph: "✦";          iconColor: Theme.blue;   trailing: "switch"; checked: true }
                    ListRow { title: "Aviarejim";    iconGlyph: "✈";          iconColor: Theme.orange; trailing: "switch"; checked: false }
                    ListRow { title: "Tungi rejim";  iconGlyph: "☾";          iconColor: Theme.purple; trailing: "switch"; checked: true; divider: false }
                }
            }

            // Buttons row
            Row {
                spacing: 10
                width: parent.width
                Button { text: "Saqlash";       style: "filled"; full: true; width: (parent.width - 10) / 2 }
                Button { text: "Bekor qilish";  style: "tinted"; full: true; width: (parent.width - 10) / 2 }
            }
        }
    }

    // Home indicator
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
