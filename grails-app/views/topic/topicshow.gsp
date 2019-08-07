<!doctype html>
<%@ page import="project.*" %>
<html>
<head>
    <meta name="layout" content="mainlayout"/>
</head>
<body>
<br>
    <div class="col-md-6">
        <g:render template="topicdesc" model="['subs':subs,'subscount':subscount,'postcount':postcount,'tids':tids]"/>
        <g:render template="usershow" model="['subs':subs,'subscription':subscription,'us':us,'subscriptioncount':subscriptioncount,'postscount':postscount]"/>
    </div>
    <div class="col-md-6">
    <g:render template="postshow" model="['subs':subs,'resources':resources]"/>
        </div>
</body>
<script>
    function Show() {
        document.getElementById("drop").style.display = "block";
    }
</script>
</html>
