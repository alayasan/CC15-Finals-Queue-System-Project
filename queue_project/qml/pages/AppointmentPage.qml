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

        Rectangle{
            id: tablebg
            width: 700
            color: "#98a6ff"
            radius: 10
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 75
            anchors.rightMargin: 50
            anchors.bottomMargin: 25

            Rectangle {
                id: contents
                color: "#ededed"
                radius: 10
                anchors.fill: parent
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 5

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
                        id: tableTitle
                        color: "#111111"
                        text: qsTr("Appointment History")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        font.letterSpacing: 0.3
                        font.bold: true
                        font.pointSize: 14
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
                            width: tableList.width
                            height: reasontxt.height > 40 ? reasontxt.height : 40
                            color: "#e95555"
                            radius: 10

                            Rectangle {
                                id: rowbg
                                color: "#95a3fe"
                                radius: 10
                                anchors.fill: parent
                                anchors.leftMargin: 3
                                Label {
                                    id: reftxt
                                    y: 14
                                    width: reflabel.implicitWidth
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
                                    width: teacherlabel.width
                                    height: implicitHeight
                                    text: qsTr("Label")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: reftxt.right
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.WordWrap
                                    anchors.leftMargin: 10
                                    font.family: "Segoe UI"
                                    font.pointSize: 10
                                }

                                Label {
                                    id: datetxt
                                    y: 0
                                    width: datelabel.width
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
                                    width: reasonlabel.width
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
                        id: tableList
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: tableheader.bottom
                        anchors.bottom: parent.bottom
                        clip: true
                        anchors.bottomMargin: 10
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        ScrollBar.vertical: ScrollBar{ }
                        spacing: 5

                        model: 10
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
                            id: reflabel
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
                            id: teacherlabel
                            y: 14
                            width: parent.width * 0.25
                            color: "#ffffff"
                            text: qsTr("Teacher")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: reflabel.right
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Segoe UI"
                            anchors.leftMargin: 10
                            font.pointSize: 10
                        }

                        Label {
                            id: datelabel
                            y: 14
                            width: parent.width * 0.15
                            color: "#ffffff"
                            text: qsTr("Date & Time")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: teacherlabel.right
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Segoe UI"
                            anchors.leftMargin: 10
                            font.pointSize: 10
                        }

                        Label {
                            id: reasonlabel
                            y: 14
                            width: parent.width * 0.3
                            color: "#ffffff"
                            text: qsTr("Reason")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: datelabel.right
                            verticalAlignment: Text.AlignVCenter
                            anchors.leftMargin: 10
                            font.family: "Segoe UI"
                            font.pointSize: 10
                        }

                        Label {
                            id: statuslabel
                            y: 14
                            color: "#ffffff"
                            text: qsTr("Status")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: reasonlabel.right
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

        Rectangle {
            id: appoint
            height: (teacherbox.height * 3) + purposefield.height + filterBtn.height + 50
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: tablebg.left
            anchors.top: parent.top
            anchors.rightMargin: 73
            anchors.topMargin: 75
            anchors.leftMargin: 50


            Rectangle {
                id: teacherbox
                height: 50
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 0
                anchors.rightMargin: 0
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
                    id: teacherdd
                    x: -186
                    y: -68
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    iconColor: "#111111"
                    delegateColorPressed: "#ededed"
                    delegateColorMouseOver: "#e7e7e7"
                    delegateColorDefault: "#f9f9f9"
                    bgRadius: 3
                    anchors.rightMargin: 25
                    unselectText: "Teacher"

                    // properties used for populating dropdown
                    property var rowcount: 1
                    property int index: 0
                    property var facname

                    ListModel{
                        id: teacherddList
                        ListElement{
                            name: "Teacher"
                        }
                    }

                    model: teacherddList
                    
                    Timer{
                        id: teacherddTimer
                        repeat: true
                        running: true
                        interval: 100
                        onTriggered: {
                            if(teacherdd.index < teacherdd.rowcount && teacherdd.facname !== "empty"){
                                backend.fetchFacultyDetails(teacherdd.index)
                                teacherddList.append({name : teacherdd.facname})
                                teacherdd.index += 1
                            } else {
                                running = false
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: timebox
                x: 4
                width: teacherbox.width
                height: 50
                color: "#ffffff"
                anchors.top: teacherbox.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                Label {
                    id: timetext
                    y: -58
                    color: "#111111"
                    text: qsTr("Time:")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pointSize: 10
                    anchors.leftMargin: 25
                    font.family: "Segoe UI"
                }

                CustomDropdown{
                    id: timedd
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    unselectText: "Time"

                    ListModel{
                        id: timeddList
                        ListElement{
                            name: "Time"
                        }
                    }

                    model: {
                        if(timeddList.count < 2){
                            [
                            "09:00 am",
                            "09:30 am",
                            "10:00 am",
                            "10:30 am",
                            "02:30 pm"
                            ]
                        } else { timeddList }
                    }

                    Timer{
                        id: timeddTimer
                        running: false
                        repeat: true
                        interval: 100
                    }
                }
            }

            Rectangle {
                id: datebox
                x: 4
                width: teacherbox.width
                height: 50
                color: "#ffffff"
                anchors.top: timebox.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                Label {
                    id: datetext
                    y: -58
                    color: "#111111"
                    text: qsTr("Date:")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pointSize: 10
                    font.family: "Segoe UI"
                    anchors.leftMargin: 25
                }

                CustomTextField{
                    id: datefield
                    width: 200
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    font.capitalization: Font.AllUppercase
                    placeholderText: "MM-dd-YYYY"
                    anchors.rightMargin: 25
                    readOnly: true

                    // properties
                    property var selDate  // to be used for the db

                    Popup{
                        visible: datefield.focus ? true : false
                        y: datefield.height - 1
                        width: datefield.width
                        height: contentItem.implicitHeight
                        padding: 1

                        contentItem: DatePicker{
                            implicitHeight: 160
                            Component.onCompleted: set(new Date())
                            onClicked: {
                                datefield.text = Qt.formatDate(date, 'MM-dd-yyyy')
                                datefield.selDate = Qt.formatDate(date, 'yyyy-MM-dd')
                            }
                        }
                    }
                }
            }

            GroupBox {
                id: purposefield
                x: 24
                width: 0.9 * teacherbox.width
                height: tablebg.height * 0.2
                anchors.top: datebox.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
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
                x: 104
                width: 200
                height: 40
                text: "Set Appointment"
                anchors.top: purposefield.bottom
                font.pointSize: 10
                font.family: "Segoe UI"
                colorMouseOver: "#8291ea"
                colorPressed: "#95a3fe"
                colorDefault: "#98a6ff"
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                implicitWidth: 200
                implicitHeight: 40

                onClicked: {
                    if(teacherdd.text !== "" && teacherdd.text !== "Teacher" && timedd.text !== ""
                        && timedd !== "Time" && datefield.selDate !== "" && textBox.text !== ""){
                        backend.pushAppointmentDetails(teacherdd.textAt(teacherdd.currentIndex), timedd.textAt(timedd.currentIndex), datefield.selDate, textBox.text)
                    } else { console.log("There are some missing information.") }
                }
            }
        }

        /*
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
        */
    }

    Connections{
        id: connection
        target: backend

        function onFacultyRowCount(rowcount){
            teacherdd.rowcount = rowcount
        }

        function onFacultyNameList(name){
            teacherdd.facname = name
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:720;width:1280}
}
##^##*/
