import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 400
    height: 150
    visible: true

    property double x1
    property double x2
    property double x3
    property double y1
    property double y2
    property double y3
    property double an

    GridLayout{
        rows: 7
        columns: 3
        Label {
            text: "А координаты:"
            font.pixelSize: 14
            Layout.row: 2
            Layout.column: 0
        }
        TextField{
            id:_x1
            placeholderText: qsTr("x1")
            Layout.row: 2
            Layout.column: 1
        }
        TextField{
            id:_y1
            placeholderText: qsTr("y1")
            Layout.row: 2
            Layout.column: 2
        }
        Label {
            text: "B координаты:"
            font.pixelSize: 14
            Layout.row: 3
            Layout.column: 0
        }
        TextField{
            id:_x2
            placeholderText: qsTr("x2")
            Layout.row: 3
            Layout.column: 1
        }
        TextField{
            id:_y2
            placeholderText: qsTr("y2")
            Layout.row: 3
            Layout.column: 2
        }
        Label {
            text: "C координаты:"
            font.pixelSize: 14
            Layout.row: 4
            Layout.column: 0
        }
        TextField{
            id:_x3
            placeholderText: qsTr("x3")
            Layout.row: 4
            Layout.column: 1
        }
        TextField{
            id:_y3
            placeholderText: qsTr("y3")
            Layout.row: 4
            Layout.column: 2
        }
        Label {
            text: "Площадь:"
            font.pixelSize: 14
            Layout.row: 6
            Layout.column: 0
        }
        Label{
            id:answer
            Layout.row: 6
            Layout.column: 1
        }
        Button {
            id:calc
            text: "Вычислить"
            onClicked: calculate()
            Layout.row: 5
            Layout.column: 0
        }
    }
    function calculate(){
        if(_x1.text && _x2.text && _x3.text &&
                _y1.text && _y2.text && _y3.text){
            x1 = _x1.text
            x2 = _x2.text
            x3 = _x3.text
            y1 = _y1.text
            y2 = _y2.text
            y3 = _y3.text
            an =  Math.abs(((x2-x1)*(y3-y1))-((x3-x1)*(y2-y1)))/2
            answer.text = an
        }
    }
}
