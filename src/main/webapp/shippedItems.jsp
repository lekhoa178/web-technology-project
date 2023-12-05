<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.cnw.shoppingweb.service.impl.*, com.cnw.shoppingweb.beans.*,com.cnw.shoppingweb.service.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản Trị Viên Trang Chủ</title>
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f5f5f5;">
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("ADMIN")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	%>

	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: #ee4d2d; font-size: 24px; font-weight: bold;">Đơn Hàng Đã Giao</div>
	<div class="container-fluid">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead
					style="background-color: #fff; color: black; font-size: 18px; border-bottom: 3px solid #CCC">
					<tr>
						<th>Mã giao dịch</th>
						<th>Mã sản phẩm</th>
						<th>Tên đăng nhập</th>
						<th>Địa chỉ</th>
						<th>Số lượng</th>
						<th>Số đơn</th>
						<td>Trạng thái</td>
					</tr>
				</thead>
				<tbody style="background-color: white;">

					<%
					OrderServiceImpl orderdao = new OrderServiceImpl();

					List<OrderBean> orders = new ArrayList<OrderBean>();
					orders = orderdao.getAllOrders();
					int count = 0;
					for (OrderBean order : orders) {
						String transId = order.getTransactionId();
						String prodId = order.getProductId();
						int quantity = order.getQuantity();
						int shipped = order.getShipped();
						String userId = new TransactionServiceImpl().getUserId(transId);
						String userAddr = new UserServiceImpl().getUserAddr(userId);
						if (shipped != 0) {
							count++;
					%>

					<tr>
						<td><%=transId%></td>
						<td><a href="./updateProduct.jsp?prodid=<%=prodId%>"><%=prodId%></a></td>
						<td><%=userId%></td>
						<td><%=userAddr%></td>
						<td><%=quantity%></td>
						<td>VNĐ. <%=order.getAmount()%></td>
						<td class="text-success" style="font-weight: bold;">ĐÃ GIAO</td>

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