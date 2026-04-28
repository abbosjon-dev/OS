pragma Singleton
import QtQuick

QtObject {
    // ────────────────────────────────────────────────────────────────────
    // iOS dark mode palette (system colors)
    // ────────────────────────────────────────────────────────────────────

    // Backgrounds
    readonly property color bgSystem:        "#000000"
    readonly property color bgSecondary:     "#1C1C1E"
    readonly property color bgTertiary:      "#2C2C2E"
    readonly property color bgGrouped:       "#000000"
    readonly property color bgGroupedSec:    "#1C1C1E"

    // Materials (translucent)
    readonly property color material:        Qt.rgba(0.16, 0.16, 0.18, 0.78)
    readonly property color materialThick:   Qt.rgba(0.10, 0.10, 0.12, 0.86)
    readonly property color materialThin:    Qt.rgba(0.20, 0.20, 0.22, 0.55)

    // Separators
    readonly property color separator:       Qt.rgba(0.33, 0.33, 0.35, 0.65)
    readonly property color separatorOpaque: "#38383A"

    // Labels
    readonly property color label:           "#FFFFFF"
    readonly property color labelSecondary:  Qt.rgba(0.92, 0.92, 0.96, 0.60)
    readonly property color labelTertiary:   Qt.rgba(0.92, 0.92, 0.96, 0.30)
    readonly property color labelQuaternary: Qt.rgba(0.92, 0.92, 0.96, 0.18)

    // System colors (iOS dark)
    readonly property color blue:    "#0A84FF"
    readonly property color green:   "#30D158"
    readonly property color indigo:  "#5E5CE6"
    readonly property color orange:  "#FF9F0A"
    readonly property color pink:    "#FF375F"
    readonly property color purple:  "#BF5AF2"
    readonly property color red:     "#FF453A"
    readonly property color teal:    "#64D2FF"
    readonly property color yellow:  "#FFD60A"
    readonly property color mint:    "#66D4CF"
    readonly property color cyan:    "#5AC8FA"
    readonly property color brown:   "#AC8E68"

    // Greys
    readonly property color grey1:   "#8E8E93"
    readonly property color grey2:   "#636366"
    readonly property color grey3:   "#48484A"
    readonly property color grey4:   "#3A3A3C"
    readonly property color grey5:   "#2C2C2E"
    readonly property color grey6:   "#1C1C1E"

    // Fill (used for buttons / chips)
    readonly property color fillPrim:  Qt.rgba(0.46, 0.46, 0.50, 0.36)
    readonly property color fillSec:   Qt.rgba(0.46, 0.46, 0.50, 0.32)
    readonly property color fillTer:   Qt.rgba(0.46, 0.46, 0.50, 0.24)
    readonly property color fillQuat:  Qt.rgba(0.46, 0.46, 0.50, 0.18)

    // Radii
    readonly property int radTiny: 6
    readonly property int radSm:   10
    readonly property int radMd:   14
    readonly property int radLg:   22
    readonly property int radXl:   28
    readonly property real squircle: 0.225  // multiplier of width for app icons

    // Spacing
    readonly property int s1: 4
    readonly property int s2: 8
    readonly property int s3: 12
    readonly property int s4: 16
    readonly property int s5: 20
    readonly property int s6: 24
    readonly property int s7: 32
    readonly property int s8: 44

    // Typography
    readonly property string fontFamily:  "Inter"
    readonly property string fontMono:    "monospace"
    readonly property string fontDisplay: "Inter Display"

    // ZaminOS accent (used sparingly to brand the OS chrome)
    readonly property color accent:       "#0A84FF"
    readonly property color accentSoft:   "#5AC8FA"
}
