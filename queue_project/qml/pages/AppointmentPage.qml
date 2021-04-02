import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"
import QtQuick.Layouts 1.15
import Qt.labs.qmlmodels 1.0

Item {
    id: item1
    Rectangle {
        id: bg
        color: "#ffffff"
        anchors.fill: parent
        clip: true

        TapHandler{
            onTapped: forceActiveFocus()
        }


        Rectangle {
            id: appoint
            width: bg.width / 3.14159265
            height: 0.8 * width
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 35
            anchors.leftMargin: 50


            ColumnLayout{
                id: column
                anchors.fill: parent
                spacing: 5

                Rectangle {
                    id: teacher
                    width: 400
                    height: 50
                    color: "#ffffff"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

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
                    width: 400
                    height: 50
                    color: "#ffffff"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
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
                }

                Rectangle {
                    id: date
                    width: 400
                    height: 50
                    color: "#ffffff"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

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


                    CustomTextField{
                        id: timeField
                        width: 200
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        font.capitalization: Font.AllUppercase
                        placeholderText: "MM/dd/YYYY"
                        anchors.rightMargin: 25

                        Popup{
                            visible: timeField.focus ? true : false
                            y: timeField.height - 1
                            width: timeField.width
                            height: contentItem.implicitHeight
                            padding: 1

                            contentItem: DatePicker{
                                implicitHeight: 160
                                Component.onCompleted: set(new Date())
                                onClicked: timeField.text = Qt.formatDate(date, 'MM/dd/yyyy')
                            }
                        }
                    }
                }

                GroupBox {
                    id: groupBox
                    width: 0.9 * teacher.width
                    height: 0.4 * appoint.height
                    font.family: "Segoe UI"
                    padding: 0
                    Layout.preferredHeight: height
                    Layout.preferredWidth: width
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    title: qsTr("Purpose")

                    ScrollView{
                        anchors.fill: parent
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                        clip: true

                        TextArea {
                            id: textBox
                            wrapMode: Text.Wrap
                            topPadding: 10
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                            font.pointSize: 10
                            font.family: "Segoe UI"
                            selectByMouse: true

                            background: Rectangle{
                                color: "#00000000"
                                border.width: 0.5
                                border.color: "#111111"
                            }
                        }
                    }
                }


                CustomButton{
                    id: filterBtn
                    width: 200
                    height: 40
                    font.family: "Segoe UI"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    implicitWidth: 200
                    implicitHeight: 40

                }
            }
        }


        GroupBox {
            id: tableGrpBx
            x: 846
            width: bg.width - appoint.width - (0.6 * appoint.width)
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.italic: true
            font.pointSize: 10
            font.family: "Segoe UI"
            anchors.bottomMargin: 25
            anchors.topMargin: 25
            anchors.rightMargin: 25
            title: qsTr("History")

            TableView{
                id: table
                anchors.fill: parent
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                ScrollIndicator.horizontal: ScrollIndicator{}
                ScrollIndicator.vertical: ScrollIndicator{}
                // columnWidthProvider: function (column) { return 100; }
                topMargin: columnHeader.implicitHeight

                model: TableModel {
                        TableModelColumn { display: "name" }
                        TableModelColumn { display: "color" }
                        TableModelColumn { display: "name" }
                        TableModelColumn { display: "color" }
                        TableModelColumn { display: "name" }
                        TableModelColumn { display: "color" }
                        TableModelColumn { display: "name" }
                        TableModelColumn { display: "color" }
                        TableModelColumn { display: "name" }
                        TableModelColumn { display: "color" }
                        TableModelColumn { display: "name" }
                        TableModelColumn { display: "color" }
                        TableModelColumn { display: "name" }
                        TableModelColumn { display: "color" }
                        TableModelColumn { display: "name" }
                        TableModelColumn { display: "color" }

                        rows: [
                            {
                                "name": "cat",
                                "color": "black"
                            },
                            {
                                "name": "dog",
                                "color": "brown"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            },
                            {
                                "name": "bird",
                                "color": "white"
                            }
                        ]
                    }

                delegate: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    border.width: 1

                    Text {
                        text: display
                        anchors.centerIn: parent
                    }
                }

                Row{
                    id: columnHeader
                    y: table.contentY
                    spacing: 1
                    z: 2
                    Repeater{
                        id: repeater
                        model: ListModel{
                            id: list
                            ListElement{ head: "Status"}
                            ListElement{ head: "Reference #"}
                            ListElement{ head: "Teacher"}
                            ListElement{ head: "Date & Time"}
                            ListElement{ head: "Purpose"}
                        }

                        Rectangle{
                            id: headerRect
                            color: "#333333"
                            width: table.width / list.count
                            height: 35

                            Text {
                                color: "#ffffff"
                                text: head
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.bold: true
                                font.family: "Segoe UI"
                                padding: 10
                            }

                        }
                    }
                }
            }
        }
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}
}
##^##*/
