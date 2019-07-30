<!doctype html>
<%@ page import="project.*" %>
<html>
<head>
     <title>PROJECT</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <asset:stylesheet href="style.css"/>
        <asset:javascript src="mainpage.js"/>
    <script type="text/javascript" >
        function preventBack(){window.history.forward();}
        setTimeout("preventBack()", 0);
        window.onunload=function(){null};
    </script>

        <style>
            .topnav {
      overflow: hidden;
      background-color: #333;
      height: 53px;

    }



    .topnav a {
      float: left;
      display: block;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
      font-size: 17px;
    }

    .topnav a:hover {
      background-color: #ddd;
      color: black;
    }

    .topnav a.active {
      background-color: #4CAF50;
      color: white;
    }

    .topnav .search-container {
      float: right;
    }

    .topnav input[type=text] {
      padding: 6px;
      margin-top: 8px;
      font-size: 17px;
      border: none;
    }

    .topnav .search-container button {
      float: right;
      padding: 6px 10px;
      margin-top: 8px;
      margin-right: 16px;
      background: #ddd;
      font-size: 17px;
      border: none;
      cursor: pointer;
    }

    .topnav .search-container button:hover {
      background: #ccc;
    }

    .topnav .search-container button {
    height: 37px;
    }



    .card {
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
      transition: 0.3s;
      width: 100%;
      margin: 0px 25px 25px 25px;
      height:400px;
    }

    .card:hover {
      box-shadow: 10px 18px 16px 10px rgba(0,0,0,0.2);
    }

        #rs{
    padding:10px 10px 10px 10px;
    background: #808080;
    }

    .headleft{
    display:inline;
    }

    #outer_container{
    background: #e6f7ff;
    }
    .container#fullresponsive{
     display: grid;
        position: relative;
        width: 100%;
        overflow: auto;
        box-sizing: content-box;


    }
    .container#fullresponsive1{
     display: grid;
        position: relative;
        width: 100%;
        overflow: auto;
        box-sizing: content-box;


    }
    .container#topposts{
    padding:10px 10px 10px 10px;
    background:#808080;

    }

    #op{
    float:right;
    width:120px;
    height:20px;
    }

    html, body{
    height:auto;
    background: #e6f7ff;
    }

    .card#2nd{
    margin-bottom:30px;
    }

    #photo{
    float:right;
    }

    .recent {
      overflow: hidden;
      background-color: white;
      width:90%;
    }
    .recent a {
      float: left;
      color: black;
      text-align: center;
      padding: 0px 16px 0px;
      text-decoration: none;
      font-size: 17px;
    }
    #disable{
    pointer-events:none;
     opacity:0.4;
    }

        </style>

</head>
<body>

