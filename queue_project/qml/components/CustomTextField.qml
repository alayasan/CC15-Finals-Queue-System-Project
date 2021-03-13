import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

TextField {
    id: textField

    // Custom Properties
    property color colorDefault: "#ededed"
    property color colorOnFocus: "#f9f9f9"
    property color colorMouseOver: "#e7e7e7"

    QtObject{
        id: internal
        property var dynamicColor: if(textField.focus){
                                        textField.focus ? colorOnFocus : colorDefault
                                   }else{
                                       textField.hovered ? colorMouseOver : colorDefault
                                   }
    }

    implicitWidth: 300
    implicitHeight: 40
    placeholderText: qsTr("Type something")
    color: "#333333"
    font.letterSpacing: 0.7
    font.bold: true
    font.family: "Segoe UI"
    background: Rectangle {
        color: internal.dynamicColor
        radius: 3
        border.width: if(textField.focus){
                            textField.focus ? 2 : 0
                      } else{
                            0
                      }
        border.color: "#333333"
    }

    selectByMouse: true
    selectedTextColor: "#FFFFFF"
    selectionColor: "#ff007f"
    placeholderTextColor: if(textField.focus){
                              textField.focus ? "#7e7e7e" : "#999999"
                        } else{
                              textField.hovered ? "#7e7e7e" : "#999999"
                        }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:2;height:40;width:300}
}
##^##*/
