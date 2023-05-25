import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 400
    height: 200
    visible: true

    property double a
    property double b
    property double c
    property double p
    property double q
    property double s

    GridLayout{
        rows: 7
        columns: 2
        Label {
            text: "Сторона А:"
            font.pixelSize: 14
            Layout.row: 2
            Layout.column: 0
        }
        TextField{
            id:side_a
            Layout.row: 2
            Layout.column: 1
        }
        Label {
            text: "Сторона B:"
            font.pixelSize: 14
            Layout.row: 3
            Layout.column: 0
        }
        TextField{
            id:side_b
            }
            Layout.row: 3
            Layout.column: 1
        Label {
            text: "Сторона C:"
            font.pixelSize: 14
            Layout.row: 4
            Layout.column: 0
        }
        TextField{
            id:side_c
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
            Layout.column: 1
        }
    }
    function calculate(){
        if(side_a.text && side_b.text && side_c.text){
        a = side_a.text
        b = side_b.text
        c = side_c.text
        p = (a+b+c)/2
        q = p*((p-a)*(p-b)*(p-c))
        s = Math.sqrt(q)
        answer.text = s
        }
    }
}
