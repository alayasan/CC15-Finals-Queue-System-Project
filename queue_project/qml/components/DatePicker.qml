import QtQuick 2.15
import QtQuick.Controls 2.15

ListView{
    id: listview

    //properties
    property date selectedDate: new Date()


    clip: true
    snapMode: ListView.SnapOneItem
    orientation: ListView.Horizontal
    width: 640
    height: 480
    model: 3000 * 12

    delegate: Item{
        //properties
        property int year: Math.floor(index / 12)
        property int month: index % 12
        property int firstDayInYear: new Date(year, month, 1).getDay()

        width: parent.width
        height: parent.height

        Column{
            Item{
                width: parent.width
                height: parent.height - grid.height

                Label{
                    anchors.centerIn: parent
                    text: {
                        ['January', 'February', 'March', 'April',
                         'May', 'June', 'July', 'August',
                         'September', 'October', 'November', 'December'][month]
                        + ' ' + year
                    }
                    font.pixelSize: grid.cellHeight * 0.5
                }
            }

            Grid{
                id: grid
                width: parent.width
                height: parent.height * 0.75
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}
}
##^##*/
