import QtQuick 2.0
import QtQuick.Controls 2.15
import "shapeGenerator.js" as ShapeGenerator

Window {
    width: 400
    height: 400
    visible: true
    title: qsTr("Lesson 5_1")

    ComboBox {
        id: shapeComboBox
        anchors.horizontalCenter: parent.horizontalCenter
        width: 150
        model: ["Звездочка", "Кольцо", "Домик", "Песочные часы"]
        onCurrentTextChanged: {
            canvas.requestPaint();
        }
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var ctx = canvas.getContext("2d");

            ctx.clearRect(0, 0, canvas.width, canvas.height);// Очищаем холст

            ctx.lineWidth = 2;
            ctx.strokeStyle = "black";

            var selectedShape = shapeComboBox.currentText;

            var coordinates = ShapeGenerator.generateCoordinates(selectedShape);

            ctx.save();
            ctx.translate(canvas.width / 3, canvas.height / 3);// Центрируем фигуру

            ctx.beginPath();
            for (var i = 0; i < coordinates.length; i++) {
                ctx.lineTo(coordinates[i].x, coordinates[i].y);
            }
            ctx.closePath();
            ctx.stroke();

            ctx.restore();// Восстанавливаем состояние контекста
        }
    }
}
