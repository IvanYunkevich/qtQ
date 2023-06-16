function getNums(year) {
    listview.model.clear()
    var xmlhttp = new XMLHttpRequest();
    var url = "http://numbersapi.com/" + year + "/year";
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status === 200) {
            listview.model.append({"event":xmlhttp.responseText})
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
