import QtQuick 2.0

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            text: qsTr("dashboard")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 18
            anchors.topMargin: 25
            anchors.leftMargin: 25
            font.bold: true
            font.family: "Segoe UI"
            font.capitalization: Font.Capitalize
        }

        Rectangle {
            id: rectangle
            x: 126
            width: 500
            color: "#79cdfd"
            radius: 8
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 50
            anchors.bottomMargin: 50
            anchors.topMargin: 100
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:2}D{i:3}
}
##^##*/
