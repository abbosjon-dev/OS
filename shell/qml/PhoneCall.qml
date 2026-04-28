import QtQuick
import "components"
import "theme"

// Active phone call screen.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.30) }

    StatusBar { id: statusBar; anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right }

    // Caller info
    Column {
        anchors.top: statusBar.bottom
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 18

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 120; height: 120
            radius: 60
            gradient: Gradient {
                GradientStop { position: 0.0; color: Theme.orange }
                GradientStop { position: 1.0; color: Theme.pink }
            }
            Text { anchors.centerIn: parent; text: "A"; color: "white"; font.bold: true; font.pixelSize: 60 }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Aziza Karimova"
            color: Theme.label
            font.family: Theme.fontDisplay
            font.pixelSize: 32
            font.weight: Font.DemiBold
            renderType: Text.NativeRendering
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "+998 90 123 45 67  ·  uy"
            color: Theme.labelSecondary
            font.family: Theme.fontFamily
            font.pixelSize: 16
            renderType: Text.NativeRendering
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "0:42"
            color: Theme.green
            font.family: Theme.fontDisplay
            font.pixelSize: 18
            font.weight: Font.Medium
            renderType: Text.NativeRendering
        }
    }

    // Action grid
    Grid {
        id: actions
        anchors.bottom: endBtn.top
        anchors.bottomMargin: 32
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 3
        rowSpacing: 18
        columnSpacing: 60

        Repeater {
            model: [
                { i: "microphone",   l: "Ovozsiz",  on: false },
                { i: "squares-four", l: "Klaviatura", on: false },
                { i: "speaker-high", l: "Karnay",   on: false },
                { i: "plus",         l: "Qo'shish", on: false },
                { i: "video-camera", l: "FaceTime", on: false },
                { i: "user",         l: "Kontakt",  on: false }
            ]
            delegate: Column {
                spacing: 8
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 70; height: 70; radius: 35
                    color: modelData.on ? "white" : Qt.rgba(1, 1, 1, 0.18)
                    antialiasing: true
                    Icon {
                        anchors.centerIn: parent
                        name: modelData.i; weight: "fill"
                        color: modelData.on ? Theme.bgSystem : Theme.label
                        size: 28
                    }
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: modelData.l
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    renderType: Text.NativeRendering
                }
            }
        }
    }

    // End call button
    Rectangle {
        id: endBtn
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        width: 70; height: 70
        radius: 35
        color: Theme.red
        antialiasing: true
        Icon {
            anchors.centerIn: parent
            name: "phone"; weight: "fill"
            color: "white"; size: 30
            rotation: 135
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
