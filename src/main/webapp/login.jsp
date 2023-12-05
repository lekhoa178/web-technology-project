<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/changes.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f5f5f5;">

<%@ include file="header.jsp" %>

<%
    String message = request.getParameter("message");
%>
<div class="container login-container">
    <div class="row"
         style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
        <form action="./LoginSrv" method="post" id="loginForm">
            <div style="font-weight: bold;" class="text-center">
                <h2 style="color: black;">Login</h2>
                <%
                    if (message != null) {
                %>
                <p style="color: blue;">
                    <%=message%>
                </p>
                <%
                    }
                %>
            </div>
            <div></div>
            <div class="row">
                <div class="col-md-12 form-group">
                    <label for="user_name"></label>
                    <input type="email"
                           placeholder="Username" name="username" class="form-control input-lg"
                           id="user_name" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 form-group">
                    <label for="password"></label>
                    <input type="password"
                           placeholder="Password" name="password" class="form-control input-lg"
                           id="password" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary btn-lg btn-block input-lg"
                            style="background-color: #ee4d2d; border: none; border-radius: 0;"> Login
                    </button>
                </div>
            </div>

            <div class="row" style="height: 100px; border-top: 1px solid darkgray; margin: 30px 10px 0 10px ; display: flex; justify-content: space-between; align-items: center" >
                <div class="col-md-6 text-center" style="border: 1px solid darkgray; width: 130px; height: 40px; display: flex; align-items: center;">
                    <i class="fa-brands fa-facebook" style="color: #134cae; font-size: 20px; line-height: 250%;"></i>
                    Facebook
                </div>

                <div class="col-md-6 text-center" style="border: 1px solid darkgray; width: 130px; height: 40px; display: flex; align-items: center;">
                    <i class="fa-brands fa-google" style="color: #ee4d2d; font-size: 20px; line-height: 250%;"></i>
                    Google
                </div>
            </div>
        </form>

    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>