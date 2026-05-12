// Vanilla Quickshell starter — bar with clock at the top.
// Hot-reloads on save.

import Quickshell
import Quickshell.Wayland
import QtQuick

ShellRoot {
    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 32
        color: "#1e1e2e"

        Row {
            anchors.fill: parent
            anchors.leftMargin: 12
            anchors.rightMargin: 12
            spacing: 16

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "Hyprland"
                color: "#cdd6f4"
                font.pixelSize: 13
                font.bold: true
            }

            Item { width: parent.width - 200; height: 1 }

            Text {
                id: clock
                anchors.verticalCenter: parent.verticalCenter
                color: "#cdd6f4"
                font.pixelSize: 13
                font.family: "monospace"

                property string now: ""
                text: now

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    triggeredOnStart: true
                    onTriggered: clock.now = new Date().toLocaleString(Qt.locale(),
                                                                       "ddd dd MMM  HH:mm:ss")
                }
            }
        }
    }
}
