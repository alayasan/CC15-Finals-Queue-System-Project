import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent

        TapHandler{
            onTapped: forceActiveFocus()
        }

        Rectangle {
            id: rectangle
            x: 446
            y: 235
            width: 500
            height: 500
            color: "#b9b0b0"
            radius: 20
            anchors.verticalCenter: parent.verticalCenter
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
                anchors.bottomMargin: 15
                placeholderText: "NAME"
                anchors.horizontalCenter: parent.horizontalCenter
                readOnly: true

                Popup{
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
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: lntxt.bottom
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
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: fntxt.bottom
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
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: mitxt.bottom
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

                Popup{
                    id: coursepop
                    visible: parent.focus ? true : false
                    width: parent.width / 2
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
                                anchors.fill: parent
                                onClicked: {
                                    coursefield.text = dlgtText.text
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
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    backend.registerUser(userfield.text, passfield.text)
                }
            }
        }
    }

    Connections{
        target: backend


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:2;height:720;width:1280}
}
##^##*/
