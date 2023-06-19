import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.qmlmodels 1.0
import QtQuick.LocalStorage 2.12
import QtQuick.Controls 2.15

import "DBFunctions.js" as DbFunctions

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("DB")

    property int cellHorizontalSpacing: 10

    function dbDraw() {
        var db = LocalStorage.openDatabaseSync("DBExample", "1.0", "Пример локальной базы данных", 1000)
        var tableName = tableNameComBox.currentText
        try {
            db.transaction((tx) => { DbFunctions.readContacts(tx, tableName, table.model) })
        } catch (err) {
            console.log("Error creating or updating table in database: " + err)
        }
    }

    Row {
        id: _row
        x: 20
        ComboBox {
            id: tableNameComBox
            x: 20
            y: 15
            model: ["contacts", "table2", "table3"]
            onActivated: {
                dbDraw()
            }
        }
    }

    Row {
        id: _row2
        x: 424
        spacing: 5

        TextField {
            x: 100
            y: 15
            width: 50
            id: textIdEdit
            placeholderText: qsTr("ряд")
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            id: _button
            y: 13
            text: "редактировать"
            onClicked: {
                var db = LocalStorage.openDatabaseSync("DBExample", "1.0", "Пример локальной базы данных", 1000)
                try {
                    db.transaction((tx) => { DbFunctions.readEntry(tx, tableNameComBox.currentText, textIdEdit.text) })
                } catch (err) {
                    console.log("Error read table in database: " + err)
                }
                updateDialog.open()
            }
        }
    }

    Column {
        id: _column
        x: 20
        y: 50
        width: 600
        height: 400

        TableModel {
            id: tableModel
            TableModelColumn { display: "id" }
            TableModelColumn { display: "first_name" }
            TableModelColumn { display: "last_name" }
            TableModelColumn { display: "email" }
            TableModelColumn { display: "phone" }
            rows: []
        }

        TableView {
            id: table
            anchors.fill: parent
            columnSpacing: 1
            rowSpacing: 1
            model: tableModel

            ItemSelectionModel {
                id: ism
                model: table.model
            }

            delegate: Rectangle {
                implicitWidth: Math.max(100, /*left*/ cellHorizontalSpacing + innerText.width + /*right*/ cellHorizontalSpacing)
                implicitHeight: 50
                border.width: 1
                Text {
                    id: innerText
                    text: display
                    anchors.centerIn: parent
                }

            }
        }
    }

    Dialog {
        id: updateDialog
        anchors.centerIn: parent
        title: "Редактирование"
        standardButtons: Dialog.Save | Dialog.Cancel

        Column {
            anchors.fill: parent
            spacing: 5
            TextField {
                id: updateFirstName
            }
            TextField {
                id: updateLastName
            }
            TextField {
                id: updateEmail
            }
            TextField {
                id: updatePhone
            }
        }

        onAccepted: {
            var db = LocalStorage.openDatabaseSync("DBExample", "1.0", "Пример локальной базы данных", 1000)
            try {
                db.transaction((tx) => { DbFunctions.updateEntry(tx, tableNameComBox.currentText, textIdEdit.text)})
            } catch (err) {
                console.log("Error updating table in database: " + err)
            }
            dbDraw()
        }
    }

    Component.onCompleted: {
        dbDraw()
    }
}
