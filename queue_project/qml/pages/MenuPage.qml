import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"
import QtQuick.Layouts 1.15


Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        Rectangle {
            id: leftMenu
            width: 70
            color: "#f9f9f9"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0


            MenuButton{
                id: menuButton
                width: leftMenu.width
                anchors.top: parent.top
                anchors.topMargin: 0
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                font.weight: Font.Medium
                font.family: "Segoe UI"
                textColor: "#111111"
                btnColorClicked: "#f9f9f9"
                btnColorMouseOver: "#e7e7e7"
                overlayColor: "#111111"
                btnColorDefault: "#ededed"
                btnIconSource: "../images/svg-images/menu_icon.svg"
                onClicked: {
                    menuAnimation.running = true
                }
            }


            LeftMenuButton{
                id: dashboardButton
                x: 0
                width: leftMenu.width
                text: "Dashboard"
                anchors.top: menuButton.bottom
                anchors.topMargin: 1
                font.family: "Segoe UI"
                textColor: "#111111"
                btnColorClicked: "#f9f9f9"
                btnColorMouseOver: "#e7e7e7"
                btnIconSource: "../images/svg-images/home_icon.svg"
                overlayColor: "#111111"
                btnColorDefault: "#ededed"
            }


            LeftMenuButton {
                id: appointmentButton
                x: 0
                width: leftMenu.width
                text: "Appointment"
                anchors.top: dashboardButton.bottom
                anchors.topMargin: 1
                btnIconSource: "../images/svg-images/appointment-icon.svg"
                textColor: "#111111"
                overlayColor: "#111111"
                btnColorDefault: "#ededed"
                btnColorMouseOver: "#e7e7e7"
                btnColorClicked: "#f9f9f9"
                font.family: "Segoe UI"
            }


            LeftMenuButton {
                id: reservationButton
                x: 0
                width: leftMenu.width
                text: "Room Reservation"
                anchors.top: appointmentButton.bottom
                anchors.topMargin: 1
                btnIconSource: "../images/svg-images/key-outline-icon.svg"
                textColor: "#111111"
                overlayColor: "#111111"
                btnColorDefault: "#ededed"
                btnColorMouseOver: "#e7e7e7"
                btnColorClicked: "#f9f9f9"
                font.family: "Segoe UI"
            }


            LeftMenuButton {
                id: taskButton
                x: 0
                width: leftMenu.width
                text: "Tasks"
                anchors.top: reservationButton.bottom
                anchors.topMargin: 1
                btnIconSource: "../images/svg-images/clipboard-icon.svg"
                textColor: "#111111"
                overlayColor: "#111111"
                btnColorDefault: "#ededed"
                btnColorMouseOver: "#e7e7e7"
                btnColorClicked: "#f9f9f9"
                font.family: "Segoe UI"
            }


            LeftMenuButton {
                id: settingsButton
                x: 0
                width: leftMenu.width
                text: "Settings"
                anchors.bottom: logoutButton.top
                anchors.bottomMargin: 1
                btnIconSource: "../images/svg-images/settings_icon.svg"
                textColor: "#111111"
                overlayColor: "#111111"
                btnColorDefault: "#ededed"
                btnColorMouseOver: "#e7e7e7"
                btnColorClicked: "#f9f9f9"
                font.family: "Segoe UI"
            }

            LeftMenuButton {
                id: logoutButton
                width: leftMenu.width
                text: "Logout"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 25
                btnIconSource: "../images/svg-images/logout-icon.svg"
                textColor: "#111111"
                overlayColor: "#111111"
                btnColorDefault: "#ededed"
                btnColorMouseOver: "#e7e7e7"
                btnColorClicked: "#f9f9f9"
                font.family: "Segoe UI"
            }

            Rectangle {
                id: rectangle
                y: 415
                width: leftMenu.width
                height: 25
                color: "#e7e7e7"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
            }

            PropertyAnimation {
                id: menuAnimation
                target: leftMenu
                property: "width"
                to: if(leftMenu.width == 70) return 200; else return 70
                duration: 700
                easing.type: Easing.InOutQuint
            }


        }

        Rectangle {
            id: bottomBar
            y: 478
            height: 25
            color: "#e7e7e7"
            anchors.left: leftMenu.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0

            Label {
                id: labelDate
                color: "#111111"
                text: "Time"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 0
                anchors.leftMargin: 10
                anchors.bottomMargin: 0
                font.family: "Segoe UI"
                font.pointSize: 9
            }
        }

        Rectangle {
            id: contents
            color: "#00000000"
            anchors.left: leftMenu.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25

            Rectangle {
                id: pageContainer
                color: "#00000000"
                anchors.fill: parent

                StackView {
                    id: stackView
                    anchors.fill: parent
                    initialItem: Qt.resolvedUrl("AppointmentPage.qml")
                }
            }
        }
    }

    Connections{
        target: backend

        function onPrintTime(time){
            labelDate.text = time
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.1;height:720;width:1280}
}
##^##*/
