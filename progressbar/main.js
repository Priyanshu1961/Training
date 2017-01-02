var count = 0;
var button = $('#countButton')[0];
var display = $('#displayCount')[0];
$(document).ready(function() {

    $("#countButton").click(function() {
        count++;
        display.innerHTML = count;
    });
    $("#barButton").click(function() {
        var elem = document.getElementById("myBar");
        var width = 0;
        var id = setInterval(frame, 3000);

        function frame() {
            if (width >= 100) {
                clearInterval(id);
                $("#barButton")[0].disabled = false;
            } else {
                $("#barButton")[0].disabled = true;
                width++;
                elem.style.width = width + '%';
                  $("#label")[0].innerHTML = width * 1 + '%';
            }
        }
    });
});
