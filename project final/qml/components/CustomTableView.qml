import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Item {
    implicitHeight: 340
    Rectangle{
        id: bg
        radius: 10
        anchors.fill: parent

        Rectangle {
            id: contents
            color: "#3a53a4"
            radius: 10
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 3

            Rectangle {
                id: topBar
                x: 5
                y: 137
                height: 70
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Label {
                    id: label
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.letterSpacing: 0.3
                    font.bold: true
                    font.pointSize: 10
                    font.family: "Segoe UI"
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Rectangle {
                id: tablearea
                height: contents.height - topBar.height - 70
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.topMargin: 0
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                implicitHeight: 200

                Component{
                    id: listdelegate
                    Rectangle {
                        id: accentbg
                        y: 65
                        width: parent.width
                        height: reasontxt.height > 40 ? reasontxt.height : 40
                        color: "#e95555"
                        radius: 10
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            id: rowbg
                            color: "#95a3fe"
                            radius: 10
                            anchors.fill: parent
                            anchors.leftMargin: 3
                            Label {
                                id: referencetxt
                                y: 14
                                width: ref.implicitWidth
                                height: implicitHeight
                                text: qsTr("Label")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                verticalAlignment: Text.AlignVCenter
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 10
                            }

                            Label {
                                id: teachertxt
                                y: 0
                                width: teacher.width
                                height: implicitHeight
                                text: qsTr("Label")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: referencetxt.right
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 10
                            }

                            Label {
                                id: datetxt
                                y: 0
                                width: dt.width
                                height: implicitHeight
                                text: qsTr("Label")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: teachertxt.right
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                anchors.leftMargin: 10
                                font.family: "Segoe UI"
                                font.pointSize: 10
                            }

                            Text {
                                id: reasontxt
                                y: 18
                                width: reason.width
                                height: implicitHeight > 40 ? implicitHeight : 40
                                text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet nec ullamcorper sit amet risus nullam eget felis eget.")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: datetxt.right
                                font.letterSpacing: 0.3
                                font.pixelSize: 12
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                                anchors.leftMargin: 10
                                topPadding: 5
                                font.family: "Segoe UI"
                                bottomPadding: 5
                            }

                            Label {
                                id: statustxt
                                y: 0
                                height: implicitHeight
                                text: qsTr("Label")
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: reasontxt.right
                                anchors.right: parent.right
                                verticalAlignment: Text.AlignVCenter
                                anchors.leftMargin: 15
                                font.family: "Segoe UI"
                                anchors.rightMargin: 10
                                font.pointSize: 10
                            }
                        }
                    }
                }

                ListView{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: tableheader.bottom
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    ScrollIndicator.vertical: ScrollIndicator{ }
                    spacing: 5


                    model: 4
                    delegate: listdelegate
                }

                Rectangle {
                    id: tableheader
                    height: 40
                    color: "#e95555"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    Label {
                        id: ref
                        y: 14
                        color: "#ffffff"
                        text: qsTr("Reference")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Segoe UI"
                        anchors.leftMargin: 15
                        font.pointSize: 10
                    }

                    Label {
                        id: teacher
                        y: 14
                        width: parent.width * 0.25
                        color: "#ffffff"
                        text: qsTr("Teacher")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: ref.right
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Segoe UI"
                        anchors.leftMargin: 10
                        font.pointSize: 10
                    }

                    Label {
                        id: dt
                        y: 14
                        width: parent.width * 0.15
                        color: "#ffffff"
                        text: qsTr("Date & Time")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: teacher.right
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Segoe UI"
                        anchors.leftMargin: 10
                        font.pointSize: 10
                    }

                    Label {
                        id: reason
                        y: 14
                        width: parent.width * 0.3
                        color: "#ffffff"
                        text: qsTr("Reason")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: dt.right
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 10
                        font.family: "Segoe UI"
                        font.pointSize: 10
                    }

                    Label {
                        id: status
                        y: 14
                        color: "#ffffff"
                        text: qsTr("Status")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: reason.right
                        anchors.right: parent.right
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Segoe UI"
                        anchors.rightMargin: 10
                        anchors.leftMargin: 15
                        font.pointSize: 10
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:450;width:700}
}
##^##*/
