import QtQuick
import "theme"

Item {
    id: root
    property string mode: "mobile"

    Loader {
        anchors.fill: parent
        sourceComponent: {
            switch (root.mode) {
            case "lockscreen":     return lockScreen;
            case "home":           return mobileShell;
            case "notifications":  return notifCenter;
            case "appswitcher":    return appSwitcher;
            case "controlcenter":  return controlCenter;
            case "settings":       return settings;
            case "settings-wifi":  return settingsWifi;
            case "phonecall":      return phoneCall;
            case "keyboard":       return keyboard;
            case "calculator":     return calculator;
            case "notes":          return notes;
            case "desktop":        return desktopShell;
            case "spotlight":      return spotlight;
            default:               return mobileShell;
            }
        }
    }

    Component { id: lockScreen;    LockScreen {} }
    Component { id: mobileShell;   MobileShell {} }
    Component { id: notifCenter;   NotificationCenter {} }
    Component { id: appSwitcher;   AppSwitcher {} }
    Component { id: controlCenter; ControlCenter {} }
    Component { id: settings;      Settings {} }
    Component { id: settingsWifi;  SettingsWifi {} }
    Component { id: phoneCall;     PhoneCall {} }
    Component { id: keyboard;      Keyboard {} }
    Component { id: calculator;    Calculator {} }
    Component { id: notes;         Notes {} }
    Component { id: desktopShell;  DesktopShell {} }
    Component { id: spotlight;     Spotlight {} }
}
