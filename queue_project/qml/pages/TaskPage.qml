import QtQuick 2.0

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            text: qsTr("tasks")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 18
            anchors.leftMargin: 25
            anchors.topMargin: 25
            font.bold: true
            font.family: "Segoe UI"
            font.capitalization: Font.Capitalize
        }

        Rectangle {
            id: rectangle
            width: 500
            color: "#4bebb9"
            radius: 8
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.topMargin: 100
            anchors.leftMargin: 50
        }

        Rectangle {
            id: rectangle1
            color: "#158fd4"
            radius: 8
            anchors.left: rectangle.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: rectangle2.top
            anchors.bottomMargin: 25
            anchors.topMargin: 100
            anchors.leftMargin: 50
            anchors.rightMargin: 50
        }

        Rectangle {
            id: rectangle2
            y: 482
            height: 200
            color: "#79cdfd"
            radius: 8
            anchors.left: rectangle.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.leftMargin: 50
            anchors.rightMargin: 50
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:2}D{i:3}D{i:4}D{i:5}
}
##^##*/
