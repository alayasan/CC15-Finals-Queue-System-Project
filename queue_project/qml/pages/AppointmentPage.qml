import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"
import QtQuick.Timeline 1.0


Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent
        clip: true

        CustomButton{
            x: 110
            y: 394
            width: 622
            height: 268

        }

        Rectangle {
            id: rectangle
            x: -31
            y: 12
            width: 458
            height: 106
            color: "#3a53a4"
            radius: 25

            Label {
                id: label
                x: 174
                y: 28
                color: "#ffffff"
                text: qsTr("Appointments")
                anchors.verticalCenter: parent.verticalCenter
                font.styleName: "Regular"
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Segoe UI"
                font.pointSize: 35
            }
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                duration: 1000
                loops: 1
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        startFrame: 0
        enabled: true
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:720;width:1280}D{i:5}
}
##^##*/
