<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <style>
    .rate {
        float: left;
        height: 46px;
        padding: 0 10px;
    }
    .rate:not(:checked) > input {
        position:absolute;
        top:-9999px;
    }
    .rate:not(:checked) > label {
        float:right;
        width:1em;
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:30px;
        color:#ccc;
    }
    .rate:not(:checked) > label:before {
        content: '★ ';
    }
    .rate > input:checked ~ label {
        color: #ffc700;
    }
    .rate:not(:checked) > label:hover,
    .rate:not(:checked) > label:hover ~ label {
        color: #deb217;
    }
    .rate > input:checked + label:hover,
    .rate > input:checked + label:hover ~ label,
    .rate > input:checked ~ label:hover,
    .rate > input:checked ~ label:hover ~ label,
    .rate > label:hover ~ input:checked ~ label {
        color: #c59b08;
    }
    </style>
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
<body onload="Ratingsprint('${rating}')">
<div class="container"><br>
       <div class="panel panel-default" style="height:70px">
         <div class="panel-body">
           <div class="container">
             <div class="col-md-4">
               <h4><a href="#"><strong> <u>Link Sharing</u></strong></a></h4>
             </div>
             <div class="col-md-3">
               <div class="input-group">
                 <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
                 <div class="input-group-btn">
                   <button class="btn btn-basic" type="submit">
                     <span class="glyphicon glyphicon-search"></span>
                   </button>
                 </div>
               </div>
             </div>
             <div class= "col-md-3">
              <ul class="nav navbar-nav">

                     <li><a href="" data-toggle="modal" data-target="#createtopic"  ><span class="glyphicon glyphicon-comment"></span></a></li>
                     <li><a href="" data-toggle="modal" data-target="#sendinvitation" ><span class="glyphicon glyphicon-envelope"></span></a></li>
                     <li><a href="" data-toggle="modal" data-target="#createLink" ><span class="glyphicon glyphicon-link"></span></a></li>
                     <li><a href="" data-toggle="modal" ><span class="glyphicon glyphicon-file"></span></a></li>

                 </ul>

             </div>

              %{-- MODEL FOR CREATE TOPIC--}%

