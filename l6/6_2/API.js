function getInfo() {
    var xmlhttp = new XMLHttpRequest();

    var date  = new Date();
     var day = date.getDate();
    if (day < 10)
        day = "0" + day
    var month = date.getMonth();
    if (month < 10)
        month = "0" + month
    var today = day + "/" + month + "/" + date.getFullYear();

    var url = "http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1="+today+"&date_req2="+today+"&VAL_NM_RQ=R01235";

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status === 200) {
            print(xmlhttp.responseText)
            parse(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function parse(response) {
    var rate = response.slice(response.indexOf('<Value>') + 7, response.indexOf('</Value>'))
    rate = rate.replace(/\,/g, '.');

    if (_usd.text === "" && _rub.text !== "" || _usd.text !== "" && _rub.text !== "")
        _usd.text = (_rub.text / rate).toFixed(2);
    if (_usd.text !== "" && _rub.text === "")
        _rub.text = (_usd.text * rate).toFixed(2);
}
