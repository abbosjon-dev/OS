import QtQuick
import "components"
import "theme"

// Desktop Spotlight search — central card with results.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.32) }

    Card {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 100
        width: 680
        height: searchRow.height + results.height + 28
        radius: 18
        tint: Qt.rgba(0.13, 0.13, 0.15, 0.95)
        stroke: true

        Row {
            id: searchRow
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 14
            spacing: 14
            height: 36

            Icon {
                name: "magnifying-glass"; weight: "bold"
                color: Theme.labelSecondary
                size: 22
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "esla"
                color: Theme.label
                font.family: Theme.fontDisplay
                font.pixelSize: 24
                font.weight: Font.Light
                renderType: Text.NativeRendering
            }
            Rectangle {
                width: 2; height: 26
                color: Theme.blue
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Rectangle {
            anchors.left: parent.left; anchors.right: parent.right
            anchors.top: searchRow.bottom
            anchors.topMargin: 14
            anchors.leftMargin: 16; anchors.rightMargin: 16
            height: 1; color: Theme.separator
        }

        Column {
            id: results
            anchors.top: searchRow.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 18
            anchors.leftMargin: 12
            anchors.rightMargin: 12
            spacing: 2

            Repeater {
                model: [
                    { i: "note-pencil",  t1: Theme.orange, t2: "#FFC04A", title: "Eslatma",        sub: "Ilova",                 kbd: "↵" },
                    { i: "note-pencil",  t1: Theme.orange, t2: "#FFC04A", title: "ZaminOS reja",   sub: "Eslatma — bugun",       kbd: "" },
                    { i: "compass",      t1: Theme.grey1,  t2: "#AEAEB2", title: "esla — Internet", sub: "Brauzerda qidirish",   kbd: "" },
                    { i: "calendar",     t1: Theme.purple, t2: "#D6A8FF", title: "eslatma yozish", sub: "Yordam — qo'llanma",    kbd: "" },
                    { i: "envelope",     t1: Theme.blue,   t2: "#5AC8FA", title: "esla.uz",        sub: "Pochta orqali yuborish", kbd: "" }
                ]
                delegate: Rectangle {
                    width: parent.width
                    height: 50
                    radius: 8
                    color: index === 0 ? Theme.blue : "transparent"
                    antialiasing: true

                    Row {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        spacing: 12

                        Rectangle {
                            width: 36; height: 36
                            anchors.verticalCenter: parent.verticalCenter
                            radius: width * Theme.squircle
                            antialiasing: true
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: modelData.t2 }
                                GradientStop { position: 1.0; color: modelData.t1 }
                            }
                            Icon { anchors.centerIn: parent; name: modelData.i; weight: "fill"; color: "white"; size: 18 }
                        }

                        Column {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 1
                            Text {
                                text: modelData.title
                                color: index === 0 ? "white" : Theme.label
                                font.family: Theme.fontFamily
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                renderType: Text.NativeRendering
                            }
                            Text {
                                text: modelData.sub
                                color: index === 0 ? Qt.rgba(1, 1, 1, 0.8) : Theme.labelSecondary
                                font.family: Theme.fontFamily
                                font.pixelSize: 12
                                renderType: Text.NativeRendering
                            }
                        }
                    }

                    Rectangle {
                        visible: modelData.kbd !== ""
                        anchors.right: parent.right
                        anchors.rightMargin: 12
                        anchors.verticalCenter: parent.verticalCenter
                        width: 26; height: 22
                        radius: 5
                        color: Qt.rgba(1, 1, 1, 0.18)
                        antialiasing: true
                        Text {
                            anchors.centerIn: parent
                            text: modelData.kbd
                            color: "white"
                            font.pixelSize: 14
                            font.bold: true
                        }
                    }
                }
            }
        }
    }
}
