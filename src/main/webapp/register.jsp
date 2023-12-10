<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng Kí</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/changes.css">
	<link rel="stylesheet" href="css/login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f5f5f5">

	<%@ include file="header.jsp"%>
	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">

			<form action="./RegisterSrv" method="post"
				class="col-md-6 col-md-offset-3 login-form-container">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Đơn Đăng Kí</h2>
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
					<div class="col-md-6 form-group">
						<label for="first_name">Tên đăng nhập</label> <input type="text"
							name="username" class="form-control" id="first_name"
							name="first_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="email">Email</label> <input type="email"
							name="email" class="form-control" id="email"
							required>
					</div>
				</div>
				<div class="form-group">
					<label for="address">Địa chỉ</label>
					<textarea name="address" class="form-control" id="address"required></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="mobile">Số điện thoại</label> <input type="number"
							name="mobile" class="form-control" id="mobile" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="pincode">Mã Pin</label> <input type="number"
							name="pincode" class="form-control" id="pincode" required>
					</div>

				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="password">Mật khẩu</label> <input type="password"
							name="password" class="form-control" id="password" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="passwordConf">Xác nhận mật khẩu</label> <input
							type="password" name="confirmPassword" class="form-control"
							id="passwordConf" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6" style="margin-bottom: 2px;">
						<button type="Reset" class="btn btn-danger">Reset</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success">Đăng kí</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>