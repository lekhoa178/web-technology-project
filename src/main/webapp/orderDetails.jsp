<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.cnw.shoppingweb.service.impl.*, com.cnw.shoppingweb.service.*,com.cnw.shoppingweb.beans.*,java.util.*,jakarta.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Chi Tiết Đơn Hàng</title>
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
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}

	OrderService dao = new OrderServiceImpl();
	List<OrderDetails> orders = dao.getAllOrderDetails(userName);
	%>



	<jsp:include page="header.jsp" />

	<!-- <script>document.getElementById('mycart').innerHTML='<i data-count="20" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;"></i>'</script>
 -->
	<div class="text-center"
		style="color: #ee4d2d; font-size: 24px; font-weight: bold;">Chi tiết đơn hàng</div>
	<!-- Start of Product Items List -->
	<div class="container" style="margin: 0; width: 100%">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead
					style="background-color: #fff; color: black; font-size: 14px; font-weight: bold; border-bottom: 2px solid #CCC">
					<tr>
						<th>Hình ảnh</th>
						<th>Tên sản phẩm</th>
						<th>Mã đơn hàng</th>
						<th>Số lượng</th>
						<th>Giá tiền</th>
						<th>Thời gian</th>
						<th>Trạng thái</th>
					</tr>
				</thead>
				<tbody
					style="background-color: white; font-size: 15px; font-weight: bold;">
					<%
					for (OrderDetails order : orders) {
					%>

					<tr>
						<td><img src="./ShowImage?pid=<%=order.getProductId()%>"
							style="width: 50px; height: 50px;"></td>
						<td><%=order.getProdName()%></td>
						<td><%=order.getOrderId()%></td>
						<td><%=order.getQty()%></td>
						<td><%=order.getAmount()%></td>
						<td><%=order.getTime()%></td>
						<td class="text-success"><%=order.getShipped() == 0 ? "ĐANG_XỬ_LÍ" : "ĐÃ_ĐƯỢC_GIAO"%></td>
					</tr>

					<%
					}
					%>

				</tbody>
			</table>
		</div>
	</div>
	<!-- ENd of Product Items List -->


	<%@ include file="footer.jsp"%>
</body>
</html>