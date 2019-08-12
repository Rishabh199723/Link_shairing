<!doctype html>
<html>
<head>
    <meta name="layout" content="mainlayout"/>
    <script>
        var url = "${createLink(controller:'Resources', action:'search')}";
        var url1= "${createLink(controller:'showsub', action:'showsub')}";
        var url2= "${createLink(controller:'showtrending', action:'showtrending')}";




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
    <g:render template="userbox" model="['userdata':userdata]"/>
%{--    <div id="showsubscriptions"></div>--}%
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