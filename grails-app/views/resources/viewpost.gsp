<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>

    <meta name="layout" content="mainlayout"/>


</head>
<body onload="Ratingsprint('${rating}')">
<br>





               %{--MODEL FOR EDIT link post--}%
               <g:render template="editlink"/>


               %{--MODAL FOR EDIT DOCUMENT--}%
                <g:render template="editdoc"/>

             <div class="container">
             <div class="row">
             <div class="col-md-6">
            <g:render template="postbox"/>
            </div>
                 <div class="col-md-6">

                             <g:render template="/dashboard/topbox" model="['toptopics':toptopics,'toptopicpost':toptopicpost,'toptopicsub':toptopicsub,'tids':tids]"/>

                 </div>
             </div>
             </div>
<script>
    function Rating(username , resourceId , value)
    {

        for(var i=1;i<=5;i++)
        {
            document.getElementById(i).style.color="black";
        }

        for(var i=1;i<=value;i++)
        {
            document.getElementById(i).style.color="orange";
        }

        url="${createLink(controller:'Rating',action:'save')}"


        $.ajax({
            "url":     url,
            "type":    "get",
            "data":    {username : username , resourceId : resourceId , value : value},
            success: function(){
                document.getElementById("test").innerHTML="SUCCESS"
            }
        });

    }
    function Ratingsprint(value)
    {
        console.log("inside")
        for(var i=1;i<=5;i++)
        {

            document.getElementById(i).style.color="black";
        }

        for(var i=1;i<=value;i++)
        {
            document.getElementById(i).style.color="orange";
        }
    }
</script>
</body>
</html>









