<!doctype html>
<html>
<head>
    <meta name="layout" content="mainlayout"/>
    <script>
        function searchfun() {
            var input, filter;


            input = document.getElementById("search");
            filter = input.value.toLowerCase();
            var url = "${createLink(controller:'Resources',action:'search')}"

            $.ajax({
                "url": url,
                "type": "get",
                "data": {value: filter},
                success: function (resp) {
                    console.log(resp.resources)
                    document.getElementById("showResources").innerHTML = resp.resources

                }
            });
        }

        function Show() {
            console.log("hey")
            document.getElementById("drop").style.display = "block";
        }
    </script>
</head>

<body>
<br>
<br>

<div class="col-md-6">

    <p style="color:red">${flash.message3}</p>
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