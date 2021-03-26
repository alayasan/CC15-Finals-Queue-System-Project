import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        clip: true

        Rectangle {
            id: rectangle
            x: -31
            y: 12
            width: 458
            height: 106
            color: "#3a53a4"
            radius: 25

            Label {
                id: label
                x: 174
                y: 28
                color: "#ffffff"
                text: qsTr("Appointments")
                anchors.verticalCenter: parent.verticalCenter
                font.styleName: "Regular"
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Segoe UI"
                font.pointSize: 35
            }
        }


        Rectangle {
            id: filters
            width: bg.width / 3.14159265
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 150
            anchors.bottomMargin: 25
            anchors.leftMargin: 100

            Rectangle {
                id: teacher
                x: 91
                width: 400
                height: 50
                color: "#ffffff"
                anchors.top: parent.top
                anchors.topMargin: 25
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter

                Label {
                    id: tchrtext
                    y: -58
                    color: "#111111"
                    text: qsTr("Teacher:")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    font.pointSize: 9
                    font.family: "Segoe UI"
                }

                CustomDropdown{
                    x: -186
                    y: -68
                    width: 200
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    iconColor: "#111111"
                    delegateColorPressed: "#ededed"
                    delegateColorMouseOver: "#e7e7e7"
                    delegateColorDefault: "#f9f9f9"
                    bgRadius: 3
                    anchors.rightMargin: 25
                    unselectText: "ready"
                }
            }

            Rectangle {
                id: time
                x: 91
                width: 400
                height: 50
                color: "#ffffff"
                anchors.top: teacher.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
                Label {
                    id: tchrtext1
                    y: -58
                    color: "#111111"
                    text: qsTr("Time:")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pointSize: 9
                    anchors.leftMargin: 25
                    font.family: "Segoe UI"
                }

                CustomDropdown {
                    x: -186
                    y: -68
                    width: 200
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    bgRadius: 3
                    anchors.rightMargin: 25
                    unselectText: "ready"
                }
                anchors.topMargin: 25
            }

            Rectangle {
                id: date
                x: 91
                width: 400
                height: 50
                color: "#ffffff"
                anchors.top: time.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0

                Label {
                    id: tchrtext2
                    y: -58
                    color: "#111111"
                    text: qsTr("Date:")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pointSize: 9
                    font.family: "Segoe UI"
                    anchors.leftMargin: 25
                }

                anchors.topMargin: 25

                CustomTextField{
                    width: 200
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 25

                }
            }

            CustomDatePicker{
                width: 250
                height: 250
                anchors.top: date.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 50
                Component.onCompleted: set(new Date()) // today
                onClicked: print('onClicked', Qt.formatDate(date, 'M/d/yyyy'))
            }
        }

        DatePicker{
            x: 600
            y: 104

        }
    }
}





/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}
}
##^##*/
