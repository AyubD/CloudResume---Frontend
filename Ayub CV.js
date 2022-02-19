const Http = new XMLHttpRequest();
const url = 'https://n85tbntfak.execute-api.us-east-1.amazonaws.com/default/test2'
Http.open("GET", url);
Http.send();

Http.onreadystatechange = function() {
    document.getElementById('replaceme').innerText = this.responseText
}

