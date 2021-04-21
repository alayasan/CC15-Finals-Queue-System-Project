import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"

Item {

    function miClipper(str){
        return str.substring(0, 1) + "."
    }

    //properties
    property var course: ""
    property var year: ""

    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        TapHandler{
            onTapped: forceActiveFocus()
        }

        CustomTableView{
            id: table
            x: 555
            width: 700
            height: 484
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 25
            anchors.topMargin: 100
        }

        /*
        Rectangle {
            id: rectangle
            x: 446
            y: 235
            width: 437
            height: 352
            color: "#3a53a4"
            radius: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -86
            anchors.horizontalCenterOffset: 414
            anchors.horizontalCenter: parent.horizontalCenter

            CustomTextField{
                id: userfield
                x: 44
                y: 105
                anchors.bottom: namefield.top
                anchors.bottomMargin: 15
                placeholderText: "USERNAME"
                anchors.horizontalCenter: parent.horizontalCenter

            }

            CustomTextField {
                id: namefield
                x: 35
                y: 100
                anchors.bottom: coursefield.top
                font.capitalization: Font.Capitalize
                anchors.bottomMargin: 15
                placeholderText: "NAME"
                anchors.horizontalCenter: parent.horizontalCenter
                readOnly: true
                text: {
                    if(lnfield.text !== "" && fnfield.text !== "" && mifield.text !== ""){
                        lnfield.text + ", " + fnfield.text + " " + miClip
                    } else if(lnfield.text !== "" && fnfield.text !== ""){
                        lnfield.text + ", " + fnfield.text + " "
                    } else {
                        ""
                    }
                }

                // properties
                property var miClip: miClipper(mifield.text)

                Popup{
                    id: namepop
                    visible: parent.focus ? true : false
                    padding: 1
                    width: parent.width
                    height: contentItem.implicitHeight
                    x: parent.width + 5
                    y: 1 - parent.height

                    contentItem: Rectangle{
                        implicitHeight: lnbox.height + fnbox.height + mibox.height
                        Rectangle{
                            id: lnbox
                            width: parent.width
                            height: 50 + lntxt.implicitHeight
                            color: "#00000000"

                            Text{
                                id: lntxt
                                text: "Last Name"
                                anchors.left: parent.left
                                anchors.top: parent.top
                                font.bold: true
                                font.family: "Segoe UI"
                                anchors.leftMargin: 10
                                anchors.topMargin: 3
                            }

                            CustomTextField{
                                id: lnfield
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: lntxt.bottom
                                font.capitalization: Font.Capitalize
                                anchors.rightMargin: 2
                                anchors.topMargin: 3
                                anchors.leftMargin: 2
                            }
                        }
                        Rectangle{
                            id: fnbox
                            anchors.top: lnbox.bottom
                            width: parent.width
                            height: 50 + fntxt.implicitHeight
                            color: "#00000000"

                            Text{
                                id: fntxt
                                text: "First Name"
                                anchors.left: parent.left
                                anchors.top: parent.top
                                font.bold: true
                                font.family: "Segoe UI"
                                anchors.leftMargin: 10
                                anchors.topMargin: 3
                            }

                            CustomTextField{
                                id: fnfield
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: fntxt.bottom
                                font.capitalization: Font.Capitalize
                                anchors.rightMargin: 2
                                anchors.topMargin: 3
                                anchors.leftMargin: 2
                            }
                        }
                        Rectangle{
                            id: mibox
                            anchors.top: fnbox.bottom
                            width: parent.width
                            height: 50 + mitxt.implicitHeight
                            color: "#00000000"

                            Text{
                                id: mitxt
                                text: "Middle Name"
                                anchors.left: parent.left
                                anchors.top: parent.top
                                font.bold: true
                                font.family: "Segoe UI"
                                anchors.leftMargin: 10
                                anchors.topMargin: 3
                            }

                            CustomTextField{
                                id: mifield
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: mitxt.bottom
                                font.capitalization: Font.Capitalize
                                anchors.rightMargin: 2
                                anchors.topMargin: 3
                                anchors.leftMargin: 2
                                
                            }
                        }
                    }
                }
            }

            CustomTextField {
                id: coursefield
                x: 39
                y: 107
                anchors.verticalCenter: parent.verticalCenter
                placeholderText: "COURSE & YEAR"
                anchors.horizontalCenter: parent.horizontalCenter
                readOnly: true
                text: {
                    if(year == ""){
                        course
                    } else if(course !== "" && year !== ""){
                        course + " - " + year
                    }
                }
                
                Popup{
                    id: yearpop
                    width: 75
                    height: contentItem.implicitHeight
                    y: 1 - parent.height
                    x: coursepop.width + parent.width + 1
                    padding: 1

                    contentItem: ListView{
                        clip: true
                        boundsBehavior: Flickable.StopAtBounds
                        implicitHeight: 120
                        ScrollIndicator.vertical: ScrollIndicator { }

                        model: [ qsTr("1"), qsTr("2"), qsTr("3"), qsTr("4") ]

                        delegate: RadioDelegate{
                            id: control
                            height: 40
                            text: modelData
                            hoverEnabled: true
                            font.family: "Segoe UI"
                            checked: index == 0

                            contentItem: Text{
                                id: radtxt
                                leftPadding: control.indicator.width * 0.7
                                text: control.text
                                elide: Text.ElideRight
                                anchors.left: rectangle2.left
                                anchors.leftMargin: 15
                                verticalAlignment: Text.AlignVCenter
                                opacity: enabled ? 1 : 0.3
                                color: control.down ? "#607D8B" : "#212121"
                            }

                            indicator: Rectangle{
                                id: rectangle2
                                implicitHeight: 16
                                implicitWidth: 16
                                color: "#00000000"
                                radius: 9
                                border.color: control.down ? "#3D5AFE" : "#64B5F6"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: control.left
                                anchors.leftMargin: 10

                                Rectangle{
                                    width: 8
                                    height: 8
                                    radius: 5
                                    anchors.verticalCenter: rectangle2.verticalCenter
                                    anchors.horizontalCenter: rectangle2.horizontalCenter
                                    visible: control.checked
                                    color: control.down ? "#3D5AFE" : "#64B5F6"
                                }
                            }

                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                visible: control.down || control.highlighted || control.hovered
                                color: control.down || control.hovered ? "#bdbebf" : "#eeeeee"
                            }

                            onClicked:{
                                year = radtxt.text
                            }
                        }
                    }
                }

                Popup{
                    id: coursepop
                    visible: parent.focus ? true : false
                    width: parent.width * 0.65
                    height: contentItem.implicitHeight
                    y: 1 - parent.height
                    x: parent.width + 5
                    padding: 1

                    contentItem: ListView{
                        clip: true
                        boundsBehavior: Flickable.StopAtBounds
                        implicitHeight: 120
                        ScrollIndicator.vertical: ScrollIndicator { }

                        model: [
                            qsTr("BS in Computer Science"),
                            qsTr("BS in Information Technology"),
                            qsTr("BS in Information Systems")
                        ]

                        delegate: Rectangle{
                            id: rectangle1
                            height: 40
                            width: coursepop.width

                            Text{
                                id: dlgtText
                                text: modelData
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 5
                                font.family: "Segoe UI"
                            }

                            MouseArea{
                                id: mouseArea
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    course = dlgtText.text
                                    yearpop.visible = true
                                }
                            }
                        }
                    }
                }
            }

            CustomTextField {
                id: passfield
                x: 44
                y: 160
                anchors.top: coursefield.bottom
                placeholderText: "PASSWORD"
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                echoMode: TextInput.Password
            }

            CustomTextField {
                id: confirmpassfield
                x: 35
                y: 167
                anchors.top: passfield.bottom
                placeholderText: "CONFIRM PASSWORD"
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                echoMode: TextInput.Password
            }

            CustomButton{
                x: 44
                y: 215
                width: passfield.width
                height: passfield.height
                text: "REGISTER"
                anchors.top: confirmpassfield.bottom
                font.family: "Segoe UI"
                font.bold: true
                colorDefault: "#98a6ff"
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    if(passfield.text == confirmpassfield.text){
                        backend.registerUser(userfield.text, passfield.text, namefield.text,
                                             course, parseInt(year))
                    } else{
                        userfield.text = "unsuccessful"
                    }
                }
            }
        }
        */

        Connections{
            target: backend

            function onAccountCreated(boolVal){
                
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:3}
}
##^##*/

