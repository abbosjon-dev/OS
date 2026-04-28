import QtQuick
import "../theme"

// Smooth iOS-style wallpaper — soft gradient, no noise.
Item {
    anchors.fill: parent
    property string variant: "midnight" // "midnight" | "ocean" | "sunset"

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: variant === "sunset" ? "#3B1F4F" : variant === "ocean" ? "#0B2E4A" : "#0B0B23" }
            GradientStop { position: 0.5; color: variant === "sunset" ? "#722F4A" : variant === "ocean" ? "#0F4A6E" : "#1A0F4D" }
            GradientStop { position: 1.0; color: variant === "sunset" ? "#1A0E2C" : variant === "ocean" ? "#082338" : "#070617" }
        }
    }

    // Soft elliptical glow (top-right)
    Rectangle {
        width: parent.width * 1.2
        height: width
        radius: width / 2
        x: parent.width * 0.35
        y: -parent.width * 0.6
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.55, 0.45, 1.0, 0.35) }
            GradientStop { position: 0.6; color: Qt.rgba(0.55, 0.45, 1.0, 0.06) }
            GradientStop { position: 1.0; color: Qt.rgba(0, 0, 0, 0) }
        }
    }

    // Bottom blue glow
    Rectangle {
        width: parent.width * 1.4
        height: width
        radius: width / 2
        x: -parent.width * 0.4
        y: parent.height * 0.4
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.04, 0.52, 1.0, 0.40) }
            GradientStop { position: 0.7; color: Qt.rgba(0.04, 0.52, 1.0, 0.05) }
            GradientStop { position: 1.0; color: Qt.rgba(0, 0, 0, 0) }
        }
    }
}
