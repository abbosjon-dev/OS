import QtQuick
import "../theme"

// iOS button. style: "filled" (blue) | "tinted" (translucent blue) | "plain"
// kind: "default" | "destructive"
Rectangle {
    id: root
    property string text: "Tugma"
    property string style: "filled"
    property string kind: "default"
    property bool full: false

    readonly property color baseColor: kind === "destructive" ? Theme.red : Theme.blue

    implicitHeight: 44
    implicitWidth: label.implicitWidth + 40
    height: implicitHeight
    width: full && parent ? parent.width : implicitWidth

    radius: height / 2
    antialiasing: true
    color: {
        if (style === "filled")  return baseColor;
        if (style === "tinted")  return Qt.rgba(baseColor.r, baseColor.g, baseColor.b, 0.20);
        return "transparent";
    }

    Text {
        id: label
        anchors.centerIn: parent
        text: root.text
        font.family: Theme.fontFamily
        font.pixelSize: 16
        font.weight: Font.DemiBold
        color: root.style === "filled" ? "#FFFFFF" : root.baseColor
        renderType: Text.NativeRendering
    }
}
