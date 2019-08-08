<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>

    <meta name="layout" content="mainlayout"/>
    <script>
        var url = "${createLink(controller:'Rating',action:'save')}"
        var ratings="${rating}"
    </script>
    <asset:javascript src="ratings.js"/>
</head>

<body >
<br>


    <g:render template="editlink"/>

    <g:render template="editdoc"/>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <g:render template="postbox"/>
            </div>

            <div class="col-md-6">

                <g:render template="/dashboard/topbox"
                          model="['toptopics': toptopics, 'toptopicpost': toptopicpost, 'toptopicsub': toptopicsub, 'tids': tids]"/>

            </div>
        </div>
    </div>

</body>
</html>