<div class="modal fade" id="createtopic">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" >Create Topic</h4>
        </div>
        <div class="modal-body">
        <g:form class="form-horizontal" controller="topic" action="create" name="topicCreate">
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
                                                 <g:select name="visibility" from="${['public' , 'private']}"
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

               %{--MODEL FOR EDIT post--}%
               <div class="modal fade" id="editlink">
                   <div class="modal-dialog">
                       <!-- Modal content-->
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal">&times;</button>
                               <h4 class="modal-title" >Edit Link</h4>
                           </div>
                           <div class="modal-body">
                               <g:form class="form-horizontal" controller="Link" action="updatelink" name="linkcreate">
                                   <g:field type="hidden" name="id" value="${resource.id}"></g:field>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Link</div>
                                       <div class="col-sm-10">
                                           <input  name="url" <g:if test = "${resource.hasProperty("link")}">value="${resource.link}"</g:if>
                                                   class="form-control col-sm-8" />
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Description</div>
                                       <div class="col-sm-10">
                                           <textarea class="form-control col-sm-8" name="description" rows="5" id="comment" name="text" >${resource.description}</textarea>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Topic</div>
                                       <div class="col-sm-10">
                                           <input name="topic" value="${resource.topic.name}" disabled
                                           />
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-offset-2 col-sm-10">
                                           <button type="submit" class="btn btn-default">Edit</button>
                                       </div>
                                   </div>
                               </g:form>
                           </div>
                       </div>
                   </div></div>



       <div class ="col-md-2">
                   ${session.uname}

                   <li class="fa fa-caret-down"  onclick="Show()"></li>
                   <ul class="nav nav-pills nav-stacked" id="drop" style="display:none">
                     <li style="height:20px"><a href="#">Profile</a></li>
                     <li style="height:20px"><a href="#">Users</a></li>
                     <li style="height:20px"><a href="#">Topics</a></li>
                     <li style="height:20px"><a href="#">Posts</a></li>
                     <li style="height:20px"><a href="">Logout</a></li>
                   </ul>

                   </div>
                 </div>
               </div>
             </div>
             <div class="container">
             <div class="row">
             <div class="col-md-6">


        <div class="panel panel-default">


                               <div class="panel-body">
                               <div class="row">
                               <div class="col-md-2">
                               <asset:image src="images.jpeg" style="width:70px;height:70px"/></div>
                               <div class="col-md-4">
                               <div style="font-size:18px;"><b>${resource.createdBy.fName}&nbsp${resource.createdBy.lName}</b></div>
                               <div>@${resource.createdBy.username}</div></div>
                               <div class="col-md-6">
                               <g:link controller="topic" action="topicshow" params="[id: resource.topic.subscriptions1.id.getAt(0)]">${resource.topic.name}</g:link><br>
                               ${resource.dateCreated}
                                  %{-- <div class="rate" >

                                       <input type="radio" id="5" name="rate" value="5" onclick="Rating('${session.uname}' , '${resource.id}' , '${5}')" />
                                       <label for="5" title="text">5 stars</label>
                                       <input type="radio" id="4" name="rate" value="4" onclick="Rating('${session.uname}' , '${resource.id}' , '${4}')"/>
                                       <label for="4" title="text">4 stars</label>
                                       <input type="radio" id="3" name="rate" value="3" onclick="Rating('${session.uname}' , '${resource.id}' , '${3}')"/>
                                       <label for="3" title="text">3 stars</label>
                                       <input type="radio" id="2" name="rate" value="2" onclick="Rating('${session.uname}' , '${resource.id}' , '${2}')"/>
                                       <label for="2" title="text">2 stars</label>
                                       <input type="radio" id="1" name="rate" value="1" onclick="Rating('${session.uname}' , '${resource.id}' , '${1}')"/>
                                       <label for="1" title="text">1 star</label>

                                   </div>--}%
                               </div></div><br><br>
                                    <div class="row">
                                   <div class="col-md-9"> ${resource.description}<br><br><br>
                                   </div>
                                   <div class="col-md-3">

                                       <span id="1" onclick="Rating('${session.uname}' , '${resource.id}' , '${1}')"class="glyphicon glyphicon-star"></span>
                                       <span id="2" onclick="Rating('${session.uname}' , '${resource.id}' , '${2}')"class="glyphicon glyphicon-star"></span>
                                       <span id="3" onclick="Rating('${session.uname}' , '${resource.id}' , '${3}')"class="glyphicon glyphicon-star"></span>
                                       <span id="4" onclick="Rating('${session.uname}' , '${resource.id}' , '${4}')"class="glyphicon glyphicon-star"></span>
                                       <span id="5" onclick="Rating('${session.uname}' , '${resource.id}' , '${5}')"class="glyphicon glyphicon-star"></span>

                                   </div></div><br><br><br>
                                   <p id="test"></p>


                               <div class="row">
                               <div class="col-md-4"></div>
                                 <div class="col-md-2">
                                     <g:link controller="Resources" action="deletepost" params="[id:resource.id]">Delete post</g:link>
                                   </div>
                              <div class="col-md-2">
                              <a href="" data-toggle="modal" data-target="#editlink">Edit Post</a>
                             </div>

                           <g:if test="${resource.hasProperty('link')}">
                          <div class="col-md-2">
                         <a>Download</a>
                         </div>

                       <div class="col-md-2">
                                 <a href="${resource.link}">View full site</a>   </div>
                           </g:if>
                                   <g:else>
                                       <div class="col-md-2">
                                           <g:link controller="Document" action="download" params="[id:resource.id]">Download</g:link>
                                       </div>

                                       <div class="col-md-2">
                                           <a>View full site</a>   </div>
                                   </g:else>

              </div>




                                </div>
                                </div></div>
                 <div class="col-md-6">

                     <div class="panel panel-default" style="overflow: auto;height: 500px">
                         <div class="panel-heading">Top posts</div>
                         <div class="panel-body">
                             <g:each var="topic" in="${trending}" status="i">
                                 <div class="panel-body">
                                     <a href="#">${topic.name}</a>
                                     <br>
                                     <i>@${userdata.username}</i>
                                     <br>
                                     <g:if test="${tids.contains(topic.id)}">
                                         <a href="#" >Unsubscribe</a> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                                         <br>
                                     </g:if>
                                     <g:else>
                                         <a href="#" >subscribe</a> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                                         <br>

                                     </g:else>
                                  %{--<a href="#" >Unsubscribe</a> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                                  <br>--}%


                                 </div>
                             </g:each>

                         </div>
                     </div>
                 </div>

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









