import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        Rectangle {
            id: content
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            anchors.topMargin: 250
            anchors.leftMargin: 25
            anchors.rightMargin: 25
        }

        Rectangle {
            id: rectangle
            height: 200
            color: "#4bebb9"
            radius: 8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.rightMargin: 50
            anchors.leftMargin: 50
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:2}D{i:3}
}
##^##*/
