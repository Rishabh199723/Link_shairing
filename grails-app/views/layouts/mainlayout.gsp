<%--
  Created by IntelliJ IDEA.
  User: rishabh
  Date: 05/08/19
  Time: 4:24 PM
--%>
<%@ page import="project.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
<g:layoutHead/>
</head>

<body>
<div class="container"><br>
    <div class="panel panel-default" style="height:70px">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-4">
                    <h4><a href="/dashboard/dashboard"><strong> <u>Link Sharing</u></strong></a></h4>
                </div>
                <div class="col-md-3">
                    <g:form controller="search" action="index">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Search" id="txtSearch"/>
                            <div class="input-group-btn">
                                <button class="btn btn-basic" type="submit" >
                                    <span class="glyphicon glyphicon-search" style="height: 21px"></span>
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
                                            <input type="text" required="true" name="topicName" placeholder="Topic Name"
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
                                <g:form class="form-horizontal" controller="Topic" action="sendInvite" name="topicCreate">
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Email</div>
                                        <div class="col-sm-10">
                                            <input type="email" required="true" name="email" placeholder="Enter email"
                                                   class="form-control col-sm-8" />
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
                                            <button type="submit" class="btn btn-default">Send</button>
                                        </div>
                                    </div>
                                </g:form>

                            </div>    @Secured(['ROLE_ADMIN','ROLE_USER'])
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
                                            <g:select name="topicname" from="${subs.topic.name}"
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
                                            <g:select name="topicname" from="${subs.topic.name}"
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


                %{--MODAL FOR SUBSCRIPTIONS SHOW--}%
                <div class="modal fade" id="showsubscriptions">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" >Topic names subscribed</h4>
                            </div>
                            <div class="modal-body">
                                <ul>
                                    <g:each in="${subs}" var="sub" status="i">
                                        <g:link controller="topic" action="topicshow" params="[id:sub.id]"><li>${sub.topic.name}</li></g:link>
                                    </g:each>
                                </ul>
                            </div>
                        </div>
                    </div></div>


                %{--MODAL FOR TOPICSHOW--}%

                <div class="modal fade" id="showtopics">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" >Topic names created</h4>
                            </div>
                            <div class="modal-body">
                                <ul>
                                    <g:each in="${subs}" var="sub" status="i">
                                        <g:if test="${sub.topic.createdBy.username==session.uname}">
                                            <g:link controller="topic" action="topicshow" params="[id:sub.id]"><li>${sub.topic.name}</li></g:link>
                                        </g:if>
                                    </g:each>
                                </ul>
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
                                <li><a href="/logout">Logout</a></li>
                            </g:if>
                            <g:else>
                                <li><a href="/Profile/editprofile">Profile</a></li>
                                <li><a href="/logout">Logout</a></li>
                            </g:else>


                        </ul>
                    </div>

                </div>
            </div>
            <g:layoutBody/>


        </div>



    </div>
</div>
</body>
</html>