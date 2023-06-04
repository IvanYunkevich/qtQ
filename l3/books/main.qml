import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 500
    height: 314
    title: qsTr("Books")

    ListModel {
        id: books
        ListElement {
            path: "/"
            name: "War and Peace"
            genre: "Novel"
            author: "Lev Tolstoy"
        }
        ListElement {
            path: "/"
            name: "Three Musketeers"
            genre: "adventures"
            author: "Alexandr Duma"
        }
        ListElement {
            path: "/"
            name: "Dune"
            genre: "fantastic"
            author: "Patrick Herbert"
        }
    }

    ListView {
        id: list
        anchors.fill: parent
        model: books
        spacing: 2
        header: Rectangle {
            width: parent.width
            height: 20
            color: "lightgray"
            Text {
                anchors.centerIn: parent
                text: "Library"
                color: "black"
            }
        }
        footer: Rectangle {
            width: parent.width
            height: 20
            color: "lightgray"
            Text {
                anchors.centerIn: parent
                text: "inf about Ivan"
                color: "black"
            }
        }
        section.delegate: Rectangle {
            width: parent.width
            height: 20
            color: "lightcyan"
            Text {
                anchors.centerIn: parent
                text: section
                color: "darkblue"
                font.weight: Font.Bold
            }
        }
        section.property: "genre"
        delegate: Rectangle {
            width: parent.width
            height: 70
            radius: 3
            border.width: 1
            border.color: "darkgrey"
            color: "white"
            Column {
                anchors.fill: parent
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Path"; font.weight: Font.Bold }
                    Text { text: path}
                    spacing: 20
                }
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Name"; font.weight: Font.Bold }
                    Text { text: name}
                    spacing: 20
                }
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Genre"; font.weight: Font.Bold }
                    Text { text: genre}
                    spacing: 20
                }
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Author"; font.weight: Font.Bold }
                    Text { text: author}
                    spacing: 20
                }
            }
        }
    }
}
