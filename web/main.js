function  getURLParam(key) {
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);

  return urlParams.get(key);
}

function fetchJSONFile(path, callback) {
  console.log("url:" + path);
  var httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = function() {
    if (httpRequest.readyState === 4) {
      if (httpRequest.status === 200 || httpRequest.status === 0) {
        var data = JSON.parse(httpRequest.responseText);
        if (callback) callback(data);
      } else {
        alert("ERROR : " + httpRequest.status + " : ·" + httpRequest.responseText);
      }
    }
  };
  httpRequest.setRequestHeader('content-type', 'application/json');
  httpRequest.open('GET', path, true);
  httpRequest.send(); 
}

document.addEventListener('DOMContentLoaded', function() {
  var url=getURLParam("url");
  if ( !url ) url="https://drive.google.com/uc?export=download&id=17km7yRqEAKCyDi9adGeiTcaS--JQl3zJ";
  fetchJSONFile(url, data => {
    alert(data);
  });
});
