import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnTopBar

    property url btnIconSource: "../images/svg-images/minimize_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272e"
    property color btnColorClicked: "#00a1f1"
    property color overlayColor: "#ffffff"

    QtObject{
        id: internal
        property var dynamicColor: if(btnTopBar.down){
                                        btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else{
                                        btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    width: 35
    height: 35

    background: Rectangle{
        id: bgbtn
        color: internal.dynamicColor
        Image {
            id: iconMenu
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay{
            anchors.fill: iconMenu
            source: iconMenu
            color: overlayColor
            antialiasing: false
        }
    }

}
/*##^##
Designer {
    D{i:0;formeditorZoom:16}
}
##^##*/