<div class="container-fluid" id="outer_container" style="height:100%;">
    <div class="row">
        <div class="col-md-12">
        <div class="topnav">
            <a class="active" href="#home">Link Shairing</a>

            <div class="search-container">
                <form action="/action_page.php">
                    <input type="text" placeholder="Search.." name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
        </div>
    </div>
    <br>
    <br>
    <div class="row">
    <div class="col-md-7">

        <div class="row">

            <div class="card" >
                <p id="rs"><b>Recent Shares</b></p>
                <div class="container" id="fullresponsive" >
                    <div class="row">
                        <div class="col-md-3" style="padding:6px">
                           <asset:image src="rishabh.jpg" height="150px" width="100%" />
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="recent">
                                    <a class="active" href="#home">Rishabh</a>
                                    <a disabled href="google.com" id="disable" >@rish 5min</a>
                                </div>
                            </div>
                            <div class="container" style="width:500px;margin:auto 100px -10px -6px;" >
                            <p style="font-size:15px;">Kabir Singh, a senior medical student with a passion for old English motorcycles and football, is heartbroken when his girlfriend is forced to marry another man. Already struggling with anger issues, he falls into a self-destructive spiral.</p>
                        </div>
                            <div class="row">
                                <div class="recent">
                                    <a href="#"> <i class="fa fa-facebook-square" style="font-size:24px"></i></a>
                                    <a href="#"> <i class="fa fa-twitter" style="font-size:24px"></i></a>
                                    <a href="#"> <i class="fa fa-google-plus" style="font-size:24px"></i></a>
                                    <a class="active" href="#home" style="float:right;color:blue;">Show post</a>
                                </div>

                            </div>
                        </div>

                    </div>
                    <br>

                    <div class="row">
                        <div class="col-md-3" style="padding:6px">
                         <asset:image src="b.jpg" height="150px" width="100%" />
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="recent">
                                    <a class="active" href="#home">Abhay</a>
                                    <a disabled href="google.com" id="disable" >@abhay 5min</a>
                                </div>
                            </div>
                            <div class="container" style="width:500px;margin:auto 100px -10px -6px;" >
                                <p style="font-size:15px;">Kabir Singh, a senior medical student with a passion for old English motorcycles and football, is heartbroken when his girlfriend is forced to marry another man. Already struggling with anger issues, he falls into a self-destructive spiral.</p>
                            </div>
                            <div class="row">
                                <div class="recent">
                                    <a href="#"> <i class="fa fa-facebook-square" style="font-size:24px"></i></a>
                                    <a href="#"> <i class="fa fa-twitter" style="font-size:24px"></i></a>
                                    <a href="#"> <i class="fa fa-google-plus" style="font-size:24px"></i></a>
                                    <a class="active" href="#home" style="float:right;color:blue;">Show post</a>
                                </div>

                            </div>
                        </div>

                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-3" style="padding:6px">
                         <asset:image src="c.jpg" height="150px" width="100%" />
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="recent">
                                    <a class="active" href="#home">Ayush</a>
                                    <a disabled href="google.com" id="disable" >@ayush 5min</a>
                                </div>
                            </div>
                            <div class="container" style="width:500px;margin:auto 100px -10px -6px;" >
                                <p style="font-size:15px;">Kabir Singh, a senior medical student with a passion for old English motorcycles and football, is heartbroken when his girlfriend is forced to marry another man. Already struggling with anger issues, he falls into a self-destructive spiral.</p>
                            </div>
                            <div class="row">
                                <div class="recent">
                                    <a href="#"> <i class="fa fa-facebook-square" style="font-size:24px"></i></a>
                                    <a href="#"> <i class="fa fa-twitter" style="font-size:24px"></i></a>
                                    <a href="#"> <i class="fa fa-google-plus" style="font-size:24px"></i></a>
                                    <a class="active" href="#home" style="float:right;color:blue;">Show post</a>
                                </div>

                            </div>
                        </div>

                    </div>
                    <br>

                </div>
            </div>

        </div>


        <div class="row">
            <div class="card" id="2nd">
                <div class="container" id="topposts">
                    <a><b>Top Posts</b></a>


                        <select id="op">
                            <option value="volvo">Volvo</option>
                            <option value="saab">Saab</option>
                            <option value="opel">Opel</option>
                            <option value="audi">Audi</option>
                        </select>

                </div>
                <br>
                <div class="container" id="fullresponsive1" >
                    <div class="row">
                        <div class="col-md-3" style="padding:6px">
                         <asset:image src="c.jpg" height="150px" width="100%" />
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="recent">
                                    <a class="active" href="#home">Ayush</a>
                                    <a disabled href="google.com" id="disable" >@ayush 5min</a>
                                </div>
                            </div>
                            <div class="container" style="width:500px;margin:auto 100px -10px -6px;" >
                                <p style="font-size:15px;">Kabir Singh, a senior medical student with a passion for old English motorcycles and football, is heartbroken when his girlfriend is forced to marry another man. Already struggling with anger issues, he falls into a self-destructive spiral.</p>
                            </div>
                            <div class="row">
                                <div class="recent">
                                    <a href="#"> <i class="fa fa-facebook-square" style="font-size:24px"></i></a>
                                    <a href="#"> <i class="fa fa-twitter" style="font-size:24px"></i></a>
                                    <a href="#"> <i class="fa fa-google-plus" style="font-size:24px"></i></a>
                                    <a class="active" href="#home" style="float:right;color:blue;">Show post</a>
                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>


    <div class="col-md-5">
        <div class="row">

                <g:form class="form-signin" url="[controller:'User',action:'signup']">
                    <h2 class="form-signin-heading" style=" font-size:30px;">Login</h2>
                    <input type="text" class="form-control" name="email" placeholder="Email Address" required="true" autofocus="" />
                    <br>
                    <input type="password" class="form-control" name="password" placeholder="Password" required="true"/>
                    <label class="checkbox">
                        <a href="${createLink(controller:'User',action: 'passreset')}">Forget Password?</a>
                    </label>
                    <p style="color:red;">${flash.message}</p>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                </g:form>


        </div>
<br>


        <div class="row">
            <g:uploadForm class="form-signin" id="register" controller="User" action="index" enctype="multipart/form-data">
                <h2 class="form-signin-heading" style=" font-size:30px;">Register</h2>
                <input type="text" class="form-control" name="firstname" placeholder="Firstname" required="true" autofocus="" />
                <br>
                <input type="text" class="form-control" name="lastname" placeholder="Lastname" required="true" autofocus="" />
                <br>
                <input type="email" class="form-control" name="email" placeholder="Email" required="true" autofocus="" />
                <br>
                <input type="text" class="form-control" name="username" placeholder="Username" required="true" autofocus="" />
                <br>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="true" onkeyup='pass();' />
                <br>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required="true" onkeyup='pass();'/>
                <span id='message'></span>
                <br>
                <p><b>Upload Photo</b><input id="photo" type="file" accept="image/*" name="photo"></p>
                <br>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
            </g:uploadForm>
        </div>

    </div>
    </div>
</div>

</body>
</html>
