import QtQuick
import "theme"

Item {
    id: root
    // "mobile" | "desktop" | "controlcenter" | "spotlight"
    property string mode: "mobile"

    Loader {
        anchors.fill: parent
        sourceComponent: {
            switch (root.mode) {
            case "desktop":       return desktopShell;
            case "controlcenter": return controlCenter;
            case "spotlight":     return spotlight;
            default:              return mobileShell;
            }
        }
    }

    Component { id: mobileShell;   MobileShell {} }
    Component { id: desktopShell;  DesktopShell {} }
    Component { id: controlCenter; ControlCenter {} }
    Component { id: spotlight;     Spotlight {} }
}
