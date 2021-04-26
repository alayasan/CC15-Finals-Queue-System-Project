import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnMenu
    text: qsTr("Menu")
    display: AbstractButton.IconOnly

    property url btnIconSource: "../images/svg-images/menu_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272e"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 25
    property int iconHeight: 25
    property color overlayColor: "#ffffff"
    property color textColor: "#ffffff"

    QtObject{
        id: internal
        property var dynamicColor: if(btnMenu.down){
                                        btnMenu.down ? btnColorClicked : btnColorDefault
                                   } else{
                                        btnMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        Image {
            id: iconButton
            source: btnIconSource
            anchors.leftMargin: 25
            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            antialiasing: true

            ColorOverlay{
                source: iconButton
                color: overlayColor
                anchors.fill: parent
                antialiasing: true
            }
        }

        Text{
            width: 94
            height: 25
            color: textColor
            text: btnMenu.text
            font: btnMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            anchors.leftMargin: 75
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2;height:70;width:200}D{i:4}
}
##^##*/
