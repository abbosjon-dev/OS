import QtQuick
import QtQuick.Layouts
import "../theme"

// Notification card (translucent material with rounded corners).
Item {
    id: root
    property string app: "Telegram"
    property string time: "hozir"
    property string title: ""
    property string body: ""
    property string iconGlyph: "T"
    property color iconColor: Theme.blue

    height: column.implicitHeight + 26

    Rectangle {
        anchors.fill: parent
        radius: 22
        color: Theme.materialThick
        antialiasing: true
    }
    Rectangle {
        anchors.fill: parent
        radius: 22
        color: "transparent"
        border.color: Qt.rgba(1, 1, 1, 0.06)
        border.width: 1
        antialiasing: true
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 13
        spacing: 12

        Rectangle {
            Layout.preferredWidth: 38; Layout.preferredHeight: 38
            radius: width * Theme.squircle
            color: root.iconColor
            antialiasing: true
            Text {
                anchors.centerIn: parent
                text: root.iconGlyph
                color: "white"
                font.family: Theme.fontFamily
                font.pixelSize: 19
                font.bold: true
            }
        }

        ColumnLayout {
            id: column
            Layout.fillWidth: true
            spacing: 1

            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: root.app
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.DemiBold
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                }
                Text {
                    text: root.time
                    color: Theme.labelSecondary
                    font.family: Theme.fontFamily
                    font.pixelSize: 12
                }
            }
            Text {
                visible: root.title !== ""
                text: root.title
                color: Theme.label
                font.family: Theme.fontFamily
                font.pixelSize: 14
                font.weight: Font.DemiBold
                Layout.fillWidth: true
                elide: Text.ElideRight
            }
            Text {
                text: root.body
                color: Theme.label
                font.family: Theme.fontFamily
                font.pixelSize: 14
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                maximumLineCount: 2
                elide: Text.ElideRight
            }
        }
    }
}
