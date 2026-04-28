import QtQuick
import "components"
import "theme"

// Settings → Wi-Fi sub-page
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
        height: 44

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4
            Icon { name: "caret-left"; weight: "bold"; color: Theme.blue; size: 18; anchors.verticalCenter: parent.verticalCenter }
            Text { text: "Sozlamalar"; color: Theme.blue; font.family: Theme.fontFamily; font.pixelSize: 17; anchors.verticalCenter: parent.verticalCenter; renderType: Text.NativeRendering }
        }
        Text {
            anchors.centerIn: parent
            text: "Wi-Fi"
            color: Theme.label
            font.family: Theme.fontFamily
            font.pixelSize: 17
            font.weight: Font.DemiBold
            renderType: Text.NativeRendering
        }
    }

    // Wi-Fi switch row
    Card {
        id: wifiToggle
        anchors.top: nav.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 24
        height: 56
        radius: 12
        tint: Theme.bgSecondary
        stroke: false

        ListRow { title: "Wi-Fi"; trailing: "switch"; checked: true; divider: false }
    }

    // Section label
    Text {
        id: sectionLabel
        anchors.top: wifiToggle.bottom
        anchors.left: parent.left
        anchors.leftMargin: 32
        anchors.topMargin: 20
        text: "TARMOQLARIM"
        color: Theme.labelSecondary
        font.family: Theme.fontFamily
        font.pixelSize: 12
        font.weight: Font.Medium
        font.letterSpacing: 0.4
        renderType: Text.NativeRendering
    }

    Card {
        id: myNetworks
        anchors.top: sectionLabel.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 6
        height: 56
        radius: 12
        tint: Theme.bgSecondary
        stroke: false

        // Custom row — uses checkmark + signal icon trailing
        Item {
            anchors.fill: parent
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.verticalCenter: parent.verticalCenter
                spacing: 16
                Icon { name: "check"; weight: "bold"; color: Theme.blue; size: 16; anchors.verticalCenter: parent.verticalCenter }
                Text { text: "Zamin-Uy"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 16; anchors.verticalCenter: parent.verticalCenter; renderType: Text.NativeRendering }
            }
            Row {
                anchors.right: parent.right
                anchors.rightMargin: 16
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8
                Icon { name: "lock-simple"; weight: "fill"; color: Theme.label; size: 14; anchors.verticalCenter: parent.verticalCenter }
                Icon { name: "wifi-high";   weight: "fill"; color: Theme.label; size: 16; anchors.verticalCenter: parent.verticalCenter }
                Icon { name: "caret-right";weight: "bold"; color: Theme.labelTertiary; size: 14; anchors.verticalCenter: parent.verticalCenter }
            }
        }
    }

    // Other networks
    Text {
        id: otherLabel
        anchors.top: myNetworks.bottom
        anchors.left: parent.left
        anchors.leftMargin: 32
        anchors.topMargin: 20
        text: "BOSHQA TARMOQLAR"
        color: Theme.labelSecondary
        font.family: Theme.fontFamily
        font.pixelSize: 12
        font.weight: Font.Medium
        font.letterSpacing: 0.4
        renderType: Text.NativeRendering
    }

    Card {
        anchors.top: otherLabel.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 18; anchors.rightMargin: 18
        anchors.topMargin: 6
        height: 56 * 5
        radius: 12
        tint: Theme.bgSecondary
        stroke: false

        Column {
            anchors.fill: parent
            Repeater {
                model: [
                    { name: "ZaminCafe-Free",  locked: false, signal: "wifi-high" },
                    { name: "Aziza-iPhone",    locked: true,  signal: "wifi-high" },
                    { name: "Mehmonlar",       locked: false, signal: "wifi-medium" },
                    { name: "Office-Ext",      locked: true,  signal: "wifi-medium" },
                    { name: "TV-Lobby",        locked: true,  signal: "wifi-x" }
                ]
                delegate: Item {
                    width: parent.width
                    height: 56

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 16
                        anchors.verticalCenter: parent.verticalCenter
                        text: modelData.name
                        color: Theme.label
                        font.family: Theme.fontFamily
                        font.pixelSize: 16
                        renderType: Text.NativeRendering
                    }

                    Row {
                        anchors.right: parent.right
                        anchors.rightMargin: 16
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 8
                        Icon { visible: modelData.locked; name: "lock-simple"; weight: "fill"; color: Theme.label; size: 14; anchors.verticalCenter: parent.verticalCenter }
                        Icon { name: modelData.signal; weight: "fill"; color: Theme.label; size: 16; anchors.verticalCenter: parent.verticalCenter }
                        Icon { name: "caret-right"; weight: "bold"; color: Theme.labelTertiary; size: 14; anchors.verticalCenter: parent.verticalCenter }
                    }

                    Rectangle {
                        visible: index < 4
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 16
                        height: 1
                        color: Theme.separatorOpaque
                        opacity: 0.45
                    }
                }
            }
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
