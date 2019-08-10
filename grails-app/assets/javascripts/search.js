
function searchfun() {
    var input, filter;
    input = document.getElementById("search");
    filter = input.value.toLowerCase();
   /* var url = "${createLink(controller:'Resources', action:'search')}";*/
    $.ajax({
        "url": url,
        "type": "get",
        "data": {value: filter},
        success: function (resp) {
            console.log(resp.resources);
            document.getElementById("showResources").innerHTML = resp.resources
        }
    });
}
function Show() {
    console.log("hey");
    document.getElementById("drop").style.display = "block";
}

