import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"

Item {

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

        Image {
            id: bgImage
            anchors.fill: parent
            source: "../images/logos/freestocks-I_pOqP6kCOI-unsplash.jpg"
            anchors.leftMargin: 400
            fillMode: Image.PreserveAspectCrop

            Rectangle {
                id: imagefilter
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
                    leftPadding: 15
                    rightPadding: 15
                    spacing: 15

                    Image {
                        id: xuLogo
                        width: xuLogo.height
                        height: logoBar.height
                        source: "../images/logos/xu logo.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: ccsLogo
                        width: ccsLogo.height
                        height: logoBar.height
                        source: "../images/logos/CCS logo.png"
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
                id: usernameField
                width: 300
                height: 40
                anchors.top: signInText.bottom
                placeholderText: "USERNAME"
                anchors.topMargin: 25
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }


            CustomTextField {
                id: passwordField
                property bool isTextVisible: false
                width: 300
                height: 40
                anchors.top: usernameField.bottom
                anchors.topMargin: 10
                placeholderText: "PASSWORD"
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                echoMode: TextInput.Password

                Image {
                    id: iconEye
                    x: 275
                    y: 12
                    width: 15
                    height: 15
                    anchors.right: parent.right
                    source: "../images/svg-images/non-visibility-icon.svg"
                    anchors.rightMargin: 10
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 15
                    visible: false
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: 0.5

                    ColorOverlay{
                        anchors.fill: parent
                        color: "#000000"
                        antialiasing: false
                        source: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.opacity = 0.75
                        onExited: parent.opacity = 0.5
                        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                        onClicked: {
                            if(!passwordField.echoMode == TextInput.Normal){
                                passwordField.echoMode = TextInput.Normal
                                iconEye.source = "../images/svg-images/visibility-icon.svg"
                            } else{
                                passwordField.echoMode = TextInput.Password
                                iconEye.source = "../images/svg-images/non-visibility-icon.svg"
                            }
                        }
                    }
                }

                onFocusChanged: {
                    if(passwordField.focus){
                        iconEye.visible = true
                    } else{
                        iconEye.visible = false
                        if(passwordField.text != ""){
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
                anchors.top: passwordField.bottom
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

                    onClicked: registerbgAnimation.running = true
                }
                font.capitalization: Font.AllUppercase

                PropertyAnimation{
                    id: registerbgAnimation
                    target: registerbg
                    property: "height"
                    easing.bezierCurve: [0.221,0.00244,0.223,1,1,1]
                    to: if(registerbg.height == 0) return 500; else return 0
                    //easing.type: Easing.InOutSine
                    duration: 600
                }
            }

            CustomButton{
                id: loginButton
                x: 143
                width: 70
                height: 70
                text: ""
                anchors.top: passwordField.bottom
                colorPressed: "#95a3fe"
                anchors.topMargin: 100
                colorMouseOver: "#8291ea"
                colorDefault: loginButton.enabled ? "#98a6ff" : "#f9f9f9"
                enabled: usernameField.text !== "" && passwordField.text !== "" ? true : false
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

                onClicked: backend.userLogin(usernameField.text, passwordField.text)
            }
        }

        Rectangle {
            id: registerbg
            y: 50
            z: 1
            width: 450
            height: 0
            color: "#f9f9f9"
            radius: 10
            anchors.verticalCenter: bgImage.verticalCenter
            anchors.horizontalCenter: bgImage.horizontalCenter

            Rectangle {
                id: namefield
                y: 93
                height: 40
                opacity: closeButton.opacity
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: userfield.top
                anchors.bottomMargin: 15
                anchors.leftMargin: 25
                anchors.rightMargin: 25

                CustomTextField {
                    id: firstnamefield
                    y: 31
                    width: (parent.width / 2) - 5
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.capitalization: Font.Capitalize
                    anchors.leftMargin: 0
                    placeholderText: "FIRST NAME"
                    anchors.bottomMargin: 15
                }

                CustomTextField {
                    id: lastnamefield
                    y: 31
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: firstnamefield.right
                    anchors.right: parent.right
                    font.capitalization: Font.Capitalize
                    anchors.rightMargin: 0
                    anchors.leftMargin: 10
                    placeholderText: "LAST NAME"
                    anchors.bottomMargin: 15
                }
            }

            CustomTextField{
                id: userfield
                width: namefield.width
                opacity: closeButton.opacity
                anchors.bottom: coursefield.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 15
                placeholderText: "USERNAME"
            }

            CustomTextField {
                id: coursefield
                width: namefield.width
                opacity: closeButton.opacity
                placeholderText: "COURSE & YEAR"
                readOnly: true
                text: {
                    if(year == ""){
                        course
                    } else if(course !== "" && year !== ""){
                        course + " - " + year
                    }
                }
                anchors.bottom: passfield.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 15

                onPressed: {
                    yearpop.visible = true
                    coursepop.visible = true
                }
                
                Popup{
                    id: yearpop
                    width: 75
                    height: contentItem.implicitHeight
                    visible: coursefield.focus ? true : false
                    y: parent.height - 1
                    x: coursepop.width - 1
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
                                border.color: control.down ? "#8291ea" : "#98a6ff"
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
                                    color: control.down ? "#8291ea" : "#3a53a4"
                                }
                            }

                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                visible: control.down || control.highlighted || control.hovered
                                color: {
                                    if(control.down){
                                        control.down ? "#e7e7e7" : "#ffffff"
                                    } else {
                                        control.hovered ? "#ededed" : "#ffffff"
                                    }
                                }
                            }

                            onClicked:{
                                year = radtxt.text
                                coursepop.visible = true
                            }
                        }
                    }
                }

                Popup{
                    id: coursepop
                    visible: coursefield.focus ? true : false
                    width: parent.width * 0.65
                    height: contentItem.implicitHeight
                    y: parent.height - 1
                    padding: 1

                    contentItem: ListView{
                        clip: true
                        boundsBehavior: Flickable.StopAtBounds
                        implicitHeight: 120
                        ScrollIndicator.vertical: ScrollIndicator { }
                        spacing: 1

                        model: [
                            qsTr("BS in Computer Science"),
                            qsTr("BS in Information Technology"),
                            qsTr("BS in Information Systems")
                        ]

                        delegate: Rectangle{
                            id: rectangle1
                            height: 40
                            width: coursepop.width
                            color: {
                                if(mouseArea.containsPress){
                                    mouseArea.containsPress ? "#e7e7e7" : "#ffffff"
                                } else {
                                    mouseArea.containsMouse ? "#ededed" : "#ffffff"
                                }
                            }

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
                                enabled: true
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
                z: 1
                width: namefield.width
                opacity: closeButton.opacity
                anchors.bottom: confirmpassfield.top
                anchors.bottomMargin: 15
                placeholderText: "PASSWORD"
                anchors.horizontalCenter: parent.horizontalCenter
                echoMode: TextInput.Password

                Image {
                    id: passfieldEye
                    width: 15
                    height: 15
                    anchors.right: parent.right
                    source: "../images/svg-images/non-visibility-icon.svg"
                    anchors.rightMargin: 10
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 15
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: 0.5
                    visible: false

                    ColorOverlay{
                        anchors.fill: parent
                        color: "#000000"
                        antialiasing: false
                        source: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.opacity = 0.75
                        onExited: parent.opacity = 0.5
                        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                        onClicked: {
                            if(!passfield.echoMode == TextInput.Normal){
                                passfield.echoMode = TextInput.Normal
                                parent.source = "../images/svg-images/visibility-icon.svg"
                            } else{
                                passfield.echoMode = TextInput.Password
                                parent.source = "../images/svg-images/non-visibility-icon.svg"
                            }
                        }
                    }
                }

                onFocusChanged: {
                    if(passfield.focus){
                        passfieldEye.visible = true
                    } else{
                        passfieldEye.visible = false
                        if(passfield.text !== ""){
                            passfieldEye.visible = true
                        }
                    }
                }
            }

            CustomTextField {
                id: confirmpassfield
                x: 35
                y: 167
                z: 1
                width: namefield.width
                opacity: closeButton.opacity
                anchors.bottom: regButton.top
                anchors.bottomMargin: 25
                placeholderText: "CONFIRM PASSWORD"
                anchors.horizontalCenter: parent.horizontalCenter
                echoMode: TextInput.Password

                Image {
                    id: confirmpassfieldEye
                    width: 15
                    height: 15
                    anchors.right: parent.right
                    source: "../images/svg-images/non-visibility-icon.svg"
                    anchors.rightMargin: 10
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 15
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: 0.5
                    visible: false

                    ColorOverlay{
                        anchors.fill: parent
                        color: "#000000"
                        antialiasing: false
                        source: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.opacity = 0.75
                        onExited: parent.opacity = 0.5
                        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                        onClicked: {
                            if(!confirmpassfield.echoMode == TextInput.Normal){
                                confirmpassfield.echoMode = TextInput.Normal
                                parent.source = "../images/svg-images/visibility-icon.svg"
                            } else{
                                confirmpassfield.echoMode = TextInput.Password
                                parent.source = "../images/svg-images/non-visibility-icon.svg"
                            }
                        }
                    }
                }

                onFocusChanged: {
                    if(confirmpassfield.focus){
                        confirmpassfieldEye.visible = true
                    } else{
                        confirmpassfieldEye.visible = false
                        if(confirmpassfield.text !== ""){
                            confirmpassfieldEye.visible = true
                        }
                    }
                }
            }

            CustomButton{
                id: regButton
                width: 250
                height: passfield.height
                opacity: closeButton.opacity
                text: "REGISTER"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 35
                colorPressed: "#5f71c6"
                colorMouseOver: "#8291ea"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Segoe UI"
                font.bold: true
                colorDefault: "#98a6ff"

                onClicked: {
                    if(firstnamefield.text == "" || lastnamefield.text == "" ||
                            userfield.text == "" || course == "" || year == "" ||
                            confirmpassfield.text == "" || passfield.text == ""){
                        noticeText.text = qsTr("Some fields are missing information")
                    } else if(passfield.text == confirmpassfield.text && firstnamefield.text !== "" &&
                              lastnamefield !== ""){
                        backend.registerUser(userfield.text, passfield.text, firstnamefield.text, lastnamefield.text,
                                             course, parseInt(year))
                    } else{
                        console.log("unsuccessful")
                    }
                }
            }

            CustomButton{
                id: closeButton
                x: 450
                y: 20
                width: 30
                height: 30
                text: ""
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.rightMargin: 10
                colorDefault: "#00000000"
                colorPressed: "#dedede"
                colorMouseOver: "#e5e5e5"
                bgRadius: (height / 4) + 1
                opacity: parent.height < 400 ? 0 : 1

                onClicked: registerbgAnimation.running = true

                Image{
                    id: registerclose
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../images/svg-images/close_icon.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: 16
                    sourceSize.width: 16
                    fillMode: Image.PreserveAspectFit

                    ColorOverlay{
                        antialiasing: true
                        anchors.fill: parent
                        color: "#000000"
                        source: registerclose
                    }
                }
            }

            Label {
                id: signuptext
                width: implicitWidth
                height: implicitHeight
                opacity: closeButton.opacity
                color: "#111111"
                text: qsTr("Sign Up")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 25
                font.pointSize: 27
                font.family: "Segoe UI"
                anchors.topMargin: 10
                font.bold: true
            }

            Rectangle{
                id: separator
                height: 1
                color: "#c9d5ff"
                anchors.bottom: namefield.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 30
                width: registerbg.width
                opacity: closeButton.opacity
            }

            Label {
                id: noticeText
                y: 82
                width: namefield.width
                height: implicitHeight
                opacity: closeButton.opacity
                text: {
                    if(passfield.text == confirmpassfield.text){
                        qsTr("")
                    } else if(passfield.text !== confirmpassfield.text){
                        qsTr("Passwords don't match!")
                    }
                }
                
                anchors.left: parent.left
                anchors.bottom: separator.top
                wrapMode: Text.WordWrap
                anchors.bottomMargin: 10
                font.pointSize: 10
                font.family: "Segoe UI"
                anchors.leftMargin: 25
            }
        }

        DropShadow{
            source: registerbg
            horizontalOffset: 0
            verticalOffset: 0
            radius: 10
            anchors.fill: registerbg
            color: "#40000000"
            z: 0
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.75;height:720;width:1280}D{i:60}
}
##^##*/
