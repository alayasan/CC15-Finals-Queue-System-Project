import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: profileButton

    // custom properties
    property color defaultProfilePictureColor: "#111111"
    property var name: "Profile"

    background: Rectangle{
        color: "#98a6ff"
        radius: 18
    }

    Image {
        id: profileImage
        y: 9
        width: sourceSize.width
        height: sourceSize.width
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        source: "../images/svg-images/profile-icon.svg"
        anchors.leftMargin: 5
        sourceSize.height: 28
        sourceSize.width: 28
        fillMode: Image.PreserveAspectFit

        ColorOverlay{
            source: profileImage
            color: defaultProfilePictureColor
            anchors.fill: parent
        }
    }

    Text {
        id: profileName

        property int maxwidth: 140
        property int currentsize: 50

        width: currentsize
        height: 20
        color: "#111111"
        text: name
        elide: Text.ElideRight
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        font.pixelSize: 18
        verticalAlignment: Text.AlignVCenter
        font.capitalization: Font.Capitalize
        font.bold: true
        font.family: "Segoe UI"
        anchors.leftMargin: 38
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2;height:36;width:200}D{i:2}D{i:4}
}
##^##*/
