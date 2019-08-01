<!doctype html>
<%@ page import="project.*" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
               <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
               <![endif]-->
    <title>LINK SHARING APPLICATION</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>

    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container"><br>
    <div class="panel panel-default" style="height:70px">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-4">
                    <h4><a href="#"><strong> <u>Link Sharing</u></strong></a></h4>
                </div>
                <div class="col-md-3">
                    <g:form controller="search" action="index">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control" placeholder="Search" id="txtSearch"/>
                        <div class="input-group-btn">
                            <button class="btn btn-basic" type="submit" >
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                    </g:form>
                </div>
                <div class= "col-md-3">
                    <ul class="nav navbar-nav">

                        <li><a href="" data-toggle="modal" data-target="#createtopic" ><span class="glyphicon glyphicon-comment"></span></a></li>
                        <li><a href="" data-toggle="modal" data-target="#sendinvitation" ><span class="glyphicon glyphicon-envelope"></span></a></li>
                        <li><a href="" data-toggle="modal" data-target="#sharelink"><span class="glyphicon glyphicon-link"></span></a></li>
                        <li><a href="" data-toggle="modal" data-target="#sharedocument"><span class="glyphicon glyphicon-file"></span></a></li>

                    </ul>

                </div>

                %{--MODEL FOR CREATE TOPIC---------------------------------------------------------}%

                <div class="modal fade" id="createtopic">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" >Create Topic</h4>
                            </div>
                            <div class="modal-body">
                                <g:form class="form-horizontal" controller="Topic" action="topics" name="topicCreate">
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Name</div>
                                        <div class="col-sm-10">
                                            <input type="text" name="topicName" placeholder="Topic Name"
                                                   class="form-control col-sm-8" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">visibility</div>
                                        <div class="col-sm-10">
                                            <g:select name="visibility" from="${['PUBLIC' , 'PRIVATE']}"
                                                      class="dropdown-toggle btn btn-default col-sm-8"  />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-default">Save</button>
                                        </div>
                                    </div>
                                </g:form>

                            </div>
                        </div>
                    </div></div>

                %{--MODEL FOR SEND INVITATION----------------------------------------------------------}%

                <div class="modal fade" id="sendinvitation">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" >Send Invitation</h4>
                            </div>
                            <div class="modal-body">
                                <g:form class="form-horizontal" controller="Topic" action="topics" name="topicCreate">
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Email</div>
                                        <div class="col-sm-10">
                                            <input type="email" name="topicName" placeholder="Topic Name"
                                                   class="form-control col-sm-8" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Topic</div>
                                        <div class="col-sm-10">
                                            <g:select name="visibility" from="${subs.topic.name}"
                                                      class="dropdown-toggle btn btn-default col-sm-8"  />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-default">Save</button>
                                        </div>
                                    </div>
                                </g:form>

                            </div>
                        </div>
                    </div></div>



                %{--MODEL FOR SHARE LINK----------------------------------------------------------}%



                <div class="modal fade" id="sharelink">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" >Share Link</h4>
                            </div>
                            <div class="modal-body">
                                <g:form class="form-horizontal" controller="Link" action="save" name="linkcreate">
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Link</div>
                                        <div class="col-sm-10">
                                            <input  name="url" placeholder="Url"
                                                   class="form-control col-sm-8" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Description</div>
                                        <div class="col-sm-10">
                                          %{--  <input type="email" name="topicName" placeholder="Topic Name"
                                                   class="form-control col-sm-8" />--}%
                                            <textarea class="form-control col-sm-8" name="description" rows="5" id="comment" name="text"></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Topic</div>
                                        <div class="col-sm-10">
                                            <g:select name="topic" from="${subs.topic.name}"
                                                      class="dropdown-toggle btn btn-default col-sm-8"  />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-default">Share</button>
                                        </div>
                                    </div>
                                </g:form>

                            </div>
                        </div>
                    </div></div>

                %{--MODEL FOR SHARE DOCUMENT-------------------------------------}%

                <div class="modal fade" id="sharedocument">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" >Share Document</h4>
                            </div>
                            <div class="modal-body">
                                <g:form class="form-horizontal" controller="Document" action="save" name="documentcreate" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Document</div>
                                        <div class="col-sm-10">
                                            <div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" id="filename" name="doc"/>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Description</div>
                                        <div class="col-sm-10">
                                            %{--  <input type="email" name="topicName" placeholder="Topic Name"
                                                     class="form-control col-sm-8" />--}%
                                            <textarea class="form-control col-sm-8" name="description" rows="5" id="comment" name="text"></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Topic</div>
                                        <div class="col-sm-10">
                                            <g:select name="topic" from="${subs.topic.name}"
                                                      class="dropdown-toggle btn btn-default col-sm-8"  />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-default">Share</button>
                                        </div>
                                    </div>
                                </g:form>

                            </div>
                        </div>
                    </div></div>







                <div class ="col-md-2">
                  %{--  ${userdata.username}
                    <li class="fa fa-caret-down"  onclick="Show()"></li>
                    <ul class="nav nav-pills nav-stacked" id="drop" style="display:none">
                        <li style="height:20px"><a href="#">Profile</a></li>
                        <li style="height:20px"><a href="/UserList/userlist">Users</a></li>
                        <li style="height:20px"><a href="/Topic/topiclist">Topic</a></li>
                        <li style="height:20px"><a href="#">Posts</a></li>
                        <li style="height:20px"><a href="">Logout</a></li>
                    </ul>--}%

                    <div class="dropdown">
                    <a href="" data-toggle="dropdown" >${userdata.username} <i class="fa fa-caret-down" aria-hidden="true"></i></a>
                        <ul class="dropdown-menu">

                            <g:if test  = "${userdata.admin==true}" >
                                <li><a href="/Profile/editprofile">Profile</a></li>
                            <li><a href="/UserList/userlist">Users</a></li>
                                <li><a href="/Topic/topiclist">Topic</a></li>
                                <li><a href="/Resources/postlist">Posts</a></li>
                                <li><a href="/User/logout">Logout</a></li>
                            </g:if>
                            <g:else>
                                <li><a href="/Profile/editprofile">Profile</a></li>
                                <li><a href="/User/logout">Logout</a></li>
                            </g:else>


                        </ul>
                    </div>

        </div>
    </div>
            <br>
            <br>
    <div class="col-md-6">

        <div class="panel panel-default">

            <div class="panel-body">
                <div class="row">
                <div class="col-md-4">
                    <asset:image src="${userdata.photo}" width="100%" height="100%"></asset:image>
                </div>
                <div class="col-md-8">
                    <div style="font-size:23px;"> <g:link controller="Dashboard" action="viewprofile" > ${userdata.fName} &nbsp ${userdata.lName}</g:link>

                        <p>@${userdata.username}</p>
                        <p>Topics:   &nbsp${topcount}  &nbsp  Subscriptions:${subcounts}</p>
                    </div>
                </div>
                </div>
        </div>
