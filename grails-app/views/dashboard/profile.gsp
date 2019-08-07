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

<g:render template="profileinfo"/>
<g:render template="topiccreated"/>
<g:render template="subscriptions"/>
       <div class="col-md-7">
        <g:render template="postcreated"/>
       </div>
   </div>
</body>


