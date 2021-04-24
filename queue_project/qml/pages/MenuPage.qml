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
            id: contents
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: navBar.bottom
            anchors.bottom: parent.bottom
            clip: true
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 25

            Rectangle {
                id: pageContainer
                color: "#00000000"
                anchors.fill: parent

                /*
                StackView {
                    id: stackView
                    anchors.fill: parent
                    initialItem: Qt.resolvedUrl("DashboardPage.qml")
                }
                */

                Loader{
                    id: loader
                    anchors.fill: parent
                    source: Qt.resolvedUrl("DashboardPage.qml")
                    asynchronous: true
                    visible: status == Loader.Ready
                }

                Text {
                    id: text1
                    visible: loader.status == Loader.Loading
                    text: qsTr("Loading")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: text2
                    x: 573
                    y: 284
                    visible: loader.status == Loader.Error
                    text: qsTr("Error")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 60
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        Rectangle {
            id: navBar
            x: 70
            y: 0
            width: 40
            height: 56
            color: "#f9f9f9"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0


            Rectangle {
                id: topline
                height: 1
                color: "#ededed"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 0
                anchors.rightMargin: 0
            }


            Rectangle {
                id: profile
                width: {
                    if(profileName.implicitWidth < 140){
                        profileName.implicitWidth + 83
                    } else { 175 }
                }
                color: "#00000000"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 10
                anchors.topMargin: 0
                anchors.bottomMargin: 0

                Button {
                    id: profileButton
                    height: 36
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.rightMargin: 12
                    anchors.leftMargin: 12

                    background: Rectangle{
                        color: if(profileButton.down){
                                   profileButton.down ? "#f9f9f9" : "#ededed"
                               }else{
                                   profileButton.hovered ? "#e7e7e7" : "#ededed"
                               }
                        radius: 18
                    }

                    onClicked: {
                        console.log("implicit", profileName.implicitWidth)
                        console.log("width", profile.width)
                    }

                    Image {
                        id: profileImage
                        y: 9
                        width: sourceSize.width
                        height: sourceSize.width
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        source: "../images/svg-images/profile-icon.svg"
                        anchors.leftMargin: 5
                        sourceSize.height: 28
                        sourceSize.width: 28
                        fillMode: Image.PreserveAspectFit

                        ColorOverlay{
                            source: profileImage
                            color: "#111111"
                            anchors.fill: parent
                        }
                    }

                    Text {
                        id: profileName
                        height: 20
                        color: "#111111"
                        text: "albert layasan albert"
                        elide: Text.ElideRight
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.right: parent.right
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 15
                        font.capitalization: Font.Capitalize
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 38
                    }
                }
            }

            Button{
                id: settings
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 15

                Image {
                    id: settingsIcon
                    width: 20
                    height: 20
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/svg-images/settings_icon.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 20
                    sourceSize.width: 20

                    ColorOverlay{
                        source: settingsIcon
                        anchors.fill: parent
                        color: "#111111"
                    }
                }

                background: Rectangle{
                    color: if(settings.down){
                               settings.down ? "#f9f9f9" : "#ededed"
                           }else{
                               settings.hovered ? "#e7e7e7" : "#ededed"
                           }
                    radius: 21
                    border.color: "#ededed"
                    border.width: settings.down ? 1 : 0
                }
            }

            Row {
                id: row
                x: 562
                y: 24
                height: 56
                anchors.verticalCenter: parent.verticalCenter
                spacing: 75
                anchors.horizontalCenter: parent.horizontalCenter

                Button{
                    id: dashboard
                    width: 112
                    height: 56

                    background: Rectangle{
                        id: dashBG
                        color: if(dashboard.down){
                                   dashboard.down ? "#ededed" : "#f9f9f9"
                               } else{
                                   dashboard.hovered ? "#e7e7e7" : "#f9f9f9"
                               }
                        radius: 8
                    }

                    function dashSelected(){
                        dashBG.color = "#ededed"
                        appBG.color = "#f9f9f9"
                        resBG.color = "#f9f9f9"
                        tasksBG.color = "#f9f9f9"
                        dashanibarselected.width = dashboard.width
                        dashanibar.width = 0
                        appanibarselected.width = 0
                        appanibar.width = 0
                        resanibarselected.width = 0
                        resanibar.width = 0
                        tasksanibarselected.width = 0
                        tasksanibar.width = 0
                        loader.source = Qt.resolvedUrl("DashboardPage.qml")
                        //stackView.push(Qt.resolvedUrl("DashboardPage.qml"))
                    }

                    onHoveredChanged: dashAnimation.running = true
                    onClicked: dashSelected()
                    onPressAndHold: dashBG.color = "#ededed"

                    Text{
                        id: dashText
                        text: "dashboard"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 0.3
                        font.pointSize: 10
                        font.bold: true
                        font.family: "Segoe UI"
                        font.capitalization: Font.AllUppercase
                        anchors.horizontalCenter: parent.horizontalCenter

                    }

                    Rectangle{
                        id: dashanibar
                        width: 0
                        height: 3
                        color: "#98a6ff"
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        z: 0
                    }

                    Rectangle{
                        id: dashanibarselected
                        width: parent.width
                        height: 3
                        color: "#98a6ff"
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        z: 1
                    }

                    PropertyAnimation{
                        id: dashAnimation
                        target: dashanibar
                        property: "width"
                        easing.type: Easing.InOutSine
                        duration: 40
                        to: dashanibar.width == 0 ? dashboard.width : 0
                    }
                }

                Button{
                    id: appointments
                    width: 112
                    height: 56
                    background: Rectangle{
                        id: appBG
                        color: if(appointments.down){
                                   appointments.down ? "#ededed" : "#f9f9f9"
                               } else{
                                   appointments.hovered ? "#e7e7e7" : "#f9f9f9"
                               }
                        radius: 8
                    }

                    function appSelected(){
                        dashBG.color = "#f9f9f9"
                        appBG.color = "#ededed"
                        resBG.color = "#f9f9f9"
                        tasksBG.color = "#f9f9f9"
                        dashanibarselected.width = 0
                        dashanibar.width = 0
                        appanibarselected.width = appointments.width
                        appanibar.width = 0
                        resanibarselected.width = 0
                        resanibar.width = 0
                        tasksanibarselected.width = 0
                        tasksanibar.width = 0
                        loader.source = Qt.resolvedUrl("AppointmentPage.qml")
                        //stackView.push(Qt.resolvedUrl("AppointmentPage.qml"))
                    }

                    onHoveredChanged: appntAnimation.running = true
                    onClicked: appSelected()

                    Rectangle{
                        id: appanibar
                        height: 3
                        color: "#98a6ff"
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        z: 0
                    }

                    Rectangle{
                        id: appanibarselected
                        height: 3
                        color: "#98a6ff"
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        z: 1
                    }

                    Text {
                        id: homeText
                        text: "appointments"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 0.3
                        font.capitalization: Font.AllUppercase
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Segoe UI"
                        font.pointSize: 10
                        font.bold: true
                    }

                    PropertyAnimation{
                        id: appntAnimation
                        target: appanibar
                        property: "width"
                        easing.type: Easing.InOutSine
                        duration: 40
                        to: appanibar.width == 0 ? appointments.width : 0
                    }
                }

                Button{
                    id: reservations
                    width: 112
                    height: 56
                    background: Rectangle{
                        id: resBG
                        color: if(reservations.down){
                                   reservations.down ? "#ededed" : "#f9f9f9"
                               } else{
                                   reservations.hovered ? "#e7e7e7" : "#f9f9f9"
                               }
                        radius: 8
                    }

                    function resSelected(){
                        dashBG.color = "#f9f9f9"
                        appBG.color = "#f9f9f9"
                        resBG.color = "#ededed"
                        tasksBG.color = "#f9f9f9"
                        dashanibarselected.width = 0
                        dashanibar.width = 0
                        appanibarselected.width = 0
                        appanibar.width = 0
                        resanibarselected.width = reservations.width
                        resanibar.width = 0
                        tasksanibarselected.width = 0
                        tasksanibar.width = 0
                        loader.source = Qt.resolvedUrl("ReservationPage.qml")
                        //stackView.push(Qt.resolvedUrl("ReservationPage.qml"))
                    }

                    onHoveredChanged: resAnimation.running = true
                    onClicked: resSelected()

                    Rectangle{
                        id: resanibar
                        height: 3
                        color: "#98a6ff"
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        z: 0
                    }

                    Rectangle{
                        id: resanibarselected
                        height: 3
                        color: "#98a6ff"
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        z: 1
                    }

                    Text {
                        id: resText
                        text: "reservations"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 0.3
                        font.capitalization: Font.AllUppercase
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Segoe UI"
                        font.pointSize: 10
                        font.bold: true
                    }

                    PropertyAnimation{
                        id: resAnimation
                        target: resanibar
                        property: "width"
                        easing.type: Easing.InOutSine
                        duration: 40
                        to: resanibar.width == 0 ? reservations.width : 0
                    }
                }

                Button{
                    id: tasks
                    width: 112
                    height: 56
                    background: Rectangle{
                        id: tasksBG
                        color: if(tasks.down){
                                   tasks.down ? "#ededed" : "#f9f9f9"
                               } else{
                                   tasks.hovered ? "#e7e7e7" : "#f9f9f9"
                               }
                        radius: 8
                    }

                    function tasksSelected(){
                        dashBG.color = "#f9f9f9"
                        appBG.color = "#f9f9f9"
                        resBG.color = "#f9f9f9"
                        tasksBG.color = "#ededed"
                        dashanibarselected.width = 0
                        dashanibar.width = 0
                        appanibarselected.width = 0
                        appanibar.width = 0
                        resanibarselected.width = 0
                        resanibar.width = 0
                        tasksanibarselected.width = tasks.width
                        tasksanibar.width = 0
                        loader.source = Qt.resolvedUrl("TaskPage.qml")
                        //stackView.push(Qt.resolvedUrl("TaskPage.qml"))
                    }

                    onHoveredChanged: tasksAnimation.running = true
                    onClicked: tasksSelected()

                    Rectangle{
                        id: tasksanibar
                        height: 3
                        color: "#98a6ff"
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        z: 0
                    }

                    Rectangle{
                        id: tasksanibarselected
                        height: 3
                        color: "#98a6ff"
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        z: 1
                    }

                    Text {
                        id: tasksText
                        text: "tasks"
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 0.3
                        font.capitalization: Font.AllUppercase
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Segoe UI"
                        font.pointSize: 10
                        font.bold: true
                    }

                    PropertyAnimation{
                        id: tasksAnimation
                        target: tasksanibar
                        property: "width"
                        easing.type: Easing.InOutSine
                        duration: 40
                        to: tasksanibar.width == 0 ? tasks.width : 0
                    }
                }
            }
        }

        /*
        Rectangle {
            id: leftMenu
            width: 70
            color: "#f9f9f9"
            anchors.left: parent.left
            anchors.top: navBar.bottom
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
                easing.type: Easing.InOutSine


            }


        }
*/

        Rectangle {
            id: bottomBar
            y: 695
            height: 25
            color: "#e7e7e7"
            anchors.left: parent.left
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

    }

    Connections{
        target: backend

        function onPrintTime(time){
            labelDate.text = time
        }

        function onProfileButtonSize(size){
            profile.textWidth = size
        }
    }

    /*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:9;invisible:true}
D{i:44}
}
##^##*/
}
