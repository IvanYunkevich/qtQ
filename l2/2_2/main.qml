import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: rect
        width: 100
        height: 100
        anchors.centerIn: parent
        color: "red"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.RightButton | Qt.LeftButton
            onClicked:(mouse)=> {
                if(mouse.button === Qt.LeftButton)
                     parent.color = Qt.rgba(Math.random(),Math.random(),Math.random())
                else if(mouse.button === Qt.RightButton)
                    rotation.start()
            }
            onDoubleClicked: {
                parent.radius = 200
        }
        }

    RotationAnimation {
       id: rotation;
       target: rect;
       to: rect.rotation + 360;
       duration: 2000
       loops: Animation.Infinite}
    }
}

