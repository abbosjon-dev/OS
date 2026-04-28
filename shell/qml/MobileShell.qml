import QtQuick
import QtQuick.Layouts
import "components"
import "theme"

Item {
    id: root
    anchors.fill: parent

    Wallpaper {}

    StatusBar {
        id: statusBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    // Clock + greeting widget
    Column {
        anchors.top: statusBar.bottom
        anchors.topMargin: Theme.spaceLg
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 2

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Seshanba, 28 Aprel"
            color: Theme.textMid
            font.family: Theme.fontFamily
            font.pixelSize: 13
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "9:41"
            color: Theme.textHi
            font.family: Theme.fontFamily
            font.pixelSize: 64
            font.bold: true
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Assalomu alaykum"
            color: Theme.accentSoft
            font.family: Theme.fontFamily
            font.pixelSize: 14
        }
    }

    // Notification card
    Rectangle {
        id: notifCard
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: Theme.spaceMd
        anchors.rightMargin: Theme.spaceMd
        anchors.top: parent.top
        anchors.topMargin: 230
        height: 64
        radius: Theme.radMd
        color: Qt.rgba(0.09, 0.20, 0.17, 0.85)
        border.color: Theme.stroke
        border.width: 1

        Row {
            anchors.fill: parent
            anchors.margins: Theme.spaceSm
            spacing: Theme.spaceSm

            Rectangle {
                width: 40; height: 40
                radius: Theme.radSm
                anchors.verticalCenter: parent.verticalCenter
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.gold }
                    GradientStop { position: 1.0; color: Theme.earth }
                }
                Text { anchors.centerIn: parent; text: "T"; color: "#1A1108"; font.bold: true; font.pixelSize: 18 }
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 2
                Text {
                    text: "Telegram · hozir"
                    color: Theme.textMid
                    font.family: Theme.fontFamily
                    font.pixelSize: 10
                }
                Text {
                    text: "Aziza"
                    color: Theme.textHi
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.bold: true
                }
                Text {
                    text: "Salom! Bugun uchrashuv soat 14:00 da ✨"
                    color: Theme.textMid
                    font.family: Theme.fontFamily
                    font.pixelSize: 11
                    elide: Text.ElideRight
                    width: notifCard.width - 80
                }
            }
        }
    }

    // App grid
    GridLayout {
        id: appGrid
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: dock.top
        anchors.bottomMargin: Theme.spaceLg
        anchors.leftMargin: Theme.spaceLg
        anchors.rightMargin: Theme.spaceLg
        columns: 4
        rowSpacing: Theme.spaceMd
        columnSpacing: 0

        AppIcon { label: "Telefon";   glyph: "📞"; tint: "#1FB6A5"; tint2: "#3FD9C8"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Xabarlar";  glyph: "💬"; tint: "#3D8BFF"; tint2: "#6FACFF"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Pochta";    glyph: "✉";  tint: "#9B6BFF"; tint2: "#B894FF"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Kamera";    glyph: "📷"; tint: "#3A4A45"; tint2: "#5A6A65"; Layout.alignment: Qt.AlignHCenter }

        AppIcon { label: "Galereya";  glyph: "🖼"; tint: "#E8B14F"; tint2: "#F4CB7A"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Musiqa";    glyph: "♫"; tint: "#E5484D"; tint2: "#F47075"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Xarita";    glyph: "🗺"; tint: "#30A46C"; tint2: "#4FC48C"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Soat";      glyph: "⏰"; tint: "#0F2520"; tint2: "#1F4438"; Layout.alignment: Qt.AlignHCenter }

        AppIcon { label: "Eslatma";   glyph: "📝"; tint: "#C28B5A"; tint2: "#D9A87A"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Brauzer";   glyph: "🌐"; tint: "#1FB6A5"; tint2: "#3FD9C8"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Fayllar";   glyph: "📁"; tint: "#E8B14F"; tint2: "#F4CB7A"; Layout.alignment: Qt.AlignHCenter }
        AppIcon { label: "Sozlash";   glyph: "⚙"; tint: "#3A4A45"; tint2: "#5A6A65"; Layout.alignment: Qt.AlignHCenter }
    }

    // Dock
    Rectangle {
        id: dock
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: Theme.spaceMd
        anchors.rightMargin: Theme.spaceMd
        anchors.bottomMargin: Theme.spaceMd
        height: 78
        radius: Theme.radLg
        color: Qt.rgba(0.06, 0.15, 0.12, 0.75)
        border.color: Qt.rgba(1, 1, 1, 0.05)
        border.width: 1

        Row {
            anchors.centerIn: parent
            spacing: Theme.spaceMd

            AppIcon { label: ""; showLabel: false; glyph: "📞"; tint: "#1FB6A5"; tint2: "#3FD9C8" }
            AppIcon { label: ""; showLabel: false; glyph: "💬"; tint: "#3D8BFF"; tint2: "#6FACFF" }
            AppIcon { label: ""; showLabel: false; glyph: "🌐"; tint: "#1FB6A5"; tint2: "#3FD9C8" }
            AppIcon { label: ""; showLabel: false; glyph: "📷"; tint: "#3A4A45"; tint2: "#5A6A65" }
        }
    }

    // Home indicator
    Rectangle {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
        width: 100; height: 4
        radius: 2
        color: Qt.rgba(1, 1, 1, 0.6)
    }
}
