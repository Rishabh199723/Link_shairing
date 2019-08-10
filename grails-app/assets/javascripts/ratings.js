var rating = function (username, resourceId, value) {

    for (var i = 1; i <= 5; i++) {
        document.getElementById(i).style.color = "black";
    }

    for (var i = 1; i <= value; i++) {
        document.getElementById(i).style.color = "orange";
    }
    $.ajax({
        "url": url,
        "type": "get",
        "data": {username: username, resourceId: resourceId, value: value},
        success: function () {
            document.getElementById("test").innerHTML = "SUCCESS"
        }
    });

};

var ratingSprint = function (value) {
    for (var i = 1; i <= 5; i++) {

        document.getElementById(i).style.color = "black";
    }

    for (var i = 1; i <= value; i++) {

        document.getElementById(i).style.color = "orange";
    }
};
$(document).ready(function () {
    ratingSprint(ratings);
});