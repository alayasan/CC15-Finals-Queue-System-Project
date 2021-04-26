import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

ListView{
    id: listview

    function set(date){
        selectedDate = new Date(date)
        positionViewAtIndex((selectedDate.getFullYear()) * 12 + selectedDate.getMonth(), ListView.Center)
    }

    signal clicked(date date);

    //properties
    property date selectedDate: new Date()


    clip: true
    snapMode: ListView.SnapOneItem
    orientation: ListView.Vertical
    width: 640
    height: 480
    flickDeceleration: 500
    cacheBuffer: listview.width
    model: 3000 * 12

    delegate: Item{
        id: listviewDelegate

        //properties
        property int year: Math.floor(index / 12)
        property int month: index % 12
        property int firstDay: new Date(year, month, 1).getDay()
        property int i: index

        width: listview.width
        height: listview.height

        Column{
            Item{
                id: item1
                width: listview.width
                height: listview.height - grid.height

                Text{
                    text: {
                        ['January', 'February', 'March', 'April',
                        'May', 'June', 'July', 'August',
                        'September', 'October', 'November', 'December'][month]
                        + ' ' + year
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 0.5 * grid.cellHeight
                    anchors.rightMargin: grid.cellWidth * 0.4
                    anchors.leftMargin: grid.cellWidth * 0.4
                }

                Rectangle {
                    id: holder
                    x: 407
                    y: 42
                    width: grid.cellWidth * 2
                    height: listview.height - grid.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 0

                    Image {
                        id: downArrow
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: grid.cellWidth * 0.3
                        source: "../images/svg-images/dropdown-arrow.svg"
                        fillMode: Image.PreserveAspectFit
                        sourceSize.height: grid.cellWidth * 0.4
                        sourceSize.width: grid.cellWidth * 0.4

                        ColorOverlay{
                            anchors.fill: parent
                            color: "#000000"
                            antialiasing: false
                            source: parent
                        }

                        MouseArea{
                            anchors.centerIn: parent
                            height: holder.height
                            width: grid.cellWidth
                            onClicked: {
                                i += 1
                                positionViewAtIndex(i, ListView.Center)
                                print(index)
                            }
                        }
                    }

                    Image {
                        id: upArrow
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        source: "../images/svg-images/dropdown-arrow.svg"
                        rotation: 180
                        anchors.rightMargin: grid.cellWidth + (grid.cellWidth * 0.3)
                        fillMode: Image.PreserveAspectFit
                        sourceSize.height: grid.cellWidth * 0.4
                        sourceSize.width: grid.cellWidth * 0.4

                        ColorOverlay{
                            anchors.fill: parent
                            color: "#000000"
                            antialiasing: false
                            source: parent
                        }

                        MouseArea{
                            anchors.centerIn: parent
                            height: holder.height
                            width: grid.cellWidth
                            onClicked: {
                                i -= 1
                                flick(0, 1000)
                                print(index)
                            }
                        }
                    }
                }
            }

            Grid{
                id: grid
                width: listview.width
                height: listview.height * 0.85

                //properties
                property real cellWidth: width / columns
                property real cellHeight: height / rows

                rows: 7
                columns: 7

                Repeater{
                    model: grid.columns * grid.rows

                    delegate: Rectangle{
                        id: gridSq

                        //properties
                        property int day: index - 7
                        property int date: day - firstDay + 1

                        width: grid.cellWidth
                        height: grid.cellHeight
                        radius: 0.02 * listview.height
                        border.width: 0.3 * radius
                        border.color: new Date(year, month, date).toDateString() == selectedDate.toDateString() && dateText.text && day >= 0 ? "#111111" : "transparent"
                        opacity: !mouseArea.pressed ? 1 : 0.3


                        Text{
                            id: dateText
                            font.pixelSize: 0.5 * parent.height
                            anchors.centerIn: parent
                            font.bold: new Date(year, month, date).toDateString() == new Date().toDateString()
                            text: {
                                if(day < 0){
                                    ['S', 'M', 'T', 'W', 'T', 'F', 'S'][index]
                                } else if(new Date(year, month, date).getMonth() == month){
                                      date
                                } else{
                                      ''
                                }
                            }
                        }

                        MouseArea{
                            id: mouseArea

                            anchors.fill: parent
                            hoverEnabled: true
                            enabled: dateText.text && day >= 0

                            onClicked: {
                                selectedDate = new Date(year, month, date)
                                listview.clicked(selectedDate)
                            }
                            onEntered: gridSq.opacity = 0.3
                            onExited: gridSq.opacity = 1
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        set(new Date())
    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}
}
##^##*/
