import QtQuick
import "components"
import "theme"

// Desktop Calendar — month view with events.
Item {
    id: root
    anchors.fill: parent

    Wallpaper { variant: "midnight" }
    DesktopChrome { menuApp: "Taqvim" }

    Window_ {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -14
        width: 1140; height: 700
        title: "Taqvim — Aprel 2026"

        Item {
            anchors.fill: parent

            // Toolbar
            Item {
                id: tb
                anchors.top: parent.top
                anchors.left: parent.left; anchors.right: parent.right
                height: 50

                Row {
                    anchors.left: parent.left; anchors.leftMargin: 16
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 12
                    Rectangle { width: 26; height: 26; radius: 6; color: Theme.fillSec
                        Icon { anchors.centerIn: parent; name: "caret-left"; weight: "bold"; color: Theme.label; size: 14 }
                    }
                    Text { text: "Bugun"; color: Theme.label; font.family: Theme.fontFamily; font.pixelSize: 13; font.weight: Font.DemiBold; anchors.verticalCenter: parent.verticalCenter; renderType: Text.NativeRendering }
                    Rectangle { width: 26; height: 26; radius: 6; color: Theme.fillSec
                        Icon { anchors.centerIn: parent; name: "caret-right"; weight: "bold"; color: Theme.label; size: 14 }
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Aprel 2026"
                    color: Theme.label
                    font.family: Theme.fontDisplay
                    font.pixelSize: 22
                    font.weight: Font.Bold
                    renderType: Text.NativeRendering
                }

                Row {
                    anchors.right: parent.right; anchors.rightMargin: 16
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 6

                    // Segmented Day/Week/Month/Year
                    Rectangle {
                        width: 230; height: 28; radius: 7
                        color: Theme.fillSec
                        Row {
                            anchors.fill: parent
                            Repeater {
                                model: ["Kun", "Hafta", "Oy", "Yil"]
                                delegate: Item {
                                    width: parent.width / 4; height: parent.height
                                    Rectangle { visible: index === 2; anchors.fill: parent; anchors.margins: 2; radius: 6; color: Theme.grey4 }
                                    Text {
                                        anchors.centerIn: parent
                                        text: modelData
                                        color: Theme.label
                                        font.family: Theme.fontFamily
                                        font.pixelSize: 12
                                        font.weight: index === 2 ? Font.DemiBold : Font.Normal
                                        renderType: Text.NativeRendering
                                    }
                                }
                            }
                        }
                    }
                }

                Rectangle { anchors.left: parent.left; anchors.right: parent.right; anchors.bottom: parent.bottom; height: 1; color: Theme.separator }
            }

            // Day-of-week header
            Row {
                id: dows
                anchors.top: tb.bottom
                anchors.left: parent.left; anchors.right: parent.right
                anchors.leftMargin: 16; anchors.rightMargin: 16
                height: 30
                Repeater {
                    model: ["Du", "Se", "Cho", "Pa", "Ju", "Sha", "Yak"]
                    delegate: Item {
                        width: (parent.width) / 7; height: parent.height
                        Text {
                            anchors.centerIn: parent
                            text: modelData
                            color: index === 6 ? Theme.red : Theme.labelSecondary
                            font.family: Theme.fontFamily
                            font.pixelSize: 11
                            font.weight: Font.Bold
                            font.letterSpacing: 0.4
                            renderType: Text.NativeRendering
                        }
                    }
                }
            }

            // Month grid: 5 rows × 7 cols
            Grid {
                anchors.top: dows.bottom
                anchors.left: parent.left; anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.leftMargin: 16; anchors.rightMargin: 16; anchors.bottomMargin: 16
                columns: 7
                rows: 5
                rowSpacing: 0
                columnSpacing: 0
                property real cellW: width / 7
                property real cellH: height / 5

                Repeater {
                    model: 35
                    delegate: Item {
                        width: parent.cellW; height: parent.cellH

                        property int dayOfMonth: index - 2  // Apr 1 falls on Wed (index 2)
                        property bool inMonth: dayOfMonth >= 1 && dayOfMonth <= 30
                        property bool isToday: dayOfMonth === 28
                        property bool isWeekend: (index % 7) === 6

                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            border.color: Theme.separator
                            border.width: 0.5
                        }

                        // Date number
                        Item {
                            anchors.top: parent.top
                            anchors.right: parent.right
                            width: 36; height: 28

                            Rectangle {
                                visible: parent.parent.isToday
                                anchors.centerIn: parent
                                width: 22; height: 22
                                radius: 11
                                color: Theme.red
                                antialiasing: true
                            }
                            Text {
                                anchors.centerIn: parent
                                text: parent.parent.inMonth ? parent.parent.dayOfMonth : ""
                                color: parent.parent.isToday ? "white"
                                       : !parent.parent.inMonth ? Theme.labelTertiary
                                       : parent.parent.isWeekend ? Theme.red
                                       : Theme.label
                                font.family: Theme.fontDisplay
                                font.pixelSize: 13
                                font.weight: parent.parent.isToday ? Font.Bold : Font.Medium
                                renderType: Text.NativeRendering
                            }
                        }

                        // Events for selected days (sample)
                        Column {
                            anchors.top: parent.top
                            anchors.topMargin: 32
                            anchors.left: parent.left; anchors.right: parent.right
                            anchors.leftMargin: 6; anchors.rightMargin: 6
                            spacing: 3

                            Repeater {
                                model: {
                                    if (parent.parent.dayOfMonth === 6)  return [{ t: "Sport", c: Theme.green }];
                                    if (parent.parent.dayOfMonth === 9)  return [{ t: "Stomatolog 16:30", c: Theme.red }];
                                    if (parent.parent.dayOfMonth === 14) return [{ t: "Demo", c: Theme.indigo }, { t: "Kechki ovqat", c: Theme.orange }];
                                    if (parent.parent.dayOfMonth === 18) return [{ t: "Otam tug'ilgan kun", c: Theme.pink }];
                                    if (parent.parent.dayOfMonth === 22) return [{ t: "Konferensiya", c: Theme.blue }];
                                    if (parent.parent.dayOfMonth === 25) return [{ t: "Sayohat", c: Theme.purple }];
                                    if (parent.parent.dayOfMonth === 28) return [{ t: "Aziza 14:00", c: Theme.cyan }, { t: "ZaminOS demo", c: Theme.indigo }];
                                    if (parent.parent.dayOfMonth === 30) return [{ t: "Sport", c: Theme.green }];
                                    return [];
                                }
                                delegate: Rectangle {
                                    width: parent.width
                                    height: 18
                                    radius: 4
                                    color: modelData.c
                                    Text {
                                        anchors.left: parent.left; anchors.leftMargin: 6
                                        anchors.right: parent.right; anchors.rightMargin: 6
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: modelData.t
                                        color: "white"
                                        font.family: Theme.fontFamily
                                        font.pixelSize: 10
                                        font.weight: Font.DemiBold
                                        elide: Text.ElideRight
                                        renderType: Text.NativeRendering
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
