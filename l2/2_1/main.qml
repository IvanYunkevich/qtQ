import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 500
    visible: true
    color: "pink"
    title: qsTr("Registration")

    Rectangle {
        id: _meeting
        color: "pink"
        anchors.centerIn: parent
        width: 600
        height: 440

        Column {
            anchors.fill: parent
        Row {
             spacing: 16

            Column {
                id: _yourInformation
                padding: 32
                spacing: 16

                Label {
                    text: "About you:"
                }

                TextField {
                    id: _name
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Name")
                }

                Row {
                    spacing: 10
                    Label {
                        text: "Sex"
                    }
                    ComboBox {
                        id: _sex
                        model: ["Male", "Female"]
                    }
                }
                
                states: [
                   State {
                   name: "choose"
                   PropertyChanges { target: _meeting; color: "lightcyan"}
                   when: _sex.currentText === "Male"
                       }
                ]

                TextField {
                    id: _age
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Age")
                }

                Column {
                    spacing: 10
                    Label{
                        text: "Education"
                    }
                    ComboBox {
                        id: _yourEducation
                        model: ["Additional education", "Higher education", "Professional education"]
                    }
                }

                TextField {
                    id: _yourProfession
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Profession")
                }

                TextField {
                    id: _hobby
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Hobby")
                }

                TextField {
                    id: _city
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("City")
                }
                TextField {
                    id: _info
                    width: 150
                    height: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Information about yourself")
                }
            }

            Column {
                id: _partnerInformation
                padding: 32
                spacing: 16

                Label {
                    text: "Find a partner:"
                }

                Row {
                    spacing: 5
                    Label {
                        text: "Age"
                    }
                    TextField {
                        id: _ageFrom
                        placeholderText: qsTr("From")
                        width: 40
                    }
                    Label {
                        text: " - "
                    }
                    TextField {
                        id: _ageTill
                        placeholderText: qsTr("Till")
                        width: 40
                    }
                }

                Row {
                    spacing: 10
                    Label {
                        text: "Sex"
                    }
                    ComboBox {
                        id: _partSex
                        model: ["Female", "Male"]
                    }
                }

                Column {
                    spacing: 10
                    Label{
                        text: "Education"
                    }
                    ComboBox {
                        id: _education
                        model: ["Additional education", "Higher education", "Professional education"]
                    }
                }

                TextField {
                    id: _profession
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Profession")
                }
            }
        }
            Button {
                id: _registrationButton
                width: 100
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Registration")
                onClicked: {
                    console.log("User info - Name: " + _name.text + ", Sex: " + _sex.currentText +
                                ", Age: " + _age.text + ", Education: " + _yourEducation.currentText + ", Profession: " + _yourProfession.text +
                                ", Hobby: " + _hobby.text + ", City: " + _city.text +
                                " Information about yourself: " + _info.text)
                    console.log("Partner info - age from: " + _ageFrom.text + " till " + _ageTill.text +
                                ", Sex: " + _partSex.currentText  + ", Education: " + _education.currentText + ", Profession: " + _profession.text)
                }
            }
        }
    }
}
