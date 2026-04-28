import QtQuick
import "../theme"

Item {
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#0A1F1A" }
            GradientStop { position: 0.55; color: "#0F2D26" }
            GradientStop { position: 1.0; color: "#1A3D34" }
        }
    }

    // Soft glow ring (sun/earth horizon)
    Rectangle {
        width: parent.width * 1.6
        height: width
        radius: width / 2
        x: parent.width / 2 - width / 2
        y: parent.height * 0.55
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.12, 0.71, 0.65, 0.55) }
            GradientStop { position: 0.5; color: Qt.rgba(0.12, 0.71, 0.65, 0.10) }
            GradientStop { position: 1.0; color: Qt.rgba(0, 0, 0, 0) }
        }
    }

    // Mountain silhouette layers
    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            // back range
            ctx.fillStyle = "#0E2922";
            ctx.beginPath();
            ctx.moveTo(0, height * 0.72);
            ctx.lineTo(width * 0.18, height * 0.55);
            ctx.lineTo(width * 0.34, height * 0.66);
            ctx.lineTo(width * 0.55, height * 0.50);
            ctx.lineTo(width * 0.78, height * 0.62);
            ctx.lineTo(width, height * 0.55);
            ctx.lineTo(width, height);
            ctx.lineTo(0, height);
            ctx.closePath();
            ctx.fill();

            // front range
            ctx.fillStyle = "#08160F";
            ctx.beginPath();
            ctx.moveTo(0, height * 0.85);
            ctx.lineTo(width * 0.22, height * 0.72);
            ctx.lineTo(width * 0.42, height * 0.80);
            ctx.lineTo(width * 0.62, height * 0.68);
            ctx.lineTo(width * 0.85, height * 0.78);
            ctx.lineTo(width, height * 0.74);
            ctx.lineTo(width, height);
            ctx.lineTo(0, height);
            ctx.closePath();
            ctx.fill();
        }
    }

    // Stars
    Repeater {
        model: 24
        delegate: Rectangle {
            width: Math.random() < 0.2 ? 2 : 1
            height: width
            radius: width / 2
            color: "white"
            opacity: 0.3 + Math.random() * 0.6
            x: Math.random() * parent.width
            y: Math.random() * parent.height * 0.45
        }
    }
}
