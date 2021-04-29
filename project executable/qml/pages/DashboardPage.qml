import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import "../components"

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        TapHandler{
            onTapped: forceActiveFocus()
        }

        Timer{
            repeat: true
            running: true
            interval: 300
            onTriggered: {
                if(appteacherdropdown.index < appteacherdropdown.rowcount){
                    backend.fetchFacultyDetails(appteacherdropdown.index)
                    appTeacherDropdownList.append({name : appteacherdropdown.facname})
                    appteacherdropdown.index += 1
                 } else {
                    running = false
                    repeat = false
                    backend.fetchUserDetails()
                }

            }
        }

        Rectangle {
            id: overviewbox
            color: "#98a6ff"
            radius: 8
            anchors.left: profilebox.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: reservationbox.top
            anchors.leftMargin: 15
            anchors.rightMargin: 25
            anchors.bottomMargin: 15
            anchors.topMargin: 25

            Rectangle {
                id: rectangle
                color: "#f9f9f9"
                radius: 8
                border.color: "#98a6ff"
                anchors.fill: parent
                anchors.bottomMargin: -2
                anchors.topMargin: 5

                Text {
                    id: text17
                    x: 15
                    y: 10
                    text: qsTr("Overview")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 17
                    font.bold: true
                    font.family: "Segoe UI"
                    anchors.leftMargin: 15
                    anchors.topMargin: 15
                }

                ListView {
                    id: overviewList
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: text17.bottom
                    anchors.bottom: parent.bottom
                    spacing: 20
                    clip: true
                    anchors.rightMargin: 15
                    anchors.leftMargin: 15
                    anchors.bottomMargin: 15
                    anchors.topMargin: 15
                    ScrollBar.vertical: ScrollBar{
                        id: overviewScrollBar
                        hoverEnabled: true
                        active: hovered || pressed
                        contentItem: Rectangle{
                            implicitWidth: 6
                            implicitHeight: 100
                            radius: width / 2
                            color: overviewScrollBar.pressed ? "#c9d5ff" : "#a5b1ff"
                        }
                    }

                    delegate: overviewTableDelegate
                    model: 15

                    Component{
                        id: overviewTableDelegate
                        Rectangle {
                            id: dlgtBG
                            width: overviewList.width
                            height: dlgtFaculty.height
                            color: "#00000000"
                            radius: 8

                            Text {
                                id: dlgtFaculty
                                height: implicitHeight
                                color: "#111111"
                                text: qsTr("Jun Rangie Obispo")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.right: toolSeparator1.left
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                wrapMode: Text.Wrap
                                anchors.leftMargin: 5
                                anchors.rightMargin: 5
                                font.family: "Segoe UI"
                                font.capitalization: Font.Capitalize
                            }

                            ToolSeparator {
                                id: toolSeparator1
                                x: 171
                                visible: false
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottomMargin: 0
                                anchors.topMargin: 0
                            }

                            Text {
                                id: dlgtFacultyStatus
                                color: "#111111"
                                text: qsTr("In")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: toolSeparator1.right
                                anchors.right: parent.right
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                font.family: "Segoe UI"
                                anchors.rightMargin: 5
                                leftPadding: 8
                                anchors.leftMargin: 5
                                font.capitalization: Font.Capitalize
                            }

                            Rectangle{
                                height: 1
                                color: "#98a6ff"
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.rightMargin: 0
                                anchors.leftMargin: 0
                                anchors.bottomMargin: -5
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: profilebox
            width: 400
            height: 156
            color: "#98a6ff"
            radius: 8
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.leftMargin: 25

            Rectangle {
                id: pbaccent
                color: "#f9f9f9"
                radius: 8
                border.color: "#98a6ff"
                anchors.fill: parent
                anchors.bottomMargin: -2
                anchors.topMargin: 5

                Text {
                    id: nametxt
                    x: 15
                    color: "#111111"
                    text: ""
                    anchors.left: text1.right
                    anchors.right: parent.right
                    anchors.top: text5.bottom
                    font.pixelSize: 15
                    wrapMode: Text.Wrap
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    anchors.rightMargin: 0
                    font.capitalization: Font.Capitalize
                    font.family: "Segoe UI Historic"
                }

                Text {
                    id: course
                    color: "#111111"
                    text: ""
                    anchors.left: text3.right
                    anchors.top: nametxt.bottom
                    font.pixelSize: 15
                    anchors.leftMargin: 10
                    anchors.topMargin: 15
                    font.capitalization: Font.MixedCase
                    font.family: "Segoe UI Historic"
                }

                Text {
                    id: idnum
                    text: ""
                    anchors.left: text4.right
                    anchors.top: course.bottom
                    font.pixelSize: 15
                    anchors.leftMargin: 15
                    anchors.topMargin: 15
                    font.capitalization: Font.Capitalize
                    font.family: "Segoe UI"
                }

                Text {
                    id: text1
                    x: 30
                    y: 30
                    text: qsTr("Name:")
                    anchors.left: parent.left
                    anchors.top: text5.bottom
                    font.pixelSize: 15
                    font.bold: true
                    font.family: "Segoe UI"
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                }

                Text {
                    id: text3
                    x: 30
                    y: 31
                    text: qsTr("Course & Year:")
                    anchors.left: parent.left
                    anchors.top: nametxt.bottom
                    font.pixelSize: 15
                    anchors.leftMargin: 25
                    font.family: "Segoe UI"
                    font.bold: true
                    anchors.topMargin: 15
                }

                Text {
                    id: text4
                    x: 25
                    y: 32
                    text: qsTr("ID:")
                    anchors.left: parent.left
                    anchors.top: text3.bottom
                    font.pixelSize: 15
                    anchors.leftMargin: 25
                    font.family: "Segoe UI"
                    font.bold: true
                    anchors.topMargin: 15
                }

                Text {
                    id: text5
                    text: qsTr("User Profile")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 17
                    anchors.topMargin: 15
                    anchors.leftMargin: 15
                    font.bold: true
                    font.family: "Segoe UI"
                }
            }
        }

        Rectangle {
            id: appointmentbox
            width: profilebox.width
            height: 221
            color: "#98a6ff"
            radius: 8
            anchors.left: parent.left
            anchors.top: profilebox.bottom
            anchors.topMargin: 15
            anchors.leftMargin: 25

            Rectangle {
                id: appaccent
                color: "#f9f9f9"
                radius: 8
                border.color: "#98a6ff"
                anchors.fill: parent
                anchors.bottomMargin: -2
                anchors.topMargin: 5

                Text {
                    id: text6
                    text: qsTr("Appointments")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 17
                    anchors.leftMargin: 15
                    font.family: "Segoe UI"
                    font.bold: true
                    anchors.topMargin: 15
                }

                CustomButton{
                    id: setButton
                    width: 125
                    height: 35
                    text: "Set Appointment"
                    anchors.verticalCenter: text6.verticalCenter
                    anchors.right: parent.right
                    colorMouseOver: "#8291ea"
                    colorPressed: "#95a3fe"
                    textColor: "#ffffff"
                    colorDefault: "#98a6ff"
                    font.bold: false
                    font.family: "Segoe UI"
                    bgRadius: 8
                    anchors.rightMargin: 15

                }

                Rectangle {
                    id: appteacherbox
                    height: appteacherdropdown.height
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: text6.bottom
                    anchors.topMargin: 15
                    anchors.rightMargin: 15
                    anchors.leftMargin: 25

                    Text {
                        id: text7
                        x: 30
                        y: 31
                        text: qsTr("Teacher:")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 15
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 0
                    }

                    CustomDropdown{
                        id: appteacherdropdown
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        unselectText: "Teacher"
                        model: appTeacherDropdownList

                        // properties used for populating dropdown
                        property var rowcount: 1
                        property int index: 0
                        property var facname

                        ListModel{
                            id: appTeacherDropdownList
                            ListElement{
                                name: "Teacher"
                            }
                        }
                    }
                }

                Rectangle {
                    id: apptimebox
                    height: appteacherbox.height
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: appteacherbox.bottom
                    anchors.rightMargin: 15
                    Text {
                        id: text9
                        x: 30
                        y: 31
                        text: qsTr("Time:")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 15
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 0
                    }

                    CustomDropdown {
                        height: appteacherdropdown.height
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                }

                Rectangle {
                    id: appdatebox
                    height: appteacherbox.height
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: apptimebox.bottom
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    anchors.rightMargin: 15
                    Text {
                        id: text8
                        x: 30
                        y: 31
                        text: qsTr("Date:")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 15
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 0
                    }

                    CustomTextField {
                        id: appTeacherTxtField
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        placeholderText: "MM-DD-YYYY"
                        anchors.rightMargin: 0
                        anchors.leftMargin: 25
                        anchors.topMargin: 10

                        // properties
                        property var selDate
                        width: 200
                        height: 30

                        Popup{
                            visible: appTeacherTxtField.focus ? true : false
                            y: appTeacherTxtField.height - 1
                            width: appTeacherTxtField.width
                            height: contentItem.implicitHeight
                            padding: 1

                            contentItem: DatePicker{
                                implicitHeight: 160
                                Component.onCompleted: set(new Date())
                                onClicked: {
                                    appTeacherTxtField.text = Qt.formatDate(date, 'MM-dd-yyyy')
                                    appTeacherTxtField.selDate = Qt.formatDate(date, 'yyyy-MM-dd')
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    id: apppurposebox
                    x: 15
                    y: -5
                    height: 30
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: appdatebox.bottom
                    anchors.rightMargin: 15
                    Text {
                        id: text10
                        x: 30
                        y: 31
                        text: qsTr("Purpose:")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 15
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 0
                    }
                    anchors.leftMargin: 25
                    anchors.topMargin: 10

                    CustomTextField{
                        width: 200
                        height: 30
                        anchors.right: parent.right
                        placeholderText: "---"
                        anchors.rightMargin: 0
                    }
                }
            }
        }

        Rectangle {
            id: teachersbox
            width: profilebox.width
            color: "#98a6ff"
            radius: 8
            anchors.left: parent.left
            anchors.top: appointmentbox.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 15
            anchors.bottomMargin: 25
            anchors.leftMargin: 25

            Rectangle {
                id: rectangle2
                color: "#f9f9f9"
                radius: 8
                border.color: "#98a6ff"
                anchors.fill: parent
                anchors.bottomMargin: -2
                anchors.topMargin: 5

                Text {
                    id: text11
                    text: qsTr("Available Teachers")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 17
                    font.bold: true
                    font.family: "Segoe UI"
                    anchors.leftMargin: 15
                    anchors.topMargin: 15
                }

                Rectangle {
                    id: rectangle3
                    color: "#98a6ff"
                    radius: 8
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: text11.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 10
                    anchors.bottomMargin: 15
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15

                    Rectangle {
                        id: rectangle4
                        color: "#f9f9f9"
                        radius: 8
                        border.color: "#98a6ff"
                        anchors.fill: parent
                        anchors.bottomMargin: -2
                        anchors.topMargin: 5

                        Rectangle {
                            id: rectangle5
                            height: 30
                            color: "#00000000"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.topMargin: 0
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0

                            Text {
                                id: course1
                                color: "#111111"
                                text: qsTr("Faculty")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.right: toolSeparator.left
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                anchors.rightMargin: 5
                                anchors.leftMargin: 5
                                font.family: "Segoe UI Historic"
                                font.capitalization: Font.Capitalize
                            }

                            Text {
                                id: course2
                                color: "#111111"
                                text: qsTr("Status")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: toolSeparator.right
                                anchors.right: parent.right
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                anchors.rightMargin: 5
                                font.family: "Segoe UI Historic"
                                anchors.leftMargin: 5
                                font.capitalization: Font.Capitalize
                            }

                            ToolSeparator {
                                id: toolSeparator
                                x: 171
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: 0
                                anchors.bottomMargin: 0
                            }
                        }

                        ListView {
                            id: teacherListView
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: rectangle5.bottom
                            anchors.bottom: parent.bottom
                            spacing: 15
                            clip: true
                            anchors.bottomMargin: 5
                            anchors.rightMargin: 5
                            anchors.leftMargin: 5
                            anchors.topMargin: 5
                            ScrollBar.vertical: ScrollBar{
                                id: teachersScrollBar
                                hoverEnabled: true
                                active: hovered || pressed
                                contentItem: Rectangle{
                                    implicitWidth: 6
                                    implicitHeight: 100
                                    radius: width / 2
                                    color: teachersScrollBar.pressed ? "#c9d5ff" : "#a5b1ff"
                                }
                            }

                            delegate: facultyTableDelegate
                            model: 9

                            Component{
                                id: facultyTableDelegate
                                Rectangle {
                                    id: dlgtBG
                                    width: teacherListView.width
                                    height: dlgtFaculty.height
                                    color: "#00000000"
                                    radius: 8

                                    Text {
                                        id: dlgtFaculty
                                        height: implicitHeight
                                        color: "#111111"
                                        text: qsTr("Jun Rangie Obispo")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.right: toolSeparator1.left
                                        font.pixelSize: 15
                                        horizontalAlignment: Text.AlignHCenter
                                        wrapMode: Text.Wrap
                                        anchors.leftMargin: 5
                                        anchors.rightMargin: 5
                                        font.family: "Segoe UI"
                                        font.capitalization: Font.Capitalize
                                    }

                                    ToolSeparator {
                                        id: toolSeparator1
                                        x: 171
                                        visible: false
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.bottomMargin: 0
                                        anchors.topMargin: 0
                                    }

                                    Text {
                                        id: dlgtFacultyStatus
                                        color: "#111111"
                                        text: qsTr("In")
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: toolSeparator1.right
                                        anchors.right: parent.right
                                        font.pixelSize: 15
                                        horizontalAlignment: Text.AlignHCenter
                                        font.family: "Segoe UI"
                                        anchors.rightMargin: 5
                                        leftPadding: 8
                                        anchors.leftMargin: 5
                                        font.capitalization: Font.Capitalize
                                    }

                                    Rectangle{
                                        height: 1
                                        color: "#98a6ff"
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.bottom: parent.bottom
                                        anchors.rightMargin: 0
                                        anchors.leftMargin: 0
                                        anchors.bottomMargin: -5
                                    }
                                }
                            }
                        }
                    }
                }

                CustomButton {
                    id: setButton1
                    width: 32
                    height: 32
                    text: ""
                    anchors.verticalCenter: text11.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    borderColor: "#111111"
                    borderWidth: down ? 1 : 0
                    colorDefault: "#ededed"
                    colorPressed: "#f9f9f9"
                    colorMouseOver: "#e7e7e7"
                    textColor: "#ffffff"
                    font.bold: false
                    font.family: "Segoe UI"
                    bgRadius: 18

                    Image {
                        id: teacherSortIcon
                        x: 88
                        y: 46
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../images/svg-images/sort-icon.svg"
                        asynchronous: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        sourceSize.height: 15
                        sourceSize.width: 15
                        fillMode: Image.PreserveAspectFit

                        ColorOverlay{
                            color: "#111111"
                            anchors.fill: parent
                            source: teacherSortIcon
                        }
                    }
                }
            }
        }

        Rectangle {
            id: reservationbox
            y: 457
            width: 400
            height: 238
            color: "#98a6ff"
            radius: 8
            anchors.left: teachersbox.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 15
            anchors.bottomMargin: 25

            Rectangle {
                id: rectangle6
                color: "#f9f9f9"
                radius: 8
                border.color: "#98a6ff"
                anchors.fill: parent
                anchors.bottomMargin: -2
                anchors.topMargin: 5

                Text {
                    id: text12
                    text: qsTr("Reserve A Room")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 17
                    font.bold: true
                    font.family: "Segoe UI"
                    anchors.leftMargin: 15
                    anchors.topMargin: 15
                }

                Rectangle {
                    id: apptimebox1
                    x: 25
                    y: -5
                    height: appteacherbox.height
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: text12.bottom
                    anchors.rightMargin: 15
                    anchors.leftMargin: 25
                    anchors.topMargin: 15

                    Text {
                        id: text13
                        x: 30
                        y: 31
                        text: qsTr("Room:")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 15
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 0
                    }

                    CustomDropdown {
                        height: appteacherdropdown.height
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }
                }

                Rectangle {
                    id: apptimebox2
                    x: 25
                    y: -10
                    height: appteacherbox.height
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: apptimebox1.bottom
                    anchors.rightMargin: 15
                    anchors.leftMargin: 25
                    anchors.topMargin: 15

                    Text {
                        id: text14
                        x: 30
                        y: 31
                        text: qsTr("From:")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 15
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 0
                    }

                    CustomDropdown {
                        height: appteacherdropdown.height
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }
                }

                Rectangle {
                    id: apptimebox3
                    x: 25
                    y: -15
                    height: appteacherbox.height
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: apptimebox2.bottom
                    anchors.rightMargin: 15
                    anchors.leftMargin: 25
                    anchors.topMargin: 15

                    Text {
                        id: text15
                        x: 30
                        y: 31
                        text: qsTr("To:")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 15
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 0
                    }

                    CustomDropdown {
                        height: appteacherdropdown.height
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }
                }

                Rectangle {
                    id: apppurposebox1
                    x: 15
                    height: 30
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: apptimebox3.bottom
                    anchors.rightMargin: 15
                    anchors.leftMargin: 25
                    anchors.topMargin: 15

                    Text {
                        id: text16
                        x: 30
                        y: 31
                        text: qsTr("Purpose:")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 15
                        font.bold: true
                        font.family: "Segoe UI"
                        anchors.leftMargin: 0
                    }

                    CustomTextField {
                        width: 200
                        height: 30
                        anchors.right: parent.right
                        placeholderText: "---"
                        anchors.rightMargin: 0
                    }
                }

                CustomButton {
                    id: setButton2
                    width: 125
                    height: 35
                    text: "Reserve"
                    anchors.verticalCenter: text12.verticalCenter
                    anchors.right: parent.right
                    colorPressed: "#95a3fe"
                    colorMouseOver: "#8291ea"
                    textColor: "#ffffff"
                    colorDefault: "#98a6ff"
                    font.bold: false
                    font.family: "Segoe UI"
                    anchors.rightMargin: 15
                    bgRadius: 8
                }
            }
        }

        Rectangle {
            id: tasksbox
            y: 495
            height: reservationbox.height
            color: "#98a6ff"
            radius: 8
            anchors.left: reservationbox.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 15
            anchors.rightMargin: 25
            anchors.bottomMargin: 25

            Rectangle {
                id: rectangle7
                color: "#f9f9f9"
                radius: 8
                border.color: "#98a6ff"
                anchors.fill: parent
                anchors.bottomMargin: -2
                anchors.topMargin: 5

                Text {
                    id: text18
                    x: 15
                    y: 10
                    text: qsTr("Tasks")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 17
                    font.bold: true
                    font.family: "Segoe UI"
                    anchors.leftMargin: 15
                    anchors.topMargin: 15
                }

                ListView {
                    id: taskList
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: text18.bottom
                    anchors.bottom: parent.bottom
                    spacing: 15
                    anchors.rightMargin: 15
                    anchors.leftMargin: 15
                    anchors.bottomMargin: 15
                    anchors.topMargin: 18
                    ScrollBar.vertical: ScrollBar{
                        id: tasksScrollBar
                        hoverEnabled: true
                        active: hovered || pressed
                        contentItem: Rectangle{
                            implicitWidth: 6
                            implicitHeight: 100
                            radius: width / 2
                            color: tasksScrollBar.pressed ? "#c9d5ff" : "#a5b1ff"
                        }
                    }

                    delegate: taskTableDelegate
                    model: 6

                    Component{
                        id: taskTableDelegate
                        Rectangle {
                            id: dlgtBG
                            width: taskList.width
                            height: dlgtFaculty.height
                            color: "#00000000"
                            radius: 8

                            Text {
                                id: dlgtFaculty
                                height: implicitHeight
                                color: "#111111"
                                text: qsTr("Jun Rangie Obispo")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.right: toolSeparator1.left
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                wrapMode: Text.Wrap
                                anchors.leftMargin: 5
                                anchors.rightMargin: 5
                                font.family: "Segoe UI"
                                font.capitalization: Font.Capitalize
                            }

                            ToolSeparator {
                                id: toolSeparator1
                                x: 171
                                visible: false
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottomMargin: 0
                                anchors.topMargin: 0
                            }

                            Text {
                                id: dlgtFacultyStatus
                                color: "#111111"
                                text: qsTr("In")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: toolSeparator1.right
                                anchors.right: parent.right
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                font.family: "Segoe UI"
                                anchors.rightMargin: 5
                                leftPadding: 8
                                anchors.leftMargin: 5
                                font.capitalization: Font.Capitalize
                            }

                            Rectangle{
                                height: 1
                                color: "#98a6ff"
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.rightMargin: 0
                                anchors.leftMargin: 0
                                anchors.bottomMargin: -5
                            }
                        }
                    }
                }
            }
        }
    }

    Connections{
        target: backend

        function onPullUserDetails(name_user, course_user, uid){
            nametxt.text = name_user
            course.text = course_user
            idnum.text = uid
        }

        function onFacultyRowCount(rowcount){
            appteacherdropdown.rowcount = rowcount
        }

        function onFacultyNameList(name){
            appteacherdropdown.facname = name
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:16}D{i:27}D{i:26}
D{i:47}D{i:48}D{i:46}D{i:68}D{i:67}
}
##^##*/
