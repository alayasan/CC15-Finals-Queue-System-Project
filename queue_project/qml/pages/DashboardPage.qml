import QtQuick 2.0

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            x: 578
            y: 298
            text: qsTr("dashboard")
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
