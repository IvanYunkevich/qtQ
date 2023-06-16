import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Nums.js" as Nums

Window {
    id: root
    width: 925
    height: 300
    visible: true

    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min) + min);
    }

    Item {
        anchors.fill: parent

        ListModel {
            id: model
        }

        ListView {
            id: listview
            anchors.fill: parent
            model: model
            header: Rectangle {
                height: 35
                width: parent.width
                color: "white"
                Text {
                    anchors.centerIn: parent
                    text: "NUMBERSAPI"
                    color: "black"
                }
            }

            delegate: Rectangle {
                width: parent.width
                height: 30
                Text {
                    text: event
                    anchors.centerIn: parent
                }
            }
        }
    }

    Button {
        id: _button
        x: 430
        y: 250
        width: 66
        height: 25
        text: qsTr("Get Data")
        onClicked: {
            for (var i = 0; i < 5 ; ++i){
                Nums.getNums(randomNumber(1, 2023))
            }
        }
    }
}
