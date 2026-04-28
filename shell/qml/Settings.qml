import QtQuick
import "components"
import "theme"

// Mobile Settings — main page, iOS-style grouped list.
Item {
    id: root
    anchors.fill: parent

    Rectangle { anchors.fill: parent; color: Theme.bgSystem }

    StatusBar { id: statusBar; anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right }

    // Header
    Item {
        id: header
        anchors.top: statusBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 54
        Text {
            anchors.left: parent.left
            anchors.leftMargin: 18
            anchors.verticalCenter: parent.verticalCenter
            text: "Sozlamalar"
            color: Theme.label
            font.family: Theme.fontDisplay
            font.pixelSize: 32
            font.weight: Font.Bold
            renderType: Text.NativeRendering
        }
    }

    // Search
    Card {
        id: search
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        height: 36
        radius: 10
        tint: Theme.bgTertiary || Theme.fillPrim

        Row {
            anchors.fill: parent
            anchors.leftMargin: 8
            spacing: 6
            Icon { anchors.verticalCenter: parent.verticalCenter; name: "magnifying-glass"; weight: "bold"; color: Theme.labelSecondary; size: 16 }
            Text { anchors.verticalCenter: parent.verticalCenter; text: "Qidirish"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 14; renderType: Text.NativeRendering }
        }
    }

    // User card
    Card {
        id: userCard
        anchors.top: search.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 14
        height: 70
        radius: 12
        tint: Theme.bgSecondary
        stroke: false

        Row {
            anchors.fill: parent
            anchors.leftMargin: 14
            anchors.rightMargin: 14
            spacing: 12

            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: 50; height: 50
                radius: 25
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.orange }
                    GradientStop { position: 1.0; color: Theme.pink }
                }
                Text { anchors.centerIn: parent; text: "A"; color: "white"; font.bold: true; font.pixelSize: 24 }
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 1
                Text { text: "Abbosjon Karimov"; color: Theme.label;          font.family: Theme.fontFamily; font.pixelSize: 17; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
                Text { text: "ZaminID, iCloud, …"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 13; renderType: Text.NativeRendering }
            }

            Item { width: parent.width - 240; height: 1 }

            Icon {
                anchors.verticalCenter: parent.verticalCenter
                name: "caret-right"; weight: "bold"
                color: Theme.labelTertiary; size: 14
            }
        }
    }

    // Connectivity group
    Card {
        id: g1
        anchors.top: userCard.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 16
        height: 56 * 4
        radius: 12
        tint: Theme.bgSecondary
        stroke: false

        Column {
            anchors.fill: parent
            ListRow { iconName: "airplane";  iconColor: Theme.orange; title: "Aviarejim";    trailing: "switch"; checked: false }
            ListRow { iconName: "wifi-high"; iconColor: Theme.blue;   title: "Wi-Fi";        value: "Uy tarmog'i"; trailing: "value" }
            ListRow { iconName: "bluetooth"; iconColor: Theme.blue;   title: "Bluetooth";    value: "Yoqilgan";    trailing: "value" }
            ListRow { iconName: "signal-high"; iconColor: Theme.green; title: "Mobil aloqa"; divider: false }
        }
    }

    // System group
    Card {
        anchors.top: g1.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 16
        height: 56 * 4
        radius: 12
        tint: Theme.bgSecondary
        stroke: false

        Column {
            anchors.fill: parent
            ListRow { iconName: "bell-simple";    iconColor: Theme.red;    title: "Bildirishnomalar" }
            ListRow { iconName: "speaker-high";   iconColor: Theme.pink;   title: "Tovush va titrash" }
            ListRow { iconName: "moon";           iconColor: Theme.indigo; title: "Bezovta qilmang"; trailing: "switch"; checked: true }
            ListRow { iconName: "clock-counter-clockwise"; iconColor: Theme.purple; title: "Ekran vaqti"; divider: false }
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
