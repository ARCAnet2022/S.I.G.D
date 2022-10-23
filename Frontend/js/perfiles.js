var ajax = new XMLHttpRequest();
var method = "GET";
var URL = "Backend/App/Controladores/profileController.php";
var asynchronus = true;

ajax.open(method, url, asynchronus);

ajax.send();

ajax.onreadystatechange = function () {
    if(this.readyState == 4 && this.status == 200){
        alert();
    }
}