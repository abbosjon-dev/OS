import QtQuick
import QtQuick.Window
import "theme"

Item {
    id: root
    property string mode: "mobile" // "mobile" | "desktop"

    Loader {
        anchors.fill: parent
        sourceComponent: root.mode === "desktop" ? desktopShell : mobileShell
    }

    Component { id: mobileShell;  MobileShell {} }
    Component { id: desktopShell; DesktopShell {} }
}
