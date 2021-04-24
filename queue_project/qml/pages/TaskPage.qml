import QtQuick 2.0

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            x: 238
            y: 168
            text: qsTr("tasks")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 48
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:1}
}
##^##*/
