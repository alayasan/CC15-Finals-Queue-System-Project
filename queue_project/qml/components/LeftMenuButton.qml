import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    text: qsTr("Left Menu")

    property url btnIconSource: "../images/svg-images/menu_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272e"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 20
    property int iconHeight: 20
    property color activeMenuColorLeft: "#55aaff"
    property color activeMenuColorRight: "#343a47"
    property bool isActiveMenu: false
    property bool isActiveMenuLeft: isActiveMenu
    property bool isActiveMenuRight: isActiveMenu
    property color overlayColor: "#ffffff"
    property color textColor: "#ffffff"


    QtObject{
        id: internal
        property var dynamicColor: if(btnLeftMenu.down){
                                        btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else{
                                        btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle{
        id: bgbtn
        color: internal.dynamicColor

        Rectangle{
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 3
            visible: isActiveMenuLeft
            color: activeMenuColorLeft
        }

        Rectangle{
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 5
            visible: isActiveMenuRight
            color: activeMenuColorRight
        }
    }

    contentItem: Item{
        id: content
        anchors.fill: parent
        Image {
            id: iconButton
            source: btnIconSource
            anchors.leftMargin: 26
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
            color: textColor
            font: btnLeftMenu.font
            text: btnLeftMenu.text
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:2;height:70;width:250}D{i:7}D{i:6}
}
##^##*/
