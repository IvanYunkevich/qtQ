import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "API.js" as API

Window {
    width: 200
    height: 200
    visible: true
    color: "white"

    Column {
        id: _column
        x: 30
        y: 30
        height: 400

        Row {
            id: _row
            height: 30

            Text {
                text: qsTr("Конвертация")
                font.pixelSize: 12
            }
        }

        Row {
            height: 30

            Text {
                text: qsTr("RUB ")
                font.pixelSize: 12
            }

            TextField {
                id: _rub
            }
        }
        Row {

            Text {
                text: qsTr("USD ")
                font.pixelSize: 12
            }

            TextField {
                id: _usd
            }
        }
    }

    Button {
        id: button
        x: 50
        y: 150
        width: 100
        height: 25
        text: qsTr("Конвертировать")
        onClicked: {
            API.getInfo()
        }
    }
}
