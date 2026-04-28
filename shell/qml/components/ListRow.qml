import QtQuick
import QtQuick.Layouts
import "../theme"

// iOS Settings list row.
// trailing: "switch" | "chevron" | "value" | "none"
Item {
    id: root
    property string title: ""
    property string subtitle: ""
    property string iconName: ""
    property string iconWeight: "fill"
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
        spacing: 14

        // Icon tile
        Rectangle {
            visible: root.iconName !== ""
            Layout.preferredWidth: 30
            Layout.preferredHeight: 30
            radius: 7
            color: root.iconColor
            antialiasing: true
            Icon {
                anchors.centerIn: parent
                name: root.iconName
                weight: root.iconWeight
                color: "white"
                size: 18
            }
        }

        ColumnLayout {
            spacing: 0
            Layout.fillWidth: true
            Text {
                text: root.title
                color: Theme.label
                font.family: Theme.fontFamily
                font.pixelSize: 16
                font.weight: Font.Normal
                renderType: Text.NativeRendering
            }
            Text {
                visible: root.subtitle !== ""
                text: root.subtitle
                color: Theme.labelSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 13
                renderType: Text.NativeRendering
            }
        }

        Text {
            visible: root.trailing === "value"
            text: root.value
            color: Theme.labelSecondary
            font.family: Theme.fontFamily
            font.pixelSize: 16
            renderType: Text.NativeRendering
        }

        Switch {
            visible: root.trailing === "switch"
            checked: root.checked
        }

        Icon {
            visible: root.trailing === "chevron"
            name: "caret-right"
            weight: "bold"
            color: Theme.labelTertiary
            size: 14
        }
    }

    Rectangle {
        visible: root.divider
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: root.iconName !== "" ? 60 : 16
        height: 1
        color: Theme.separatorOpaque
        opacity: 0.55
    }
}
