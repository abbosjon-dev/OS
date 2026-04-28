import QtQuick
import "components"
import "theme"

// Pulled-down notification center.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.42) }

    StatusBar {
        id: statusBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    // Big date + time
    Column {
        anchors.top: statusBar.bottom
        anchors.topMargin: 24
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 0

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Seshanba, 28-aprel"
            color: Theme.label
            font.family: Theme.fontFamily
            font.pixelSize: 16
            renderType: Text.NativeRendering
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "9:41"
            color: Theme.label
            font.family: Theme.fontDisplay
            font.pixelSize: 78
            font.weight: Font.Bold
            renderType: Text.NativeRendering
        }
    }

    // Section label
    Row {
        id: sectionRow
        anchors.top: parent.top
        anchors.topMargin: 240
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.right: parent.right
        anchors.rightMargin: 22
        spacing: 6

        Text {
            text: "Bildirishnomalar"
            color: Theme.label
            font.family: Theme.fontFamily
            font.pixelSize: 22
            font.weight: Font.Bold
            renderType: Text.NativeRendering
        }
        Item { height: 1; width: parent.width - 200 }
        Rectangle {
            width: 28; height: 28
            radius: 14
            color: Qt.rgba(1, 1, 1, 0.18)
            antialiasing: true
            anchors.verticalCenter: parent.verticalCenter
            Icon { anchors.centerIn: parent; name: "x"; weight: "bold"; color: Theme.label; size: 14 }
        }
    }

    // Notification stack
    Column {
        anchors.top: sectionRow.bottom
        anchors.topMargin: 14
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 10

        Notification {
            anchors.left: parent.left; anchors.right: parent.right
            app: "Telegram"; time: "hozir"
            title: "Aziza"
            body: "Salom! Bugun uchrashuv soat 14:00 da. Tayyormisan?"
            iconGlyph: "T"; iconColor: Theme.cyan
        }
        Notification {
            anchors.left: parent.left; anchors.right: parent.right
            app: "Pochta"; time: "8 daq oldin"
            title: "ZaminOS jamoasi"
            body: "Yangi versiya 1.0 chiqdi — qurilmangizni yangilang."
            iconGlyph: "✉"; iconColor: Theme.blue
        }
        Notification {
            anchors.left: parent.left; anchors.right: parent.right
            app: "Taqvim"; time: "13 daq oldin"
            title: "Eslatma — Stomatolog"
            body: "Bugun 16:30 — toza tish kabineti"
            iconGlyph: "📅"; iconColor: Theme.red
        }
    }

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
