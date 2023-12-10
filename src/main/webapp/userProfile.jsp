<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.cnw.shoppingweb.service.impl.*, com.cnw.shoppingweb.service.*,com.cnw.shoppingweb.beans.*,java.util.*,jakarta.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Hồ Sơ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

	.text-title {
		padding: 0;
		font-size: 15px;
		color: #000000;
	}

	.text-body {
		font-weight: normal;
		font-size: 15px;
		color: black;
	}
</style>
</head>
</head>
<body style="background-color: #fff;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	UserService dao = new UserServiceImpl();
	UserBean user = dao.getUserDetails(userName, password);
	if (user == null)
		user = new UserBean("Test User", 98765498765L, "test@gmail.com", "ABC colony, Patna, bihar", 87659, "lksdjf", "User");
	%>



	<jsp:include page="header.jsp" />

	<div class="container bg-secondary">
		<div class="row">
			<div class="col" style="border-bottom: 2px solid #ee4d2d; margin-bottom: 40px; background-color: white">
				<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4" style="background-color: white">
					<ol class="breadcrumb mb-0" style="background-color: white">
						<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
						<li class="breadcrumb-item"><a href="profile.jsp">Hồ sơ</a></li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row">

			<div class="col-lg-8" style="border-bottom: 2px solid #ee4d2d">
				<div class="card mb-4">
					<div class="card-body" style="display: flex; flex-direction: column; gap: 25px">
						<div class="row" style="display: flex; align-items: center">
							<div class="col-sm-3">
								<p class="mb-0 text-title">Họ tên đầy đủ</p>
							</div>
							<div class="col-sm-9" style="border-bottom: 2px solid #ccc">
								<p class="text-body text-muted mb-0" style="color: black; font-weight: bold"><%=user.getName()%></p>
							</div>
						</div>
						<div class="row" style="display: flex; align-items: center">
							<div class="col-sm-3">
								<p class="mb-0 text-title">Email</p>
							</div>
							<div class="col-sm-9" style="border-bottom: 2px solid #ccc">
								<p class="text-body text-muted mb-0" style="color: black"><%=user.getEmail()%>
								</p>
							</div>
						</div>
						<div class="row" style="display: flex; align-items: center">
							<div class="col-sm-3">
								<p class="mb-0 text-title">Số điện thoại</p>
							</div>
							<div class="col-sm-9" style="border-bottom: 2px solid #ccc">
								<p class="text-body text-muted mb-0" style="color: black"><%=user.getMobile()%>
								</p>
							</div>
						</div>
						<div class="row" style="display: flex; align-items: center">
							<div class="col-sm-3">
								<p class="mb-0 text-title">Địa chỉ</p>
							</div>
							<div class="col-sm-9" style="border-bottom: 2px solid #ccc">
								<p class="text-body text-muted mb-0" style="color: black"><%=user.getAddress()%>
								</p>
							</div>
						</div>
						<div class="row" style="display: flex; align-items: center">
							<div class="col-sm-3">
								<p class="mb-0 text-title">Mã Pin</p>
							</div>
							<div class="col-sm-9" style="border-bottom: 2px solid #ccc">
								<p class="text-body text-muted mb-0" style="color: black"><%=user.getPinCode()%>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<img src="images/people.png" class="rounded-circle img-fluid"
							 style="width: 150px;">
						<h5 class="my-3">
							Xin chào người dùng
							<%=user.getName()%>!!
						</h5>
					</div>
				</div>
				<div class="card mb-4 mb-lg-0">
					<div class="card-body p-0">
						<ul class="list-group list-group-flush rounded-3">

							<li style="background-color: #ffd2c5; border-width: 0; border-radius: 10px"
								class="text-center list-group-item d-flex justify-contents-between align-items-center p-3">
								<h1 style="font-weight: bold; color: #ee4d2d"><%=user.getName().toUpperCase()%></h1>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>

		<a href="orderDetails.jsp"
		   style="display: inline-block; background-color: #ffac9c; border-radius: 15px; padding: 30px; margin: 15px; color: #ee4d2d; font-weight: bold; font-size: 20px">
			Xem Đơn Hàng Của Bạn</a>
	</div>

	<br>
	<br>
	<br>

	<%@ include file="footer.jsp"%>

</body>
</html>\