<%--
  Created by IntelliJ IDEA.
  User: rishabh
  Date: 07/08/19
  Time: 12:09 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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
    <asset:stylesheet href="homepage.css"/>
    <g:javascript>
            var resetPasswordUrl = "${createLink(controller: 'user', action: 'passreset')}";
             var url="${createLink(controller: 'User', action: 'index')}"
    </g:javascript>
    <script>
        var formdata
        $(document).ready(function () {
            $("#register").on('submit', function (e) {
                e.preventDefault();
                formdata = new FormData(this);
                /*console.log(formdata.get('photo'));*/
                $.ajax({
                    "url": url,
                    "type": "POST",
                    "processData": false,
                    "contentType": false,
                    "data": formdata,
                    success: function () {
                        document.getElementById("test").innerHTML = "User Successfully Created"
                    },
                    error:function () {
                        document.getElementById("test").innerHTML = "FAILURE "
                    }
                });
            });
        });

    </script>
    <script type="text/javascript">
        function preventBack() {
            window.history.forward();
        }

        setTimeout("preventBack()", 0);
        window.onunload = function () {
            null
        };
    </script>

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

                <div class="card">
                    <p id="rs"><b>Recent Shares</b></p>

                    <div class="container" id="fullresponsive">
                        <div class="row">
                            <div class="col-md-3" style="padding:6px">
                                <asset:image src="rishabh.jpg" height="150px" width="100%"/>
                            </div>

                            <div class="col-md-9">
                                <div class="row">
                                    <div class="recent">
                                        <a class="active" href="#home">Rishabh</a>
                                        <a disabled href="google.com" id="disable">@rish 5min</a>
                                    </div>
                                </div>

                                <div class="container" style="width:500px;margin:auto 100px -10px -6px;">
                                    <p style="font-size:15px;">Kabir Singh, a senior medical student with a passion for old English motorcycles and football, is heartbroken when his girlfriend is forced to marry another man. Already struggling with anger issues, he falls into a self-destructive spiral.</p>
                                </div>

                                <div class="row">
                                    <div class="recent">
                                        <a href="#"><i class="fa fa-facebook-square" style="font-size:24px"></i></a>
                                        <a href="#"><i class="fa fa-twitter" style="font-size:24px"></i></a>
                                        <a href="#"><i class="fa fa-google-plus" style="font-size:24px"></i></a>
                                        <a class="active" href="#home" style="float:right;color:blue;">Show post</a>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <br>

                        <div class="row">
                            <div class="col-md-3" style="padding:6px">
                                <asset:image src="b.jpg" height="150px" width="100%"/>
                            </div>

                            <div class="col-md-9">
                                <div class="row">
                                    <div class="recent">
                                        <a class="active" href="#home">Abhay</a>
                                        <a disabled href="google.com" id="disable">@abhay 5min</a>
                                    </div>
                                </div>

                                <div class="container" style="width:500px;margin:auto 100px -10px -6px;">
                                    <p style="font-size:15px;">Kabir Singh, a senior medical student with a passion for old English motorcycles and football, is heartbroken when his girlfriend is forced to marry another man. Already struggling with anger issues, he falls into a self-destructive spiral.</p>
                                </div>

                                <div class="row">
                                    <div class="recent">
                                        <a href="#"><i class="fa fa-facebook-square" style="font-size:24px"></i></a>
                                        <a href="#"><i class="fa fa-twitter" style="font-size:24px"></i></a>
                                        <a href="#"><i class="fa fa-google-plus" style="font-size:24px"></i></a>
                                        <a class="active" href="#home" style="float:right;color:blue;">Show post</a>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <br>

                        <div class="row">
                            <div class="col-md-3" style="padding:6px">
                                <asset:image src="nitin.jpg" height="150px" width="100%"/>
                            </div>

                            <div class="col-md-9">
                                <div class="row">
                                    <div class="recent">
                                        <a class="active" href="#home">Ayush</a>
                                        <a disabled href="google.com" id="disable">@ayush 5min</a>
                                    </div>
                                </div>

                                <div class="container" style="width:500px;margin:auto 100px -10px -6px;">
                                    <p style="font-size:15px;">Kabir Singh, a senior medical student with a passion for old English motorcycles and football, is heartbroken when his girlfriend is forced to marry another man. Already struggling with anger issues, he falls into a self-destructive spiral.</p>
                                </div>

                                <div class="row">
                                    <div class="recent">
                                        <a href="#"><i class="fa fa-facebook-square" style="font-size:24px"></i></a>
                                        <a href="#"><i class="fa fa-twitter" style="font-size:24px"></i></a>
                                        <a href="#"><i class="fa fa-google-plus" style="font-size:24px"></i></a>
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

                    <div class="container" id="fullresponsive1">
                        <div class="row">
                            <div class="col-md-3" style="padding:6px">
                                <asset:image src="nitin.jpg" height="150px" width="100%"/>
                            </div>

                            <div class="col-md-9">
                                <div class="row">
                                    <div class="recent">
                                        <a class="active" href="#home">Ayush</a>
                                        <a disabled href="google.com" id="disable">@ayush 5min</a>
                                    </div>
                                </div>

                                <div class="container" style="width:500px;margin:auto 100px -10px -6px;">
                                    <p style="font-size:15px;">Kabir Singh, a senior medical student with a passion for old English motorcycles and football, is heartbroken when his girlfriend is forced to marry another man. Already struggling with anger issues, he falls into a self-destructive spiral.</p>
                                </div>

                                <div class="row">
                                    <div class="recent">
                                        <a href="#"><i class="fa fa-facebook-square" style="font-size:24px"></i></a>
                                        <a href="#"><i class="fa fa-twitter" style="font-size:24px"></i></a>
                                        <a href="#"><i class="fa fa-google-plus" style="font-size:24px"></i></a>
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

                <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm"
                      class="cssform" autocomplete="off">
                    <p>
                        <label for="email">Email:</label>
                        <input type="text" class="form-control" name="${usernameParameter ?: 'email'}"
                               id="email"/>
                    </p>

                    <p>
                        <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                        <input type="password" class="form-control" name="${passwordParameter ?: 'password'}"
                               id="password"/>
                    </p>
                    <p>
                    <label class="checkbox">
                        <a href="#" onclick="changepass()">Forgot Password?</a>
                    </label>
                    </p>
                    <p style="color:red">${flash.message}</p>

                    <p>
                        <input class="btn btn-lg btn-primary btn-block" type="submit" id="submit"
                               value="${message(code: 'springSecurity.login.button')}"/>
                    </p>
                </form>

            </div>
            <br>


            <div class="row">
                <g:form class="form-signin" name="register" enctype="multipart/form-data">
                    <h2 class="form-signin-heading" style=" font-size:30px;">Register</h2>
                    <input type="text" id="fname" class="form-control" name="firstname" placeholder="Firstname"
                           required="true" autofocus=""/>
                    <br>
                    <input type="text" id="lname" class="form-control" name="lastname" placeholder="Lastname"
                           required="true" autofocus=""/>
                    <br>
                    <input type="email" class="form-control" name="email" placeholder="Email" required="true"
                           autofocus=""/>
                    <br>
                    <input type="text" id="uname" class="form-control" name="username" placeholder="Username"
                           required="true" autofocus=""/>
                    <br>
                    <input type="password" class="form-control" id="password1" name="password" placeholder="Password"
                           required="true" onkeyup='pass();'/>
                    <br>
                    <input type="password" class="form-control" id="confirm_password" name="confirm_password"
                           placeholder="Confirm Password" required="true" onkeyup='pass();'/>
                    <span id='message'></span>
                    <br>

                    <p><b>Upload Photo</b><input id="photo" type="file" accept="image/*" name="photo"></p>
                    <br>

                    <p>${flash.message2}</p>

                    <p id="test"></p>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>

                </g:form>
            </div>

        </div>
    </div>
</div>
<script>
    function changepass() {
        var email = $('#email').val();
        $.ajax({
            "url": resetPasswordUrl,
            "type": "get",
            "data": {email: email},
            success: function () {
                document.getElementById("test").innerHTML = "SUCCESS"
            }
        });

    }

    (function () {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
