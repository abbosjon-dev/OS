import QtQuick
import "components"
import "theme"

// Lock screen — big clock, date, notification stack, flashlight + camera quick
// actions, swipe-up indicator.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }

    StatusBar {
        id: statusBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    // Lock chip + date + clock
    Column {
        anchors.top: statusBar.bottom
        anchors.topMargin: 16
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 4

        Icon {
            anchors.horizontalCenter: parent.horizontalCenter
            name: "lock-simple"
            weight: "fill"
            color: Theme.label
            size: 22
        }
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
            font.pixelSize: 92
            font.weight: Font.Bold
            renderType: Text.NativeRendering
        }
    }

    // Live notification card — Music
    Card {
        id: musicCard
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 14
        anchors.rightMargin: 14
        anchors.top: parent.top
        anchors.topMargin: 290
        height: 80
        radius: 22
        tint: Theme.materialThick

        Row {
            anchors.fill: parent
            anchors.leftMargin: 14
            anchors.rightMargin: 14
            spacing: 14

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: 52; height: 52
                radius: width * Theme.squircle
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.pink }
                    GradientStop { position: 1.0; color: "#FF6B8A" }
                }
                Icon { anchors.centerIn: parent; name: "music-note"; weight: "fill"; color: "white"; size: 24 }
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 2
                Text { text: "Munisa - Yo'lda";  color: Theme.label;          font.family: Theme.fontFamily; font.pixelSize: 15; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
                Text { text: "Yangiroq albomi";  color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 13; renderType: Text.NativeRendering }
            }

            Item { width: 1; height: 1 } // spacer

            Icon {
                anchors.verticalCenter: parent.verticalCenter
                name: "play"
                weight: "fill"
                color: Theme.label
                size: 22
            }
        }
    }

    // Notifications
    Card {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 14
        anchors.rightMargin: 14
        anchors.bottom: actions.top
        anchors.bottomMargin: 18
        height: 78
        radius: 22
        tint: Theme.materialThick

        Row {
            anchors.fill: parent
            anchors.margins: 14
            spacing: 14

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: 38; height: 38
                radius: width * Theme.squircle
                color: Theme.cyan
                Text { anchors.centerIn: parent; text: "T"; color: "white"; font.bold: true; font.pixelSize: 19 }
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 1
                Text { text: "Telegram · Aziza · 2 daq";   color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 12; renderType: Text.NativeRendering }
                Text { text: "Salom! Bugun uchrashuv soat 14:00 da."; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 14; renderType: Text.NativeRendering }
            }
        }
    }

    // Flashlight + Camera quick actions
    Row {
        id: actions
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 38
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 36
        anchors.rightMargin: 36
        spacing: 0

        Rectangle {
            width: 50; height: 50; radius: 25
            color: Qt.rgba(1, 1, 1, 0.18)
            antialiasing: true
            Icon { anchors.centerIn: parent; name: "flashlight"; weight: "fill"; color: Theme.label; size: 22 }
        }
        Item { height: 1; width: parent.width - 100 }
        Rectangle {
            width: 50; height: 50; radius: 25
            color: Qt.rgba(1, 1, 1, 0.18)
            antialiasing: true
            Icon { anchors.centerIn: parent; name: "camera"; weight: "fill"; color: Theme.label; size: 22 }
        }
    }

    // Swipe-up text + home indicator
    Text {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 18
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Ochish uchun yuqoriga torting"
        color: Theme.labelSecondary
        font.family: Theme.fontFamily
        font.pixelSize: 12
        renderType: Text.NativeRendering
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
