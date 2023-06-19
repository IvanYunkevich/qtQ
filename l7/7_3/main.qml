import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 500
    height: 350
    visible: true

    TCombobox {
        id: tCombobox
        x: 30
        y: 30
        model: ["1", "2", "3"]

    }

    Button {
        text: "popup"
        onClicked: popup.open()
        x: 200
        y: 30
        width: 100
        height: 70
    }

    Popup {
        id: popup
        x: 200
        y: 100
        width: 200
        height: 200
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        background: Rectangle {
            radius: 20
            border.color: "black"
        }
        Text {
            anchors.centerIn: parent
            text: "Rounded popup"
        }
    }
}
