import QtQuick
import QtQuick.Layouts
import "components"
import "theme"

// Clean iOS home screen — status bar, search, two notifications, full app
// grid (16 apps), dock. No overlay sheet — separate screens demo controls.
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

    // ─── Top date / weather widget ───────────────────────────────────
    Item {
        id: topWidget
        anchors.top: statusBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 6
        height: 70

        Column {
            anchors.left: parent.left
            anchors.leftMargin: 24
            anchors.verticalCenter: parent.verticalCenter
            spacing: 0
            Text {
                text: "SESHANBA, 28-APREL"
                color: Theme.labelSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 11
                font.weight: Font.Bold
                font.letterSpacing: 0.6
                renderType: Text.NativeRendering
            }
            Text {
                text: "9:41"
                color: Theme.label
                font.family: Theme.fontDisplay
                font.pixelSize: 44
                font.weight: Font.Bold
                renderType: Text.NativeRendering
            }
        }

        Row {
            anchors.right: parent.right
            anchors.rightMargin: 24
            anchors.verticalCenter: parent.verticalCenter
            spacing: 8
            Icon { name: "sun"; weight: "fill"; color: Theme.yellow; size: 28; anchors.verticalCenter: parent.verticalCenter }
            Column {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 0
                Text {
                    text: "23°"
                    color: Theme.label
                    font.family: Theme.fontDisplay
                    font.pixelSize: 22
                    font.weight: Font.DemiBold
                    renderType: Text.NativeRendering
                }
                Text {
                    text: "Toshkent"
                    color: Theme.labelSecondary
                    font.family: Theme.fontFamily
                    font.pixelSize: 11
                    renderType: Text.NativeRendering
                }
            }
        }
    }

    // ─── App grid (4×4) ──────────────────────────────────────────────
    Grid {
        id: appGrid
        anchors.top: topWidget.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 14
        anchors.leftMargin: 18
        anchors.rightMargin: 18
        columns: 4
        rowSpacing: 14
        columnSpacing: 0
        property real cellW: (width) / 4

        Repeater {
            model: [
                { id: "phone",     label: "Telefon",   iconName: "phone",          tint: "#34C759", tint2: "#5AE07F" },
                { id: "messages",  label: "Xabarlar",  iconName: "chats",          tint: "#34C759", tint2: "#5AE07F", dotted: true },
                { id: "mail",      label: "Pochta",    iconName: "envelope",       tint: "#0A84FF", tint2: "#5AC8FA" },
                { id: "facetime",  label: "FaceTime",  iconName: "video-camera",   tint: "#30D158", tint2: "#5AE07F" },
                { id: "photos",    label: "Galereya",  iconName: "image",          tint: "#FF375F", tint2: "#FF6B8A" },
                { id: "camera",    label: "Kamera",    iconName: "camera",         tint: "#3A3A3C", tint2: "#636366" },
                { id: "maps",      label: "Xarita",    iconName: "map-trifold",    tint: "#0A84FF", tint2: "#5AC8FA" },
                { id: "clock",     label: "Soat",      iconName: "alarm",          tint: "#1C1C1E", tint2: "#48484A" },
                { id: "calendar",  label: "Taqvim",    iconName: "calendar",       tint: "#FF453A", tint2: "#FF6B6B" },
                { id: "weather",   label: "Ob-havo",   iconName: "sun",            tint: "#0A84FF", tint2: "#5AC8FA" },
                { id: "notes",     label: "Eslatma",   iconName: "note-pencil",    tint: "#FF9F0A", tint2: "#FFC04A" },
                { id: "calc",      label: "Hisoblash", iconName: "calculator",     tint: "#FF9F0A", tint2: "#FFC04A" },
                { id: "music",     label: "Musiqa",    iconName: "music-note",     tint: "#FF375F", tint2: "#FF6B8A" },
                { id: "browser",   label: "Brauzer",   iconName: "compass",        tint: "#0A84FF", tint2: "#5AC8FA" },
                { id: "files",     label: "Fayllar",   iconName: "folder",         tint: "#0A84FF", tint2: "#5AC8FA" },
                { id: "settings",  label: "Sozlash",   iconName: "gear",           tint: "#8E8E93", tint2: "#AEAEB2" }
            ]
            delegate: Item {
                width: appGrid.cellW; height: 86
                AppIcon {
                    anchors.horizontalCenter: parent.horizontalCenter
                    iconName:    modelData.iconName
                    iconWeight:  "fill"
                    tint:        modelData.tint
                    tint2:       modelData.tint2
                    label:       modelData.label
                    iconSize:    60
                    dotted:      modelData.dotted === true
                }
            }
        }
    }

    // ─── Dock ────────────────────────────────────────────────────────
    Card {
        id: dock
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.bottomMargin: 22
        height: 88
        radius: 28
        tint: Theme.materialThick

        Row {
            anchors.centerIn: parent
            spacing: 18

            Repeater {
                model: [
                    { iconName: "phone",       tint: "#34C759", tint2: "#5AE07F" },
                    { iconName: "chats",       tint: "#34C759", tint2: "#5AE07F" },
                    { iconName: "compass",     tint: "#0A84FF", tint2: "#5AC8FA" },
                    { iconName: "music-note",  tint: "#FF375F", tint2: "#FF6B8A" }
                ]
                delegate: AppIcon {
                    iconName: modelData.iconName
                    iconWeight: "fill"
                    tint: modelData.tint
                    tint2: modelData.tint2
                    showLabel: false
                    iconSize: 60
                }
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
