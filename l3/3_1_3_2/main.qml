import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Состояния Форм")

    Rectangle{
        id: _rect1
        anchors.fill: parent
        state: "log_denied"

        Column{
            id: _autoriz
            anchors.centerIn: parent
            width: 200
            height: 100
            spacing: 10
            padding: 15

            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "      Авторизация";
                font.bold: true;
                font.pixelSize: 16
            }

            TextField{
                id: _login
                width: parent.width
                height: 30
                placeholderText: "Логин"
            }

            TextField{
                id: _password
                width: parent.width
                height: 30
                echoMode: TextField.Password
                placeholderText: "Пароль"

            }

            Button{
                id: _btn
                width: parent.width
                height: 30
                text: "Войти"

                onClicked: {
                    if(_login.text === "Login" && _password.text === "Password"){
                        _acc.start();
                        _rect1.state = "log_acc"
                    }
                    else
                        _wrong.start();
                }
            }
        }

        Column{
            id: _search
            anchors.centerIn: parent
            width: parent.width / 2
            height: parent.height / 2
            spacing: 10
            padding: 15

            Text{
                y: 10
                id: _signedIn
                anchors.horizontalCenter: parent.horizontalCenter
                color: "white"
                text: "пользователь авторизовался"
                font.pixelSize: 15
            }

            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Страница поиска";
                font.bold: true;
                font.pixelSize: 16
            }

            TextField{
                id: _find
                width: parent.width
                height: 30
            }

            Button{
                id: _btnSearch
                width: parent.width
                height: 30
                text: "Поиск"
                onClicked: {
                    _rect1.state = "search"
                }
            }
        }

        states: [State {
            name: "log_denied"
            PropertyChanges {
                target: _autoriz
                visible: true
            }

            PropertyChanges {
                target: _search
                visible: false
            }

            PropertyChanges {
                target: _ind
                running: false
            }
        },

            State {
                name: "log_acc"

                PropertyChanges {
                    target: _ind
                    running: false
                }

                PropertyChanges {
                    target: _search
                    visible: true
                }
            },

            State {
                name: "search"
                PropertyChanges {
                    target: _ind
                    running: true
                }

                PropertyChanges {
                    target: tmr
                    running: true
                }
            }
        ]

        transitions: Transition {
            from: "log_denied"
            to: "log_acc"

            PropertyAnimation{
                target: _autoriz
                to: 0
                property: "opacity"
                duration: 800
            }
        }

        BusyIndicator{
            id: _ind
            anchors.centerIn: parent
        }

        Timer{
            id: tmr
            interval: 1000
            onTriggered: {
                _ind.running = false
            }
        }

        PropertyAnimation{
            id: _wrong
            target: _rect1
            property: "color"
            from: "dark red"
            to: "white"
            duration: 500
        }

        PropertyAnimation{
            id: _acc
            target: _rect1
            property: "color"
            from: "lightgreen"
            to: "white"
            duration: 500
        }
    }
}
