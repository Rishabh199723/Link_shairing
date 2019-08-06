<!doctype html>
<%@ page import="project.*" %>
<html>
<head>
    <meta name="layout" content="mainlayout"/>
</head>

<body>
<br>



    <div class="col-md-6">

        <div class="panel panel-default" style="overflow: auto;height: 220px">
            <div class="panel-heading">${subs.topic.name}</div>
            <div class="panel-body">
                <div class="col-md-3">
                    <asset:image src="${subs.topic.createdBy.photo}" width="100%" height="120px"></asset:image></div>

                <div class="col-md-9">
                    <div style="font-size:23px;"><b
                            style="text-transform: uppercase">${subs.topic.name}</b>(${subs.topic.visibility})</div>

                    <div>@${subs.topic.createdBy.username}</div>

                    <div class="col-md-6">
                        Subscriptions:
                        <div>${subscount}</div></div>

                    <div class="col-md-6">

                        Posts:
                        <div><a>${postcount}</a></div></div>
                </div>

                <div class="row">
                    <div class="col-md-5">
                        <g:if test="${subs.topic.createdBy.username==session.uname}">

                        </g:if>
                        <g:else>
                        <g:if test="${tids.contains(subs.topic.id)}">
                            <g:link controller="Subscription" action="unsubscribe" params="[id: subs.topic.id,page:"dashboard"]">  Unsubscribe </g:link>
                            <br>
                        </g:if>
                        <g:else>
                            <g:link controller="Subscription" action="subscribe" params="[id: subs.topic.id,page:"dashboard"]">  Subscribe </g:link>
                            <br>

                        </g:else>
                        </g:else>
                    </div>

                    <div class="col-md-7">
                        <g:form controller="subscription" action="updateSerious">
                            <g:field type="hidden" name="sid" value="${subs.id}"></g:field>
                            <g:field type="hidden" name="page" value="topic"></g:field>
                            <g:select onChange="submit()" name="seriousness"
                                      from="${['CASUAL', 'SERIOUS', 'VERY_SERIOUS']}"
                                      value="${subs.seriousness}"/>
                        </g:form></div></div>

            </div>

        </div>


        <div class="panel panel-default" style="overflow: auto;height: 350px">
            <div class="panel-heading"><div style="float:left">Users : ${subs.topic.name}</div>

                <div style="margin-left:350px">View all</div>
            </div>

            <div class="panel-body">

                <g:each in="${subscription}" var="us" status="i">

                    <div class="row">
                        <div class="col-md-4">
                            <asset:image src="${us.user.photo}" style="width:100%;height:120px"></asset:image></div>

                        <div class="col-sm-8">
                            <div style="font-size:23px;"><b
                                    style="text-transform: uppercase">${us.user.fName}&nbsp${us.user.lName}</b></div>

                            <div>@${us.user.username}</div>

                            <div class="col-sm-6">
                                Subscriptions:
                                <div>${subscriptioncount.getAt(i)}</div></div>

                            <div class="col-sm-6">

                                Topics:
                                <div><a>${postscount.getAt(i)}</a></div></div>


                        </div></div>
                    <br>

                </g:each>

            </div>

        </div>

    </div>



    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading"><div style="float:left">Posts : ${subs.topic.name}</div>

                <div class="input-group" style="margin-left:350px">
                    <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>

                    <div class="input-group-btn">
                        <button class="btn btn-basic" type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                </div>
            </div>

            <div class="panel-body">
                <g:each in="${resources}" var="res" status="i">
                    <div class="row">
                        <div class="col-md-3">
                            <asset:image src="${res.createdBy.photo}" style="width:100%;height:120px"/>
                        </div>

                        <div class="col-md-9">${res.description}
                        <div class="row">
                        <div class="col-md-3">
                            <g:if test="${res instanceof project.LinkResource}">
                                <a  >Download</a>
                                </div>
                                <div class="col-md-3">
                                <a href="${res.link}" target="_blank">View Full Site</a>
                                </div></g:if>
                            <g:else>
                                <g:link controller="Document" action="download" params="[id:res.id , tid:subs.id]" >Download</g:link>
                                </div>
                                <div class="col-md-3">
                                    <a >View Full Site</a>
                                </div>
                            </g:else>




                                        <div class="col-md-3">
                                        <g:link controller="Reading" action="editread" params="[id:res.id]" >Mark as read</g:link>
                                        </div>




                            <div class="col-md-3">
                                <g:link controller="Resources" action="index" params="[id:res.id]" >View post</g:link>

                            </div>
                        </div>
                    </div>

                    </div>
                    <br>
                </g:each>
            </div>
        </div>







</body>
<script>
    function Show() {
        document.getElementById("drop").style.display = "block";
    }
</script>
</html>
