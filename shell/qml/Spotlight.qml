import QtQuick
import QtQuick.Layouts
import "components"
import "theme"

// Desktop Spotlight search — central card with results below.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.32) }

    Card {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 80
        width: 680
        height: searchRow.height + results.height + 28
        radius: 18
        tint: Qt.rgba(0.13, 0.13, 0.15, 0.95)
        stroke: true

        // Search row
        Row {
            id: searchRow
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 14
            spacing: 14
            height: 36

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "⌕"
                color: Theme.labelSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 22
                font.bold: true
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "esla"
                color: Theme.label
                font.family: Theme.fontFamily
                font.pixelSize: 22
                font.weight: Font.Light
            }
            Rectangle { // cursor
                width: 2; height: 24
                color: Theme.blue
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        // Hairline
        Rectangle {
            anchors.left: parent.left; anchors.right: parent.right
            anchors.top: searchRow.bottom
            anchors.topMargin: 14
            anchors.leftMargin: 16; anchors.rightMargin: 16
            height: 1
            color: Theme.separator
        }

        // Results
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
                    { g: "✎", t1: Theme.orange, t2: "#FFC04A", title: "Eslatma",        sub: "Ilova",                kbd: "↵" },
                    { g: "📝", t1: Theme.orange, t2: "#FFC04A", title: "ZaminOS reja",   sub: "Eslatma — bugun",      kbd: "" },
                    { g: "🔎", t1: Theme.grey1,  t2: "#AEAEB2", title: "esla — Internet", sub: "Brauzerda qidirish",  kbd: "" },
                    { g: "📚", t1: Theme.purple, t2: "#D6A8FF", title: "eslatma yozish", sub: "Yordam — qo'llanma",   kbd: "" },
                    { g: "✉",  t1: Theme.blue,   t2: "#5AC8FA", title: "esla.uz",        sub: "Pochta orqali yuborish", kbd: "" }
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
                            Text {
                                anchors.centerIn: parent
                                text: modelData.g
                                color: "white"
                                font.family: Theme.fontFamily
                                font.pixelSize: 18
                                font.bold: true
                            }
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
                            }
                            Text {
                                text: modelData.sub
                                color: index === 0 ? Qt.rgba(1, 1, 1, 0.8) : Theme.labelSecondary
                                font.family: Theme.fontFamily
                                font.pixelSize: 12
                            }
                        }
                    }

                    // Trailing kbd hint
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
