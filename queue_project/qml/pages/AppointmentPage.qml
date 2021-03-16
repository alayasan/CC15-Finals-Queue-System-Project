import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"


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
            x: -34
            y: 17
            width: 463
            height: 136
            color: "#27eded"
            radius: 40
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:720;width:1280}D{i:1}
}
##^##*/
