import QtQuick
import QtQuick.Layouts
import "../theme"

// iOS Settings list row.
// trailing: "switch" | "chevron" | "value" | "none"
Item {
    id: root
    property string title: ""
    property string subtitle: ""
    property string iconGlyph: ""
    property color iconColor: Theme.blue
    property string value: ""
    property string trailing: "chevron"
    property bool checked: true
    property bool divider: true

    width: parent.width
    height: 56

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        spacing: 12

        // Icon tile
        Rectangle {
            visible: root.iconGlyph !== ""
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32
            radius: 7
            color: root.iconColor
            antialiasing: true
            Text {
                anchors.centerIn: parent
                text: root.iconGlyph
                color: "white"
                font.family: Theme.fontFamily
                font.pixelSize: 17
                font.bold: true
            }
        }

        ColumnLayout {
            spacing: 0
            Layout.fillWidth: true
            Text {
                text: root.title
                color: Theme.label
                font.family: Theme.fontFamily
                font.pixelSize: 17
                font.weight: Font.Normal
            }
            Text {
                visible: root.subtitle !== ""
                text: root.subtitle
                color: Theme.labelSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 13
            }
        }

        // Trailing
        Text {
            visible: root.trailing === "value"
            text: root.value
            color: Theme.labelSecondary
            font.family: Theme.fontFamily
            font.pixelSize: 17
        }

        Switch_ {
            visible: root.trailing === "switch"
            checked: root.checked
        }

        Text {
            visible: root.trailing === "chevron"
            text: "›"
            color: Theme.labelTertiary
            font.family: Theme.fontFamily
            font.pixelSize: 22
            font.weight: Font.Bold
        }
    }

    // Hairline separator (inset to align under text, not under icon)
    Rectangle {
        visible: root.divider
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: root.iconGlyph !== "" ? 60 : 16
        height: 1
        color: Theme.separatorOpaque
        opacity: 0.45
    }
}
