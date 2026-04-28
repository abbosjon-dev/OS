import QtQuick
import "components"
import "theme"

// iOS-style calculator. Five rows; the bottom row's "0" spans two columns.
Item {
    id: root
    anchors.fill: parent

    readonly property real margin: 16
    readonly property real spacing: 12
    readonly property real cellW: (root.width - margin * 2 - spacing * 3) / 4

    Rectangle { anchors.fill: parent; color: Theme.bgSystem }

    StatusBar { anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 28
        anchors.bottom: pad.top
        anchors.bottomMargin: 16
        text: "12 348"
        color: Theme.label
        font.family: Theme.fontDisplay
        font.pixelSize: 84
        font.weight: Font.Light
        renderType: Text.NativeRendering
    }

    Column {
        id: pad
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: root.spacing

        // Row 1: AC, +/-, %, ÷
        Row {
            spacing: root.spacing
            Repeater {
                model: [
                    { l: "AC",  k: "fn"  },
                    { l: "+/−", k: "fn"  },
                    { l: "%",   k: "fn"  },
                    { l: "÷",   k: "op"  }
                ]
                delegate: CalcButton { label: modelData.l; kind: modelData.k; size: root.cellW }
            }
        }
        // Row 2: 7, 8, 9, ×
        Row {
            spacing: root.spacing
            Repeater {
                model: [{ l: "7", k: "num" }, { l: "8", k: "num" }, { l: "9", k: "num" }, { l: "×", k: "op" }]
                delegate: CalcButton { label: modelData.l; kind: modelData.k; size: root.cellW }
            }
        }
        // Row 3: 4, 5, 6, −
        Row {
            spacing: root.spacing
            Repeater {
                model: [{ l: "4", k: "num" }, { l: "5", k: "num" }, { l: "6", k: "num" }, { l: "−", k: "op" }]
                delegate: CalcButton { label: modelData.l; kind: modelData.k; size: root.cellW }
            }
        }
        // Row 4: 1, 2, 3, +
        Row {
            spacing: root.spacing
            Repeater {
                model: [{ l: "1", k: "num" }, { l: "2", k: "num" }, { l: "3", k: "num" }, { l: "+", k: "op" }]
                delegate: CalcButton { label: modelData.l; kind: modelData.k; size: root.cellW }
            }
        }
        // Row 5: 0 (wide), ,, =
        Row {
            spacing: root.spacing
            CalcButton { label: "0"; kind: "num"; size: root.cellW; wide: true; cellSpacing: root.spacing }
            CalcButton { label: ","; kind: "num"; size: root.cellW }
            CalcButton { label: "="; kind: "op";  size: root.cellW }
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

    component CalcButton: Rectangle {
        property string label: ""
        property string kind: "num"
        property real size: 70
        property bool wide: false
        property real cellSpacing: 12

        width: wide ? size * 2 + cellSpacing : size
        height: size
        radius: size / 2
        antialiasing: true
        color: kind === "op" ? Theme.orange : (kind === "fn" ? Theme.grey1 : Theme.grey5)

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.wide ? parent.left : undefined
            anchors.leftMargin: parent.wide ? parent.size * 0.34 : 0
            anchors.horizontalCenter: parent.wide ? undefined : parent.horizontalCenter
            text: parent.label
            color: parent.kind === "fn" ? Theme.bgSystem : "white"
            font.family: Theme.fontDisplay
            font.pixelSize: parent.label.length > 1 ? 26 : 36
            font.weight: Font.Medium
            renderType: Text.NativeRendering
        }
    }
}
