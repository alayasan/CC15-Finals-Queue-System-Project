import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQml.Models 2.15


ComboBox{
    id: dropdown

    // Custom Properties
    property color colorDefault: "#ededed"
    property color colorPressed: "#e7e7e7"
    property color colorMouseOver: "#f9f9f9"
    property double bgRadius
    property var unselectText: "NO DISPLAY TEXT"
    property color delegateColorDefault: "#ededed"
    property color delegateColorPressed: "#e7e7e7"
    property color delegateColorMouseOver: "#f9f9f9"
    property color iconColor

    QtObject{
        id: internal
        property var dynamicColor: if(dropdown.down){
                                       dropdown.down ? colorPressed : colorDefault
                                   } else{
                                       dropdown.hovered ? colorMouseOver : colorDefault
                                 }
    }

    currentIndex: -1
    displayText: if(currentIndex == -1){
                     qsTr(unselectText)
                 }

    model: 1
    font.family: "Segoe UI"
    width: 200
    height: 40

    background: Rectangle{
        id: dropdownbg
        color: internal.dynamicColor
        radius: bgRadius
        border.color: "#333333"
        border.width: 1
    }

    delegate: ItemDelegate{
        id: itemDlgt
        width: dropdown.width
        height: 40

        contentItem: Text{
            id: textItem
            text: modelData
            color: "#111111"
            elide: Text.ElideRight
            width: parent.width
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font: dropdown.font
        }

        background: Rectangle{
            color: itemDlgt.hovered ? delegateColorMouseOver : delegateColorDefault
            anchors.left: itemDlgt.left
            anchors.leftMargin: 0
            width:itemDlgt.width - 2
        }
    }

    indicator: Image{
        id: ddIcon
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        source: "../images/svg-images/dropdown-arrow.svg"
        rotation: dropdown.popup.visible ? 180 : 0
        anchors.rightMargin: 10
        sourceSize.height: 10
        sourceSize.width: 10
        fillMode: Image.PreserveAspectFit

        ColorOverlay{
            anchors.fill: parent
            color: iconColor
            antialiasing: false
            source: ddIcon
        }
    }

    popup: Popup {
        id: comboPopup
        y: dropdown.height - 1
        width: dropdown.width
        height: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            id: listView
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            implicitHeight: 160
            model: dropdown.popup.visible ? dropdown.delegateModel : null

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.width: 1
            border.color: "#333333"
            radius: bgRadius
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:2;height:40;width:300}
}
##^##*/
