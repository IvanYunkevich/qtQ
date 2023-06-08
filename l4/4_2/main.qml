import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts
import QtQuick.Controls 2.12
import Linear 1.0

Window {
    width: 640
    height: 480
    visible: true

    Linear{
        id:linear
    }
    ChartView {
        id: chartView
        x: 20
        y: 20
        width: 600
        height: 387

        LineSeries {
            id: _lineSeries
            name: "linear dependence"
            color: "red"
            axisX: ValueAxis {
                id:_xV
                min: 0
                max: 220
            }
            axisY: ValueAxis {
                id:_yV
                min: 0
                max: 30
            }
        }
        ScatterSeries {
            id: _scatterSeries
            name: "Data"
            color: "blue"
            markerSize: 10
            markerShape: ScatterSeries.MarkerShapeRectangle
        }
        Component.onCompleted: {
            _lineSeries.append(0, linear.linearCalc(0));
            _lineSeries.append(220, linear.linearCalc(220));
            for (var i =0; i < linear.getSize(); i++) {
                _scatterSeries.append(linear.getX(i), linear.getY(i));
            }
        }
    }
}
