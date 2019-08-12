<!doctype html>
<html>
<head>
    <meta name="layout" content="mainlayout"/>
    <script>
        var url = "${createLink(controller:'Resources', action:'search')}";
        var url1= "${createLink(controller:'Dashboard', action:'dashboard')}";
       /* var box=function(){
            alert("in dashboard");
        }*/
      /* var showsubs=function(){
           $.ajax({
               "url": url1,
               "type": "get",
              /!* "data": ,*!/
               success: function () {
                  /!* document.getElementById("test").innerHTML = "SUCCESS"*!/
               }
           });
       }
        $(document).ready(function(){
           showcontent();
        });*/
    </script>
    <asset:javascript src="search.js"/>
</head>
<body >
<br>
<br>

<div class="col-md-6">
    <p style="color:red">${flash.message3}</p>
    <p id="test1"></p>
    <g:render template="userbox" model="['userdata':userdata]"/>
    <g:render template="subbox" model="['subs':subs,'userdata':userdata,'countofsubs':countofsubs,'countofposts':countofposts]"/>
    <g:render template="topbox" model="['toptopics':toptopics,'toptopicpost':toptopicpost,'toptopicsub':toptopicsub,'tids':tids]"/>
</div>

%{--RIGHT SIDE-----------------------------------}%
<div class="col-md-6">
<g:render template="inbox" model="['resources': resources]"/>
</div>

</body>

</html>