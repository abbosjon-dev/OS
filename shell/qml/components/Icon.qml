import QtQuick
import Qt5Compat.GraphicalEffects
import "../theme"

// Resolution-independent icon. Loads a Phosphor SVG from shell/qml/icons/
// and recolors it with `color`. Pick `weight` ("regular" | "fill" | "bold")
// for outline vs solid.
Item {
    id: root
    property string name: ""
    property string weight: "regular"
    property color color: Theme.label
    property real size: 22

    width: size
    height: size

    Image {
        id: img
        anchors.fill: parent
        source: root.name === "" ? "" : Qt.resolvedUrl("../icons/" + root.weight + "/" + root.name + ".svg")
        sourceSize: Qt.size(root.size * 3, root.size * 3)
        fillMode: Image.PreserveAspectFit
        smooth: true
        antialiasing: true
        mipmap: true
        visible: false
        asynchronous: false
    }

    ColorOverlay {
        anchors.fill: img
        source: img
        color: root.color
        antialiasing: true
        cached: true
    }
}
