import QtQuick
import "components"
import "theme"

// Notes app — list of notes on the left (mobile-optimised: list view only).
Item {
    id: root
    anchors.fill: parent

    Rectangle { anchors.fill: parent; color: Theme.bgSystem }

    StatusBar { id: statusBar; anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right }

    // Nav bar
    Item {
        id: nav
        anchors.top: statusBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 56

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 18
            anchors.verticalCenter: parent.verticalCenter
            text: "‹ Papkalar"
            color: Theme.orange
            font.family: Theme.fontFamily
            font.pixelSize: 17
            renderType: Text.NativeRendering
        }
        Icon {
            anchors.right: parent.right
            anchors.rightMargin: 18
            anchors.verticalCenter: parent.verticalCenter
            name: "dots-three"; weight: "bold"; color: Theme.orange; size: 22
        }
    }

    // Title
    Text {
        id: title
        anchors.top: nav.bottom
        anchors.left: parent.left
        anchors.leftMargin: 18
        text: "Eslatmalar"
        color: Theme.label
        font.family: Theme.fontDisplay
        font.pixelSize: 32
        font.weight: Font.Bold
        renderType: Text.NativeRendering
    }

    Text {
        id: count
        anchors.top: title.bottom
        anchors.left: title.left
        text: "12 ta yozuv"
        color: Theme.labelSecondary
        font.family: Theme.fontFamily
        font.pixelSize: 13
        renderType: Text.NativeRendering
    }

    // Search
    Card {
        id: search
        anchors.top: count.bottom
        anchors.left: parent.left; anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 12
        height: 36
        radius: 10
        tint: Theme.fillPrim

        Row {
            anchors.fill: parent
            anchors.leftMargin: 8
            spacing: 6
            Icon { anchors.verticalCenter: parent.verticalCenter; name: "magnifying-glass"; weight: "bold"; color: Theme.labelSecondary; size: 16 }
            Text { anchors.verticalCenter: parent.verticalCenter; text: "Qidirish"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 14; renderType: Text.NativeRendering }
        }
    }

    // Pinned section
    Text {
        id: pinnedLbl
        anchors.top: search.bottom
        anchors.left: parent.left
        anchors.leftMargin: 18
        anchors.topMargin: 16
        text: "Mahkamlangan"
        color: Theme.label
        font.family: Theme.fontFamily
        font.pixelSize: 14
        font.weight: Font.DemiBold
        renderType: Text.NativeRendering
    }

    Card {
        id: pinned
        anchors.top: pinnedLbl.bottom
        anchors.left: parent.left; anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 8
        height: 88
        radius: 12
        tint: Theme.bgSecondary
        stroke: false

        Column {
            anchors.fill: parent
            anchors.margins: 14
            spacing: 4
            Text { text: "ZaminOS reja — 1.0 versiya"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 16; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
            Text { text: "9:41 · Konvergent qobiq, iOS uslubi, ikonalar tayyor."; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 13; renderType: Text.NativeRendering; elide: Text.ElideRight; width: parent.width }
        }
    }

    // All notes
    Text {
        id: allLbl
        anchors.top: pinned.bottom
        anchors.left: parent.left
        anchors.leftMargin: 18
        anchors.topMargin: 18
        text: "Bugun"
        color: Theme.label
        font.family: Theme.fontFamily
        font.pixelSize: 14
        font.weight: Font.DemiBold
        renderType: Text.NativeRendering
    }

    Card {
        anchors.top: allLbl.bottom
        anchors.left: parent.left; anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 8
        anchors.bottom: bottomBar.top
        anchors.bottomMargin: 10
        radius: 12
        tint: Theme.bgSecondary
        stroke: false

        Column {
            anchors.fill: parent
            Repeater {
                model: [
                    { t: "Bozorga ro'yxat",     s: "9:21 · Non, sut, olma, suvli mevalar" },
                    { t: "Ish loyihasi",        s: "9:08 · Wed-meet bilan, demo 14:00" },
                    { t: "Kitob iqtiboslari",   s: "8:42 · 'Yo'lda yashash kerak emas, …'" },
                    { t: "Sayohat g'oyalari",   s: "8:17 · Samarqand → Buxoro → Xiva" },
                    { t: "ZaminOS so'zlari",    s: "Kecha · Sozlash, Eslatma, Konvergensiya" }
                ]
                delegate: Item {
                    width: parent.width; height: 64
                    Column {
                        anchors.fill: parent
                        anchors.margins: 14
                        spacing: 2
                        Text { text: modelData.t; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 16; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
                        Text { text: modelData.s; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 13; elide: Text.ElideRight; width: parent.width; renderType: Text.NativeRendering }
                    }
                    Rectangle {
                        visible: index < 4
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left; anchors.right: parent.right
                        anchors.leftMargin: 14
                        height: 1; color: Theme.separatorOpaque; opacity: 0.45
                    }
                }
            }
        }
    }

    // Bottom bar
    Item {
        id: bottomBar
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: 22
        height: 50

        Text {
            anchors.centerIn: parent
            text: "12 ta yozuv"
            color: Theme.labelSecondary
            font.family: Theme.fontFamily
            font.pixelSize: 12
            renderType: Text.NativeRendering
        }
        Icon {
            anchors.right: parent.right
            anchors.rightMargin: 22
            anchors.verticalCenter: parent.verticalCenter
            name: "note-pencil"; weight: "fill"
            color: Theme.orange; size: 26
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
