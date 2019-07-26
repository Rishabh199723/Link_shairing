<!doctype html>
<%@ page import="rx.bootcamp.*" %>
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
                        <li><a href="" data-toggle="modal" ><span class="glyphicon glyphicon-link"></span></a></li>
                        <li><a href="" data-toggle="modal" ><span class="glyphicon glyphicon-file"></span></a></li>

                    </ul>

                </div>

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


                <div class ="col-md-2">
                    ${userdata.username}
                    <li class="fa fa-caret-down"  onclick="Show()"></li>
                    <ul class="nav nav-pills nav-stacked" id="drop" style="display:none">
                        <li style="height:20px"><a href="#">Profile</a></li>
                        <li style="height:20px"><a href="/UserList/userlist">Users</a></li>
                        <li style="height:20px"><a href="/Topic/topiclist">Topic</a></li>
                        <li style="height:20px"><a href="#">Posts</a></li>
                        <li style="height:20px"><a href="">Logout</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <div class="col-md-5">

        <div class="panel panel-default">

            <div class="panel-body">
                <img src="${userdata.photo}"></img>
                <div style="font-size:23px;"><b>${userdata.fName} &nbsp ${userdata.lName}</b>

                    <p>@${userdata.username}</p>
                    <p>Topics:   &nbsp${topcount}  &nbsp  Subscriptions:${subcounts}</p>



            </div>
        </div>
<br>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">Subscriptions</div>
            <div class="panel-body">
                <g:each var="sub" in="${subs}" status="i">
                    <div class="panel-body">
                        <a href="#">${sub.topic.name}</a>
                        <br>
                        <i>@${userdata.username}</i>
                        <br>
                        <a href="#" >Unsubscribe</a> Subscription: &nbsp ${countofsubs.get(i)} &nbsp &nbsp Posts:${countofposts.get(i)}
                        <br>
                        <g:if test  = "${sub.topic.createdBy.username==session.uname}" >
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="list-inline">
                                        <li>
                                            <g:form controller="subscription" action="updateSerious">
                                                <g:field type="hidden" name="sid" value="${sub.id}"></g:field>
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
                                <g:select onChange="submit()" name="seriousness" from="${['CASUAL','SERIOUS','VERY_SERIOUS']}" value="${sub.seriousness}" />
                            </g:form>
                        </g:else>

                    </div>
                </g:each>
            </div>

        </div>
        <div class="panel panel-default">
            <div class="panel-heading">Top posts</div>
            <div class="panel-body">
                <g:each var="topic" in="${toptopics}" status="i">
                    <div class="panel-body">
                        <a href="#">${topic.name}</a>
                        <br>
                        <i>@${userdata.username}</i>
                        <br>
                        <a href="#" >Unsubscribe</a> Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                        <br>


                    </div>
                </g:each>

            </div>





        </div>

    </div>
    <div class="col-md-5">

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