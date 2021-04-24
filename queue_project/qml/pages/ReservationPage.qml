import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import "../components"

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        TapHandler{
            onTapped: forceActiveFocus()
        }

        Text {
            id: title
            x: 50
            text: qsTr("Room Reservations")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 18
            anchors.topMargin: 25
            font.bold: true
            font.family: "Segoe UI"
            anchors.leftMargin: 25
        }

        Rectangle {
            id: rectangle
            color: "#158fd4"
            radius: 8
            anchors.fill: parent
            anchors.rightMargin: 200
            anchors.leftMargin: 200
            anchors.bottomMargin: 50
            anchors.topMargin: 100

            Rectangle {
                id: rectangle1
                width: 250
                height: roomBox.height + fromBox.height + toBox.height + 90
                color: "#ffffff"
                radius: 8
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 25
                anchors.topMargin: 25

                Rectangle {
                    id: roomBox
                    height: 40
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    Text {
                        id: txt
                        y: 13
                        text: qsTr("Room No.:")
                        anchors.left: parent.left
                        font.pixelSize: 10
                        font.styleName: "Semibold"
                        anchors.leftMargin: 10
                        font.family: "Segoe UI"
                    }

                    CustomTextField{
                        id: roomField
                        anchors.left: txt.right
                        anchors.right: parent.right
                        placeholderText: "---"
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10

                    }
                }

                Rectangle {
                    id: fromBox
                    height: 40
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: roomBox.bottom
                    anchors.topMargin: 15
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    Text {
                        id: txt1
                        y: 13
                        text: qsTr("From:")
                        anchors.left: parent.left
                        font.pixelSize: 10
                        font.styleName: "Semibold"
                        anchors.leftMargin: 10
                        font.family: "Segoe UI"
                    }

                    CustomTextField {
                        id: fromField
                        width: roomField.width
                        anchors.right: parent.right
                        placeholderText: "---"
                        anchors.rightMargin: 10
                    }
                }

                Rectangle {
                    id: toBox
                    height: 40
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: fromBox.bottom
                    anchors.topMargin: 15
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    Text {
                        id: txt2
                        y: 13
                        text: qsTr("To:")
                        anchors.left: parent.left
                        font.pixelSize: 10
                        font.styleName: "Semibold"
                        anchors.leftMargin: 10
                        font.family: "Segoe UI"
                    }

                    CustomTextField {
                        id: toField
                        width: roomField.width
                        anchors.right: parent.right
                        placeholderText: "---"
                        anchors.rightMargin: 10
                    }
                }
            }

            Rectangle {
                id: rectangle2
                color: "#ffffff"
                radius: 8
                anchors.left: rectangle1.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 25
                anchors.leftMargin: 50
                anchors.rightMargin: 25
                anchors.topMargin: 25
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.75;height:720;width:1280}D{i:6}D{i:9}
}
##^##*/