<br>
        </div>
        <div class="panel panel-default" style="overflow: auto;height: 500px">
            <div class="panel-heading">Subscriptions</div>
            <div class="panel-body">
                <g:each var="sub" in="${subs}" status="i">
                    <div class="panel-body">
                        <g:link controller="topic" action="topicshow" params="[id: sub.id]">  ${sub.topic.name} </g:link>
                        <br>
                        <i>@${sub.topic.createdBy.username}</i>
                        <br>
                    <g:if test  = "${sub.topic.createdBy.username==session.uname}" >

                        Subscription : &nbsp ${countofsubs.get(i)} &nbsp &nbsp Posts:${countofposts.get(i)}

                    </g:if>
                    <g:else>
                        <g:link controller="Subscription" action="unsubscribe" params="[id:sub.id, page:"dashboard"]">  Unsubscribe </g:link> &nbsp &nbsp &nbspSubscription: &nbsp ${countofsubs.get(i)} &nbsp &nbsp Posts:${countofposts.get(i)}
                    </g:else>
                        <br>
                        <g:if test  = "${sub.topic.createdBy.username==session.uname}" >
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="list-inline">
                                        <li>
                                            <g:form controller="subscription" action="updateSerious">
                                                <g:field type="hidden" name="sid" value="${sub.id}"></g:field>
                                                <g:field type="hidden" name="page" value="dashboard"></g:field>
                                                <g:select onChange="submit()" name="seriousness" from="${['CASUAL','SERIOUS','VERY_SERIOUS']}"
                                                          value="${sub.seriousness}" />
                                            </g:form>
                                        </li>
                                        <li>
                                            <g:form controller="topic" action="updatevisibility">
                                                <g:field type="hidden" name="id" value="${sub.topicId}"></g:field>
                                                <g:select onChange="submit()" name="visibility" from="${['PUBLIC','PRIVATE']}" value="${sub.topic.visibility}" />
                                            </g:form>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </g:if>
                        <g:else>
                            <g:form controller="subscription" action="updateSerious">
                                <g:field type="hidden" name="sid" value="${sub.id}"></g:field>
                                <g:field type="hidden" name="page" value="dashboard"></g:field>
                                <g:select onChange="submit()" name="seriousness" from="${['CASUAL','SERIOUS','VERY_SERIOUS']}" value="${sub.seriousness}" />
                            </g:form>
                        </g:else>

                    </div>
                </g:each>
            </div>

        </div>


        <div class="panel panel-default" style="overflow: auto;height: 500px">
            <div class="panel-heading">Top posts</div>
            <div class="panel-body">
                <g:each var="topic" in="${toptopics}" status="i">
                    <div class="panel-body">
                        <g:link controller="topic" action="topicshow" params="[id: topic.id]">  ${topic.name} </g:link>
                        <br>
                        <i>@${topic.createdBy.username}</i>
                        <br>
                        <g:if test="${tids.contains(topic.id)}">
                            <g:link controller="Subscription" action="unsubscribe" params="[id: topic.id,page:"dashboard"]">  Unsubscribe </g:link> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                            <br>
                        </g:if>
                        <g:else>
                            <g:link controller="Subscription" action="subscribe" params="[id: topic.id,page:"dashboard"]">  Subscribe </g:link> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                            <br>

                        </g:else>
                       %{-- <a href="#" >Unsubscribe</a> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                        <br>--}%


                    </div>
                </g:each>

            </div>
        </div>
    </div>

            %{--RIGHT SIDE-----------------------------------}%
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading"><div style="float:left">Inbox</div>
                        <div style="margin-left:350px">View all</div>
                    </div>
                    <div class="panel-body">
                        <g:each in="${resources}" var="res" status="i">
                            <li>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asset:image src="image.jpeg" style="width:70px;height:70px"/></div>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <b>${res.createdBy.fName}&nbsp${res.createdBy.lName}</b></div>
                                            <div class="col-sm-5">@${res.createdBy.username}</div>
                                            <a class=col-sm-3>${res.topic.name}</a></div>
                                        <div class="row">
                                            ${res.description}
                                        </div>
                                    <div class="row">
                                    <div class="col-md-3">
                                        <g:if test="${res instanceof project.LinkResource}">
                                            <a >Download</a>
                                           </div>
                                         <div class="col-md-3">
                                         <a href="${res.link}">View Full Site</a>
                                           </div></g:if>
                                        <g:else>

                                            <g:link controller="Document" action="download" params="[id:res.id , tid:res.id ,page:"dashboard"]" >Download</g:link>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="${res.link}">View Full Site</a>
                                            </div></g:else>
                                        <div class="col-md-3">
                                            <g:link controller="reading" action="editread" params="[id:res.id]">Mark as read</g:link>
                                        </div>
                                        <div class="col-md-3">
                                            <g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>
                                        </div>
                                    </div>

                            </li>
                        </g:each>
                    </div>
                </div>
            </div>
</div>



</div>
</div>
</body>
<script>
    function Show()
    {
        document.getElementById("drop").style.display="block";
    }
</script>
</html>