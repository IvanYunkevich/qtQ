import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts
import QtQuick.Controls 2.12
import Diagram 1.0

Window {
    width: 640
    height: 480
    visible: true

    function diagDraw() {
        _yV.min = _diagLogic.volMaxMin("y","min")
        _yV.max = _diagLogic.volMaxMin("y","max")
        for (var i = 0; i < _diagLogic.getVectorSize(); i++) {
            _series.remove(i);
            _series.insert(i,_diagLogic.getX(i), _diagLogic.getY(i));
        }
        _series.name = _diagLogic.diagTypeName();
    }

    Diagram {
        id: _diagLogic
    }

    ChartView {
        id: _chartView
        x: 20
        y: 20
        width: 600
        height: 387

        LineSeries {
            id: _series
            name: _diagLogic.diagTypeName()
            color: _diagLogic.diagColor()
            axisX: ValueAxis {
                id:_xV
                min: _diagLogic.volMaxMin("x","min")
                max: _diagLogic.volMaxMin("x","max")
            }
            axisY: ValueAxis {
                id:_yV
                min: -1
                max: 1
            }
        }

        Component.onCompleted: {
            _yV.min = _diagLogic.volMaxMin("y","min")
            _yV.max = _diagLogic.volMaxMin("y","max")
            for (var i =0; i < _diagLogic.getVectorSize(); i++) {
                _series.append(_diagLogic.getX(i), _diagLogic.getY(i));
            }
        }
    }

    Button {
        id: _button
        x: 230
        y: 400
        width: 200
        height: 30
        text: qsTr("Next")
        onClicked: {
            _diagLogic.diagTypeChange()
            diagDraw()
        }
    }
}
