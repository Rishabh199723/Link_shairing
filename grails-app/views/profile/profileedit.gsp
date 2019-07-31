<%--
  Created by IntelliJ IDEA.
  User: rishabh
  Date: 28/07/19
  Time: 8:50 PM
--%>

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
                <div class="col-md-3"></div>
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
                        <a href="" data-toggle="dropdown" >${session.uname} <i class="fa fa-caret-down" aria-hidden="true"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="/Profile/editprofile">Profile</a></li>
                            <li><a href="/User/logout">Logout</a></li>
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
                                <img src="${userdata.photo}"></img>
                            </div>
                            <div class="col-md-8">
                                <div style="font-size:23px;"><b>${userdata.fName} &nbsp ${userdata.lName}</b>

                                    <p>@${userdata.username}</p>
                                    <p>Topics:   &nbsp${topcount}  &nbsp  Subscriptions:${subcounts}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="panel panel-default" style="overflow: auto;height: 500px">
                    <div class="panel-heading">Topics</div>
                    <div class="panel-body">
                        <g:each var="sub" in="${subs}" status="i">
                            <div class="panel-body">
                                <g:if test  = "${sub.topic.createdBy.username==session.uname}" >
                                    <g:link controller="topic" action="topicshow" params="[id: sub.id]">  ${sub.topic.name} </g:link>
                                <br>
                                <i>@${userdata.username}</i>
                                <br>
                                <g:link controller="Subscription" action="unsubscribe" params="[id: sub.id]">  Unsubscribe </g:link> &nbsp &nbsp &nbspSubscription: &nbsp ${countofsubs.get(i)} &nbsp &nbsp Posts:${countofposts.get(i)}
                                <br>

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


                            </div>
                        </g:each>
                    </div>

                </div>
            </div>

            %{--Right side--------------------------------}%

            <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">Profile</div>
                <div class="panel-body">
                    <g:form class="form-horizontal"  controller="Profile" action="profile" enctype="multipart/form-data">
                        <div class="form-group">
                            <text class="control-label col-md-4" for="email" style="text-align: left;">First Name *</text>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="email" placeholder="Enter firstname" name="fname">
                            </div>
                        </div>
                        <div class="form-group">
                            <text class="control-label col-md-4" for="email" style="text-align: left;">Last Name *</text>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="email" placeholder="Enter lastname" name="lname">
                            </div>
                        </div>
                        <div class="form-group">
                            <text class="control-label col-md-4" for="email" style="text-align: left;">Username *</text>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="email" placeholder="Enter Username" name="username">
                            </div>
                        </div>
                        <div class="form-group">
                            <text class="control-label col-md-4 " for="pwd" style="text-align: left;">Photo</text>

                            <div class="col col-md-5">
                                <input type="file" class="btn btn-basic"></input>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class=" col-md-8">
                            </div>
                            <div class=" col-md-4">
                                <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">Change Password</div>
                <div class="panel-body">
                    <g:form class="form-horizontal"  controller="Profile" action="password" >

                        <div class="form-group">
                            <text class="control-label col-md-4" for="pwd" style="text-align: left;">Password *</text>
                            <div class="col-md-8">
                                <input type="password" class="form-control" id="email" placeholder="Password" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <text class="control-label col-md-4" for="pwd" style="text-align: left;">ConfirmPassword*</text>
                            <div class="col-md-8">
                                <input type="password" class="form-control" id="email" placeholder="Confirm password" name="confirmpass">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class=" col-md-8">
                            </div>
                            <div class=" col-md-4">
                                <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>

        </div>



             </div>
</div>

</body>
</html>