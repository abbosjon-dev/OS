import QtQuick
import "components"
import "theme"

// Mobile keyboard view — Messages app composing a reply.
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

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4
            Icon { name: "caret-left"; weight: "bold"; color: Theme.blue; size: 18; anchors.verticalCenter: parent.verticalCenter }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: 32; height: 32; radius: 16
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Theme.orange }
                    GradientStop { position: 1.0; color: Theme.pink }
                }
                Text { anchors.centerIn: parent; text: "A"; color: "white"; font.bold: true; font.pixelSize: 15 }
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "Aziza"
                color: Theme.label
                font.family: Theme.fontFamily
                font.pixelSize: 17
                font.weight: Font.DemiBold
                renderType: Text.NativeRendering
            }
        }

        Icon {
            anchors.right: parent.right
            anchors.rightMargin: 18
            anchors.verticalCenter: parent.verticalCenter
            name: "video-camera"; weight: "fill"
            color: Theme.blue; size: 22
        }

        Rectangle {
            anchors.left: parent.left; anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 1; color: Theme.separator
        }
    }

    // Messages
    Column {
        anchors.top: nav.bottom
        anchors.left: parent.left; anchors.right: parent.right
        anchors.bottom: composer.top
        anchors.topMargin: 14
        anchors.bottomMargin: 14
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 10

        // Incoming
        Row {
            spacing: 8
            Rectangle {
                width: parent.parent.width * 0.75
                height: msg1.implicitHeight + 18
                radius: 18
                color: Theme.bgTertiary || "#2C2C2E"
                Text {
                    id: msg1
                    anchors.left: parent.left; anchors.leftMargin: 14
                    anchors.right: parent.right; anchors.rightMargin: 14
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Salom! Bugun uchrashuv soat 14:00 da. Tayyormisan?"
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 16
                    wrapMode: Text.WordWrap
                    renderType: Text.NativeRendering
                }
            }
        }

        // Outgoing (right-aligned)
        Item {
            width: parent.width
            height: out1.height
            Rectangle {
                id: out1
                anchors.right: parent.right
                width: Math.min(parent.width * 0.75, msgOut.implicitWidth + 28)
                height: msgOut.implicitHeight + 18
                radius: 18
                color: Theme.blue
                Text {
                    id: msgOut
                    anchors.fill: parent
                    anchors.margins: 14
                    text: "Albatta! 5 daqiqada borib qolaman ✨"
                    color: "white"
                    font.family: Theme.fontFamily
                    font.pixelSize: 16
                    wrapMode: Text.WordWrap
                    renderType: Text.NativeRendering
                }
            }
        }

        // Typing indicator
        Row {
            spacing: 8
            Rectangle {
                width: 60; height: 32
                radius: 16
                color: Theme.bgTertiary || "#2C2C2E"
                Row {
                    anchors.centerIn: parent
                    spacing: 4
                    Repeater {
                        model: 3
                        delegate: Rectangle { width: 6; height: 6; radius: 3; color: Theme.labelSecondary; opacity: 0.4 + index * 0.2 }
                    }
                }
            }
        }
    }

    // Composer
    Item {
        id: composer
        anchors.bottom: keyboard.top
        anchors.left: parent.left; anchors.right: parent.right
        height: 50

        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            width: 32; height: 32; radius: 16
            color: Theme.bgTertiary || "#2C2C2E"
            Icon { anchors.centerIn: parent; name: "plus"; weight: "bold"; color: Theme.label; size: 16 }
        }

        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            height: 36
            radius: 18
            color: "transparent"
            border.color: Theme.separator
            border.width: 1

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 14
                anchors.verticalCenter: parent.verticalCenter
                text: "Yozish | "
                color: Theme.labelSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 16
                renderType: Text.NativeRendering
            }
            Icon {
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                name: "microphone"; weight: "fill"
                color: Theme.label; size: 18
            }
        }
    }

    // Keyboard
    Rectangle {
        id: keyboard
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 22
        anchors.left: parent.left; anchors.right: parent.right
        height: 296
        color: Theme.bgSecondary

        Column {
            anchors.fill: parent
            anchors.margins: 4
            spacing: 8

            // Helper to draw a keyboard row
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 6
                Repeater {
                    model: ["q","w","e","r","t","y","u","i","o","p"]
                    delegate: Rectangle {
                        width: 33; height: 42; radius: 5
                        color: Theme.grey4
                        Text { anchors.centerIn: parent; text: modelData; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 21; font.weight: Font.Medium; renderType: Text.NativeRendering }
                    }
                }
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 6
                Repeater {
                    model: ["a","s","d","f","g","h","j","k","l"]
                    delegate: Rectangle {
                        width: 33; height: 42; radius: 5
                        color: Theme.grey4
                        Text { anchors.centerIn: parent; text: modelData; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 21; font.weight: Font.Medium; renderType: Text.NativeRendering }
                    }
                }
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 6
                Rectangle { width: 42; height: 42; radius: 5; color: Theme.grey3
                    Icon { anchors.centerIn: parent; name: "arrow-up" === "" ? "" : "caret-up"; weight: "bold"; color: Theme.label; size: 16 }
                }
                Repeater {
                    model: ["z","x","c","v","b","n","m"]
                    delegate: Rectangle {
                        width: 33; height: 42; radius: 5
                        color: Theme.grey4
                        Text { anchors.centerIn: parent; text: modelData; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 21; font.weight: Font.Medium; renderType: Text.NativeRendering }
                    }
                }
                Rectangle { width: 42; height: 42; radius: 5; color: Theme.grey3
                    Icon { anchors.centerIn: parent; name: "x"; weight: "bold"; color: Theme.label; size: 16 }
                }
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 6
                Rectangle { width: 50; height: 42; radius: 5; color: Theme.grey3
                    Text { anchors.centerIn: parent; text: "123"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 14; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
                }
                Rectangle { width: 42; height: 42; radius: 5; color: Theme.grey3
                    Text { anchors.centerIn: parent; text: "🌐"; font.pixelSize: 16 }
                }
                Rectangle { width: 168; height: 42; radius: 5; color: Theme.grey4
                    Text { anchors.centerIn: parent; text: "bo'sh joy"; color: Theme.labelSecondary; font.family: Theme.fontFamily; font.pixelSize: 14; renderType: Text.NativeRendering }
                }
                Rectangle { width: 86; height: 42; radius: 5; color: Theme.blue
                    Text { anchors.centerIn: parent; text: "Yuborish"; color: "white"; font.family: Theme.fontFamily; font.pixelSize: 14; font.weight: Font.DemiBold; renderType: Text.NativeRendering }
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
