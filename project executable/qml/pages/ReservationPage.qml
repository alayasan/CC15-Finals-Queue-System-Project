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
            visible: false
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

        Rectangle {
            id: roombox
            x: 200
            y: 100
            width: room1.width * 4 + 30
            height: room1.height * 3 + 20
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter


            Rectangle {
                id: room1
                width: 230
                height: 125
                color: "#3bfbc9"
                radius: 8
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Text {
                    id: room1txt
                    text: qsTr("Lab A")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    font.styleName: "Semibold"
                    font.capitalization: Font.Capitalize
                    font.family: "Segoe UI"
                    anchors.leftMargin: 8
                    anchors.topMargin: 8
                }

                Text {
                    id: room1Availability
                    text: qsTr("• available")
                    anchors.left: room1txt.right
                    anchors.top: parent.top
                    font.letterSpacing: 0.5
                    font.pixelSize: 12
                    font.bold: true
                    anchors.topMargin: 8
                    font.family: "Segoe UI"
                    font.capitalization: Font.AllUppercase
                    anchors.leftMargin: 10
                }

                CustomButton{
                    width: 130
                    height: 30
                    text: "Reserve this room"
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    font.family: "Segoe UI"
                    bgRadius: 8
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10

                }

                Text {
                    id: roomAdress
                    text: qsTr("Faber Hall 301")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    font.pixelSize: 12
                    leftPadding: 0
                    padding: 5
                    anchors.topMargin: 30
                    anchors.leftMargin: 8
                    anchors.rightMargin: 8
                    font.styleName: "Semibold"
                    font.family: "Segoe UI"
                    font.capitalization: Font.AllUppercase
                }

            }

            Rectangle {
                id: room2
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room1.right
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 0
                Text {
                    id: text4
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
            }

            Rectangle {
                id: room3
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room2.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Text {
                    id: text5
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
                anchors.leftMargin: 10
            }

            Rectangle {
                id: room4
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room3.right
                anchors.top: parent.top
                anchors.topMargin: 0
                Text {
                    id: text6
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
                anchors.leftMargin: 10
            }

            Rectangle {
                id: room5
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: parent.left
                anchors.top: room1.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 10
                Text {
                    id: text7
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
            }

            Rectangle {
                id: room6
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room5.right
                anchors.top: room2.bottom
                anchors.topMargin: 10
                Text {
                    id: text8
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
                anchors.leftMargin: 10
            }

            Rectangle {
                id: room7
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room6.right
                anchors.top: room3.bottom
                anchors.topMargin: 10
                Text {
                    id: text9
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
                anchors.leftMargin: 10
            }

            Rectangle {
                id: room8
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room7.right
                anchors.top: room4.bottom
                anchors.topMargin: 10
                Text {
                    id: text10
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
                anchors.leftMargin: 10
            }

            Rectangle {
                id: room9
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: parent.left
                anchors.top: room5.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 10
                Text {
                    id: text11
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
            }

            Rectangle {
                id: room10
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room9.right
                anchors.top: room6.bottom
                anchors.leftMargin: 10
                anchors.topMargin: 10
                Text {
                    id: text12
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
            }


            Rectangle {
                id: room11
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room10.right
                anchors.top: room7.bottom
                anchors.leftMargin: 10
                anchors.topMargin: 10
                Text {
                    id: text14
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
            }
            Rectangle {
                id: room12
                width: room1.width
                height: room1.height
                color: "#3bfbc9"
                anchors.left: room11.right
                anchors.top: room8.bottom
                anchors.leftMargin: 10
                anchors.topMargin: 10
                Text {
                    id: text13
                    text: qsTr("Text")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 8
                    anchors.leftMargin: 8
                }
            }
        }







    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:3;height:720;width:1280}D{i:4;invisible:true}D{i:18}
D{i:19}D{i:21}D{i:17}D{i:22}D{i:24}D{i:26}D{i:28}D{i:30}D{i:32}D{i:34}D{i:36}D{i:38}
D{i:40}D{i:42}
}
##^##*/
