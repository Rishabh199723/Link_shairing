var showsubs=function(){

    $.ajax({
        "url": url1,
        "type": "get",
        /* "data": ,*/
        success: function (res) {
            $("#subscriptionsshow").html(res.subscriptions)
        }
    });
}

var showtrending=function(){
    $.ajax({
        "url": url2,
        "type": "get",
        /* "data": ,*/
        success: function (res) {
        $("#topshows").html(res.toptopics)
        }
    });
}


var showuserinfo=function(){
    $.ajax({
        "url": url5,
        "type": "get",
        /* "data": ,*/
        success: function (res) {

            $("#usershows").html(res.userinfo)
        }
    });
}

$(document).ready(function(){
    showsubs();
    showtrending();
    showuserinfo();
});