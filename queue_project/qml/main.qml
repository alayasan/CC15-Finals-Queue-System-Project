import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "components"
import "pages"

Window {
    id: window
    width: 1280
    height: 720
    minimumWidth: 1280
    minimumHeight: 720
    visible: true
    color: "#00000000"
    title: qsTr("Queue Project")

    // removing title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // properties
    property int winStatus: 0
    property int winMargin: 10
    property var maxResIcon: "images/svg-images/maximize_icon.svg"
    property var defFont: "Segoe UI"

    QtObject{
        id: internal
        function maxRestore(){
            if(winStatus == 0){
                winStatus = 1
                winMargin = 0
                maxResIcon = "images/svg-images/restore_icon.svg"
                resizeBottom.visible = false
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeTop.visible = false
                window.showMaximized()
            }
            else{
                winStatus = 0
                winMargin = 10
                maxResIcon = "images/svg-images/maximize_icon.svg"
                resizeBottom.visible = true
                resizeLeft.visible = true
                resizeRight.visible = true
                resizeTop.visible = true
                window.showNormal()
            }
        }
        function ifMaxWinRestore(){
            if(winStatus == 1){
                window.showNormal()
                winStatus = 0
                winMargin = 10
            }
        }
        function restoreMargins(){
            winStatus = 0
            winMargin = 10
            maxResIcon = "images/svg-images/maximize_icon.svg"
        }

    }

    Rectangle {
        id: bg
        anchors.fill: parent
        anchors.rightMargin: winMargin
        anchors.leftMargin: winMargin
        anchors.bottomMargin: winMargin
        anchors.topMargin: winMargin
        color: "#f9f9f9"

        Rectangle {
            id: container
            color: "#00000000"
            anchors.fill: parent

            Rectangle {
                id: topBar
                x: -1
                y: -1
                height: 35
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0

                Row {
                    id: topRowIcons
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    TopBarButton{
                        id: minimizeIcon
                        btnColorClicked: "#dedede"
                        btnColorMouseOver: "#e5e5e5"
                        btnColorDefault: "#00000000"
                        overlayColor: "#000000"
                        btnIconSource: "images/svg-images/minimize_icon.svg"
                        onClicked: {
                            window.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBarButton {
                        id: maxresIcon
                        btnColorClicked: "#dedede"
                        btnColorDefault: "#00000000"
                        btnColorMouseOver: "#e5e5e5"
                        overlayColor: "#000000"
                        btnIconSource: maxResIcon
                        onClicked: internal.maxRestore()
                    }

                    TopBarButton {
                        id: exitIcon
                        btnColorClicked: "#dd1025"
                        btnColorDefault: "#00000000"
                        btnIconSource: "images/svg-images/close_icon.svg"
                        overlayColor: "#000000"
                        btnColorMouseOver: "#e81123"
                        onClicked: window.close()
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: topRowIcons.left
                    anchors.rightMargin: 1
                    anchors.leftMargin: 0

                    DragHandler {
                        onActiveChanged: if(active){
                                             window.startSystemMove()
                                             internal.ifMaxWinRestore()
                                         }
                    }

                    Image {
                        id: appLogo
                        width: 28
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "images/logos/CCS logo.png"
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.leftMargin: 5
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: appTitle
                        text: qsTr("College of Computer Studies - Queueing System")
                        anchors.left: appLogo.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 8
                        font.family: "Segoe UI"
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.leftMargin: 5
                    }
                }
            }

            Rectangle {
                id: contents
                x: -1
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                StackView {
                    id: stackView
                    x: 1
                    y: 36
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 1
                    anchors.leftMargin: 1
                    initialItem: Qt.resolvedUrl("pages/LoginPage.qml")
                    anchors.rightMargin: 1
                    anchors.bottomMargin: 1
                }
            }

            MouseArea {
                id: resizeBottomRight
                x: 884
                y: 0
                width: 25
                height: 25
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                cursorShape: Qt.SizeFDiagCursor
                DragHandler {
                    target: null
                    onActiveChanged: if(active){
                                        window.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                    }
                }

                Image {
                    id: resizeImage
                    opacity: 0.5
                    anchors.fill: parent
                    source: "images/svg-images/resize_icon.svg"
                    anchors.topMargin: 5
                    sourceSize.width: 16
                    anchors.leftMargin: 5
                    sourceSize.height: 16
                    fillMode: Image.PreserveAspectFit
                    antialiasing: false

                    ColorOverlay{
                        color: "#111111"
                        anchors.fill: parent
                        source: parent
                        antialiasing: false
                    }
                }
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
            }
        }
    }


    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if(active){ window.startSystemResize(Qt.LeftEdge) }
        }
    }


    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if(active){ window.startSystemResize(Qt.RightEdge) }
        }
    }


    MouseArea {
        id: resizeTop
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if(active){ window.startSystemResize(Qt.TopEdge) }
        }
    }


    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if(active){ window.startSystemResize(Qt.BottomEdge) }
        }
    }
    DropShadow {
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        source: bg
        z : 0
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:720;width:1280}D{i:13}D{i:15}D{i:19;invisible:true}
D{i:21;invisible:true}D{i:23;invisible:true}D{i:25;invisible:true}D{i:27;invisible:true}
}
##^##*/
