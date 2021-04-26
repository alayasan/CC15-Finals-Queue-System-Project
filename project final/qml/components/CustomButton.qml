import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: button

    // Custom Properties
    property color colorDefault: "#ededed"
    property color colorMouseOver: "#e7e7e7"
    property color colorPressed: "#f9f9f9"
    property int bgRadius: 5
    property int borderWidth
    property color borderColor
    property color textColor: "#111111"
    
    QtObject{
        id: internal

        property var dynamicColor: if(button.down){
                                       button.down ? colorPressed : colorDefault
                                   }else{
                                       button.hovered ? colorMouseOver : colorDefault
                                   }
    }

    text: qsTr("Button")
    contentItem: Item{
        Text {
            id: name
            text: button.text
            font: button.font
            color: textColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    background: Rectangle{
        id: btnbg
        color: internal.dynamicColor
        radius: bgRadius
        border.width: borderWidth
        border.color: borderColor
    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:10;height:25;width:50}
}
##^##*/
