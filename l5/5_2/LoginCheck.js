function _autorizPage(mainWindow) {
    var component = Qt.createComponent("Authorization.qml");
    var sprite = component.createObject(mainWindow);

    if (sprite === null) {
        console.log("Error");
    }
}

function isCreditalsCorrect(login, password){
    if(login === "1" && password === "1")
        isInput = true;
    else
        isInput = false;
    return isInput;
}

function load() {
    loader.sourceComponent = page_1
}
