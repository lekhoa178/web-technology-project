<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.cnw.shoppingweb.service.impl.*, com.cnw.shoppingweb.beans.*,com.cnw.shoppingweb.service.*,java.util.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản Trị Viên Trang Chủ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/changes.css">
</head>
<body style="background-color: #f5f5f5;">
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("ADMIN")) {

		response.sendRedirect("loginFirst.jsp");

	}

	if (userName == null || password == null) {

		response.sendRedirect("loginFirst.jsp");
	}
	%>

	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: #ee4d2d; font-size: 24px; font-weight: bold;">Đơn hàng chưa giao</div>
	<div class="container-fluid">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead
					style="background-color: #fff; color: black; font-size: 16px; border-bottom: 3px solid #CCC">
					<tr>
						<th>Mã giao dịch</th>
						<th>Mã sản phẩm</th>
						<th>Email người dùng</th>
						<th>Địa chỉ</th>
						<th>Số lượng</th>
						<th>Trạng thái</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody style="background-color: white;">

					<%
					OrderServiceImpl orderdao = new OrderServiceImpl();

					List<Order> orders = new ArrayList<Order>();
					orders = orderdao.getAllOrders();
					int count = 0;
					for (Order order : orders) {
						String transId = order.getTransactionId();
						String prodId = order.getProductId();
						int quantity = order.getQuantity();
						int shipped = order.getShipped();
						String userId = new TransactionServiceImpl().getUserId(transId);
						String userAddr = new UserServiceImpl().getUserAddr(userId);
						if (shipped == 0) {
							count++;
					%>

					<tr>
						<td><%=transId%></td>
						<td><a href="updateProduct.jsp?prodid=<%=prodId%>"><%=prodId%></a></td>
						<td><%=userId%></td>
						<td><%=userAddr%></td>
						<td><%=quantity%></td>
						<td>SẴN_SÀNG_ĐỂ_GIAO_HÀNG</td>
						<td><a
							href="ShipmentServlet?orderid=<%=order.getTransactionId()%>&amount=<%=order.getAmount()%>&userid=<%=userId%>&prodid=<%=order.getProductId()%>"
							class="btn btn-success">GIAO HÀNG NGAY</a></td>
					</tr>

					<%
					}
					}
					%>
					<%
					if (count == 0) {
					%>
					<tr style="background-color: grey; color: white;">
						<td colspan="7" style="text-align: center;">Không Có Sản Phẩm Có Sẵn</td>

					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>