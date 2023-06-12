import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "LoginCheck.js" as LoginCheck

Item {
    id: root
    anchors.fill: parent
    property alias login: _login.text
    property alias password: _password.text

    Rectangle {
        width: 300
        height: 300
        anchors.centerIn: parent
        color: "darkgrey"

        Column{
            spacing: 5
            anchors.centerIn: parent
            Label {
                text: "Авторизация"
                font.pixelSize: 24
            }

            TextField {
                id: _login
                font.pixelSize: 15
                color: "black"
                placeholderText: "Логин"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }

            TextField {
                id: _password
                font.pixelSize: 15
                color: "black"
                placeholderText: "Пароль"
                horizontalAlignment: Text.AlignHCenter
                echoMode: TextInput.Password
                width: parent.width
            }

            Button {
                text: "Войти"
                width: parent.width
                height: 30
                onClicked: {
                    if(LoginCheck.isCreditalsCorrect(login, password)){
                        print("acc");
                        LoginCheck.load();
                        root.destroy();
                    }
                    else
                        print("deny");
                }
            }
        }
    }
}
