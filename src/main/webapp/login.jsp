<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f5f5f5;">

	<%@ include file="header.jsp"%>

	<%
	String message = request.getParameter("message");
	%>
	<div class="container" style="height: 400px;">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./LoginSrv" method="post"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
				style="border: none; border-radius: 10px; background-color: white; padding: 10px; top: 50px; box-shadow: black;">
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
						<label for="user_name"></label> <input type="email"
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
					<div class="col-md-12 form-group">
						<label for="userrole">Login As</label>
						<select name="usertype"
							id="userrole" class="form-control input-lg" required>
							<option value="customer" selected>CUSTOMER</option>
							<option value="admin">ADMIN</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<button type="submit" class="btn btn-primary btn-lg btn-block input-lg"
								style="background-color: #ee4d2d; border: none; border-radius: 0;"> Login
						</button>
					</div>
				</div>
			</form>

		</div>
	</div>

	<%@ include file="footer.html"%>

</body>
</html>