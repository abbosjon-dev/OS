import QtQuick
import "../theme"

// iOS segmented control.
Item {
    id: root
    property var options: ["Birinchi", "Ikkinchi", "Uchinchi"]
    property int current: 0
    height: 32
    width: parent ? parent.width : 240

    Rectangle {
        anchors.fill: parent
        radius: 9
        color: Theme.fillTer
        antialiasing: true
    }

    Row {
        id: row
        anchors.fill: parent
        spacing: 0
        Repeater {
            model: root.options
            delegate: Item {
                width: row.width / root.options.length
                height: row.height

                Rectangle {
                    visible: index === root.current
                    anchors.fill: parent
                    anchors.margins: 2
                    radius: 7
                    color: Theme.grey4
                    antialiasing: true
                }

                Text {
                    anchors.centerIn: parent
                    text: modelData
                    color: Theme.label
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                    font.weight: index === root.current ? Font.DemiBold : Font.Medium
                }

                // Vertical separator between items (when neither side is selected)
                Rectangle {
                    visible: index < root.options.length - 1 && index !== root.current && index + 1 !== root.current
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 1; height: parent.height * 0.45
                    color: Theme.separator
                }
            }
        }
    }
}
