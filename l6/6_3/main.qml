import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 700
    height: 480
    title: qsTr("Прогноз погоды")

    property string baseUrl: "http://api.weatherapi.com/v1"
    property string apiKey: "f5799f6f0ffd4ed39e6215023231206"

    Row{
        anchors.horizontalCenter: parent.horizontalCenter

        TextField{
            id: _city
            placeholderText: "Город"
            width: 150
            height: 25
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            id: _button
            width: 100
            height: 25
            text: "Найти"
            onClicked: getWeather()
        }
    }

    TextArea{
        id: _weather
        anchors.centerIn: parent
        width: parent.width
        height: parent.height / 2
        font.pixelSize: 15
        color: "black"
        readOnly: true
    }

    function getWeather(){
        if (_city.text !== ""){
            _weather.clear()
            printData(getData(_city.text))
        }
    }

    function getData(_city){
        var xhr = new XMLHttpRequest();
        var url = `${baseUrl}/current.json?key=${apiKey}&q=${_city}&lang=ru`;
        xhr.open("GET",url,false);
        xhr.send();
        if (xhr.status == 200) return JSON.parse(xhr.response)
        else return "Error"
    }

    function printData(weatherJson){
        if (weatherJson === "Error!") weatherTextArea.append("Город не найден!")
        else{
        _weather.append("Город: "+weatherJson.location.name+", "+weatherJson.location.country);
        _weather.append("Температура: "+weatherJson.current.temp_c+"C");
        _weather.append("Влажность: "+weatherJson.current.humidity+"%");
        _weather.append("Давление: "+weatherJson.current.pressure_mb+" рт.ст");
        _weather.append("Ветер: "+weatherJson.current.wind_kph+"км/ч");
        _weather.append(weatherJson.current.condition.text);
        }
    }
}

