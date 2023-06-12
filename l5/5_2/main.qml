import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "LoginCheck.js" as LoginCheck

Window {
    id: _Window
    width: 640
    height: 480
    visible: true
    color: "darkgray"

    property bool isInput: false;

    Component.onCompleted: LoginCheck._autorizPage(_Window);

    Component {
        id: page_1
        Rectangle {
            width: _Window.width
            height: _Window.height
            color: "yellow"
            Component.onCompleted: print("loaded Page 1")
            Component.onDestruction: print("destroyed Page 2")
            Label {
                text: "Page 1"
                font.pixelSize: 24
            }

            MouseArea {
                anchors.fill: parent
                onClicked: loader.sourceComponent = page_2
            }

        }
    }

    Component {
        id: page_2
        Rectangle {
            width: _Window.width
            height: _Window.height
            color: "black"
            Component.onCompleted: print("loaded Page 2")
            Component.onDestruction: print("destroyed Page 1")
            Label {
                text: "Page 2"
                color: "white"
                font.pixelSize: 24
            }


            MouseArea {
                anchors.fill: parent
                onClicked: loader.sourceComponent = page_1
            }

        }
    }

    Loader {
        id: loader
    }
}
