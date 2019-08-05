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
                 <h4><a href="/Dashboard/dashboard"><strong> <u>Link Sharing</u></strong></a></h4>
             </div>
             <div class="col-md-3">
             <g:form controller="search" action="search">
               <div class="input-group">
                 <input type="text" name="search" class="form-control" placeholder="Search" id="txtSearch"/>
                 <div class="input-group-btn">
                   <button class="btn btn-basic" type="submit">
                     <span class="glyphicon glyphicon-search"></span>
                   </button>
                 </div>
               </div>
               </g:form>
             </div>
             <div class= "col-md-3">


             </div>


             <div class ="col-md-2">
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

        <div class="panel panel-default">

                <div class="panel-body">
                <div class="col-md-3">
                <asset:image src="${user.photo}" style="width: 100%;height: 100%" /></div>
                <div class="col-md-9">
                <div style="font-size:23px;"><p ><b>${user.fName} &nbsp ${user.lName}</b></p></div>
                <div>@${user.username}</div>

                <div class="col-md-6">
                Subscriptions:
                <div>${subcounts}</div></div>
                    <div class="col-md-6">

                Topics:
                <div><a>${topcounts}</a></div></div>
                </div>

                 </div>
                </div>




       <div class="panel panel-default">
         <div class="panel-heading"><div style="float:left">Topics</div>
         <div style="margin-left:350px">View all</div>
         </div>
         <div class="panel-body">
          <g:each in="${subscriptions}" var="us" status="i">
          <g:if test = "${us.topic.createdBy.username==session.uname}">
              <ul class="list-inline">
              <li>
              <div class="row">
                  <div class="col-md-4">
                             <div style="font-size:23px;"><g:link controller="topic" action="topicshow" params="[ id: us.id]">${us.topic.name}</g:link></div></div>

                                <div class="col-md-3">
                                  Subscriptions:
                                   <div>${countofsubs.getAt(i) } </div></div>
                                    &nbsp  &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp

                                        <div class="col-md-3">
                                                     Posts:
                                                      <div><a>${countofposts.get(i)}</a></div></div>


                                   <g:form controller="subscription" action="updateSerious">
                                  <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                   &nbsp &nbsp &nbsp <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                     value="${us.seriousness}" />
                                       </g:form>
                                              </li>
              </ul>

              </g:if>
          </g:each>


         </div>

       </div>


<div class="panel panel-default">
         <div class="panel-heading"><div style="float:left">Subscriptions</div>
         <div style="margin-left:350px">View all</div>
         </div>
         <div class="panel-body">
          <g:each in="${subscriptions}" var="us" status="i">
          <g:if test = "${us.topic.createdBy.username!=session.uname}">
              <li>
              <div class="row">
                  <div class="col-md-6">
                             <div style="font-size:23px;"><g:link controller="topic" action="topicshow" params="[id: us.id]">${us.topic.name}</g:link></div></div>
                                  <div class="col-md-3">
                                  Subscriptions:
                                   <div>${countofsubs.getAt(i) }</div></div>
                                      <div class="col-md-3">
                                                     Posts:
                                                      <div><a>${countofposts.get(i)}</a></div></div>


                                   <g:form controller="subscription" action="updateSerious">
                                  <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                   <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                     value="${us.seriousness}" />
                                       </g:form>
                                              </li>

              </g:if>
          </g:each>


         </div>

       </div></div>

       <div class="col-md-7">
           <div class="panel panel-default">
               <div class="panel-heading"><div style="float:left">Inbox</div>
                   <div style="margin-left:350px">View all</div>
               </div>
               <div class="panel-body">
                   <g:each in="${resources}" var="res" status="i">
                       <li>
                           <div class="row">
                               <div class="col-md-3">
                                   <asset:image src="${res.createdBy.photo}" style="width:70px;height:70px"/></div>
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
                                   <g:if test="${res.hasProperty("link")}">
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
                                       <g:link controller="resources" action="index" params="[id: res.id]">View post</g:link>
                                   </div>
                               </div>
                           </div>
                       </li>
                   </g:each>
               </div>
           </div>
       </div>
      %{-- <div class="col-md-7">
         <div class="panel panel-default">
                      <div class="panel-heading"><div style="float:left">Inbox</div>
                      <div style="margin-left:350px">View all</div>
                      </div>
                      <div class="panel-body">
                       <g:each in="${resources}" var="res" status="i">
                           <li>
                           <div class="row">
                               <div class="col-md-3">
                                               <asset:image src="images.jpeg" style="width:70px;height:70px"/></div>
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


                                                 <g:link controller="Document" action="download" params="[id:res.id , tid:res.id , flag:1]" >Download</g:link>
                                                 </div>
                                                  <div class="col-md-3">
                                                  <a href="">View Full Site</a>
                                                    </div></g:else>

                                                    <div class="col-md-3">
                                                       <a>Mark as read</a>
                                                       </div>
                                                    <div class="col-md-3">
                                                     <g:link controller="resources" action="index" params="[id: res.id]">View post</g:link>
                                                     </div>
                                                      </div>

                           </div>
                           </li>
                       </g:each>

                      </div>

                    </div>
        </div>--}%
   </div>
</body>


