function DataContext() {
    this.csrf = function() {
        var param = document.getElementsByName("csrf-param")[0].content;
        var val = document.getElementsByName("csrf-token")[0].content
        return {"key": param, "value": val};
    }
    //generic ajax method
    this.ajax = function(method, url, data, callback) {
        var xhr = new XMLHttpRequest();
        auth = this.csrf();
        url += "?" + auth.key + "=" + auth.value;
        data = {dataobj: data};
        xhr.open(method, url);
        xhr.onreadystatechange = function() {
            if (this.readyState == 4) {
                var res = JSON.parse(this.responseText);
                callback(res);
            }
        }
        xhr.setRequestHeader("Content-Type",    
            "application/json");
        xhr.setRequestHeader(auth.key, auth.value);
        xhr.send(JSON.stringify(data));
    }
    //crud methods for the object
    this.create = function(data, callback) {
        this.ajax("POST", "dataobjs.json", data, callback);
    }
    this.index = function(callback) {
        this.ajax("GET", "dataobjs.json", null, callback);
    }
    this.read = function(id, callback) {
        var url = "dataobjs/" + id + ".json";
        this.ajax("GET", url, null, callback);
    }
    this.update =  function(data, callback) {
        var url = "dataobjs/" + data.id + ".json";
        this.ajax("PUT", url, data, callback);
    }
    this.destroy = function(data, callback) {
        var url = "dataobjs/" + data.id + ".json";
        this.ajax("DELETE", url, null, callback);
    }
}

function handle(data) {
    console.log(data);
}

window.dc = new DataContext();