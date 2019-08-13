<!doctype html>
<html>
<head>
    <meta name="layout" content="mainlayout"/>
    <script>
        var url = "${createLink(controller:'Resources', action:'search')}";
        var url1= "${createLink(controller:'showsub', action:'showsub')}";
        var url2= "${createLink(controller:'showtrending', action:'showtrending')}";
        var url5= "${createLink(controller:'userinfo', action:'showuserinfo')}";
        var url6="${createLink(controller:'dashboard', action:'gettopiclist')}";
        var url7="${createLink(controller:'dashboard', action:'getsublist')}";
        $(document).ready(function(){
            $("#showtopics").on("show.bs.modal",function(){
                $.ajax({
                    "url": url6,
                    "type": "get",
                    success: function (res) {
                        /* $("#showtopicmodal").html(res.topicmodal)*/
                        var element="";
                        element +="<ul>";
                        var i=0,item;
                        while(item = res[i++]){
                            element +="<li>"+ item+"</li>"
                        }
                        element+="</ul>"
                         $("#showtopicmodal").html(element)
                    }
                });
            });


            $("#showsubscriptions").on("show.bs.modal",function(){
                $.ajax({
                    "url": url7,
                    "type": "get",
                    success: function (res) {
                        console.log(res.submodal);
                        $("#showsubscriptionmodal").html(res.submodal)
                    }
                });
            });
        });

    </script>
    <asset:javascript src="search.js"/>
    <asset:javascript src="check.js"/>
</head>
<body >
<br>
<br>

<div class="col-md-6">
    <p style="color:red">${flash.message3}</p>
    <p id="test1"></p>
    <g:render template="userbox" />
        <g:render template="subbox"/>
    <g:render template="topbox"/>
%{--    <g:render template="subbox" model="['subs':subs,'userdata':userdata,'countofsubs':countofsubs,'countofposts':countofposts]"/>--}%
%{--    <g:render template="topbox" model="['toptopics':toptopics,'toptopicpost':toptopicpost,'toptopicsub':toptopicsub,'tids':tids]"/>--}%
</div>

%{--RIGHT SIDE-----------------------------------}%
<div class="col-md-6">
<g:render template="inbox" model="['resources': resources]"/>
</div>

</body>

</html>