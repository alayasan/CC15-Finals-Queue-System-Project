import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"
import QtQuick.Layouts 1.15


Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        Rectangle {
            id: bottomBar
            y: 478
            height: 25
            color: "#e7e7e7"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0

            Label {
                id: labelDate
                color: "#111111"
                text: "Time"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 0
                anchors.leftMargin: 10
                anchors.bottomMargin: 0
                font.family: "Segoe UI"
                font.pointSize: 9
            }
        }


        Rectangle {
            id: rectangle1
            height: 70
            color: "#3f7ebd"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Rectangle {
                id: rectangle
                x: 50
                y: 332
                width: 200
                height: 0.8 * parent.height
                color: "#f24545"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 50
            }
        }
    }

    Connections{
        target: backend

        function onPrintTime(time){
            labelDate.text = time
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:5}D{i:4}
}
##^##*/
