import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"

Item {
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent


        Image {
            id: image
            anchors.fill: parent
            source: "../images/logos/freestocks-I_pOqP6kCOI-unsplash.jpg"
            anchors.leftMargin: 400
            fillMode: Image.PreserveAspectCrop

            Rectangle {
                id: rectangle
                opacity: 0.3
                color: "#f9f9f9"
                anchors.fill: parent
            }
        }


        Rectangle {
            id: loginFields
            width: 400
            color: "#f9f9f9"
            border.color: "#00000000"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: false
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Rectangle {
                id: logoBar
                x: 100
                y: 50
                width: 311
                height: 135
                color: "#00000000"
                anchors.horizontalCenter: parent.horizontalCenter


                Row {
                    id: rowLogo
                    anchors.fill: parent

                    Image {
                        id: xuLogo
                        width: xuLogo.height
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/logos/xu logo.png"
                        anchors.leftMargin: 15
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: ccsLogo
                        width: ccsLogo.height
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/logos/CCS logo.png"
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.rightMargin: 15
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Label {
                id: signInText
                x: 237
                color: "#111111"
                text: qsTr("Sign In")
                anchors.top: logoBar.bottom
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 25
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20
                font.bold: true
                font.family: "Segoe UI"
            }

            CustomTextField{
                id: userField
                width: 300
                height: 40
                anchors.top: signInText.bottom
                placeholderText: "USERNAME"
                anchors.topMargin: 25
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }


            CustomTextField {
                id: passField
                property bool isTextVisible: false
                width: 300
                height: 40
                anchors.top: userField.bottom
                anchors.topMargin: 10
                placeholderText: "PASSWORD"
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                echoMode: TextInput.Password

                Image {
                    property bool isIconVisible: false
                    property var visibleIcon: "../images/svg-images/non-visibility-icon.svg"
                    id: iconEye
                    x: 275
                    y: 12
                    width: 15
                    height: 15
                    anchors.right: parent.right
                    source: visibleIcon
                    anchors.rightMargin: 10
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 15
                    visible: isIconVisible
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: 0.5

                    ColorOverlay{
                        width: iconEye.width
                        height: iconEye.height
                        color: "#000000"
                        antialiasing: false
                        source: iconEye
                    }
                }

                MouseArea{
                    x: 275
                    y: 12
                    anchors.fill: iconEye
                    hoverEnabled: true
                    onEntered: iconEye.opacity = 0.75
                    onExited: iconEye.opacity = 0.5
                    cursorShape: parent.hovered ? Qt.PointingHandCursor : Qt.ArrowCursor
                    onClicked: {
                        if(!passField.isTextVisible){
                            passField.isTextVisible = true
                            passField.echoMode = TextInput.Normal
                            iconEye.visibleIcon = "../images/svg-images/visibility-icon.svg"
                        } else{
                            passField.isTextVisible = false
                            passField.echoMode = TextInput.Password
                            iconEye.visibleIcon = "../images/svg-images/non-visibility-icon.svg"
                        }
                    }
                }

                onFocusChanged: {
                    if(passField.focus){
                        iconEye.visible = true
                    } else{
                        iconEye.visible = false
                        if(passField.text != ""){
                            iconEye.visible = true
                        }
                    }
                }
            }

            Label {
                id: cantSignIn
                x: 60
                width: 89
                height: 19
                color: underbtn.hovered ? "#11111" : "#b2b2b2"
                text: qsTr("can't sign in?")
                anchors.top: passField.bottom
                font.letterSpacing: 0.5
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 5
                font.capitalization: Font.AllUppercase
                font.family: "Segoe UI"
                font.bold: true
                font.pointSize: 8

                Button{
                    id: underbtn
                    anchors.fill: parent
                    background: Rectangle{
                        color: "#00000000"
                    }
                }
            }

            Label {
                id: createAccnt
                x: 60
                width: 104
                height: 19
                color: underbtn1.hovered ? "#11111" : "#b2b2b2"
                text: qsTr("create account")
                anchors.top: cantSignIn.bottom
                font.letterSpacing: 0.5
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 0
                font.family: "Segoe UI"
                font.bold: true
                font.pointSize: 8
                Button {
                    id: underbtn1
                    anchors.fill: parent
                    background: Rectangle {
                        color: "#00000000"
                    }
                }
                font.capitalization: Font.AllUppercase
            }

            CustomButton{
                id: loginButton
                x: 143
                width: 70
                height: 70
                text: ""
                anchors.top: passField.bottom
                colorPressed: loginButton.colorMouseOver
                anchors.topMargin: 100
                colorMouseOver: "#3a53a4"
                colorDefault: loginButton.enabled ? "#d13639" : "#f9f9f9"
                enabled: if(userField.text != "" && passField.text != ""){
                             true
                         } else{
                             false
                         }
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                bgRadius: 20
                borderWidth: loginButton.enabled ? 0 : 3
                borderColor: loginButton.enabled ? "#000000" : "#e8e8e8"

                Image{
                    id: loginIcon
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/svg-images/right-arrow.svg"
                    sourceSize.height: 30
                    sourceSize.width: 30
                    fillMode: Image.PreserveAspectFit
                    anchors.horizontalCenter: parent.horizontalCenter

                    ColorOverlay{
                        color: loginButton.enabled ? "#ffffff" : "#e8e8e8"
                        anchors.fill: parent
                        source: loginIcon
                    }
                }
            }
        }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}D{i:3}D{i:2}
}
##^##*/
