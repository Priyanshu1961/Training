var count = 0;
var button = document.getElementById("countButton");
var display = document.getElementById("displayCount");

button.onclick = function(){
  count++;
  display.innerHTML = count;
}
function move() {
  var elem = document.getElementById("myBar");
  var width = 0;
  var id = setInterval(frame, 3000);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
      document.getElementById("barButton").disabled = false;
    } else {
      document.getElementById("barButton").disabled = true;
      width++;
      elem.style.width = width + '%';
      document.getElementById("label").innerHTML = width * 1  + '%';
    }
  }
}
