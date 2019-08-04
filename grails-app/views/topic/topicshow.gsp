<!doctype html>
<%@ page import="project.*" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!--[if IE]>
               <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
               <![endif]-->
    <title>LINK SHARING APPLICATION</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>

    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
          integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container"><br>

    <div class="panel panel-default" style="height:70px">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-4">
                    <h4><a href="/Dashboard/dashboard"><strong><u>Link Sharing</u></strong></a></h4>
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

                <div class="col-md-3">
                    <ul class="nav navbar-nav">


                        <li><a href="" data-toggle="modal" data-target="#sharelink"><span
                                class="glyphicon glyphicon-link"></span></a></li>
                        <li><a href="" data-toggle="modal" data-target="#sharedocument"><span class="glyphicon glyphicon-file"></span></a></li>

                    </ul>

                </div>


                       %{-- MODEL FOR LINK SHARE--}%

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
                                            <g:field type="hidden" name="topicname" value="${subs.topic.name}"></g:field>
                                            <input type="text" name="topic" value="${subs.topic.name}" disabled
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


                %{--MODEL FOR DOCUMENT SHARE--}%
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
                                            <g:field type="hidden" name="topicname" value="${subs.topic.name}"></g:field>
                                            <input name="topic" value="${subs.topic.name}" disabled
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




                <div class="col-md-2">
                    <div class="dropdown">
                        <a href="" data-toggle="dropdown" >${user.username} <i class="fa fa-caret-down" aria-hidden="true"></i></a>
                        <ul class="dropdown-menu">

                            <g:if test  = "${user.admin==true}" >
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
        </div>
    </div>

    <div class="col-md-5">

        <div class="panel panel-default" style="overflow: auto;height: 220px">
            <div class="panel-heading">${subs.topic.name}</div>

            <div class="panel-body">
                <div class="col-md-3">
                    <asset:image src="${subs.topic.createdBy.photo}" width="100%" height="100%"></asset:image></div>

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
                        <g:if test="${tids.contains(subs.topic.id)}">
                            <g:link controller="Subscription" action="unsubscribe" params="[id: subs.topic.id,page:"dashboard"]">  Unsubscribe </g:link>
                            <br>
                        </g:if>
                        <g:else>
                            <g:link controller="Subscription" action="subscribe" params="[id: subs.topic.id,page:"dashboard"]">  Subscribe </g:link>
                            <br>

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
                            <asset:image src="${us.user.photo}" style="width:100%;height:100%"></asset:image></div>

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

    <div class="col-md-1">
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
                        <div class="col-md-4">
                            <asset:image src="images.jpeg" style="width:60px;height:60px"/>
                        </div>

                        <div class="col-md-8">${res.description}
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
    </div>


    <div class="modal fade" id="createLink" tabindex="-1" role="dialog" aria-labelledby="createLink">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Create Link</h4>
                </div>

                <div class="modal-body">
                    <g:form class="form-horizontal" controller="Resource" action="save">
                        <div class="form-group">
                            <label for="link" class="col-sm-2 control-label">Link</label>

                            <div class="col-sm-10">
                                <g:field type="url" class="form-control col-sm-8" name="url"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description" class="col-sm-2 control-label">Description</label>

                            <div class="col-sm-10">
                                <g:textArea name="description" class="col-sm-8 form-control"/>
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
        </div>
    </div>

</div>

</body>
<script>
    function Show() {
        document.getElementById("drop").style.display = "block";
    }
</script>
</html>
