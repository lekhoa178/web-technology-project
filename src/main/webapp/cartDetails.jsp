<%@ page import="com.cnw.shoppingweb.service.impl.CartServiceImpl" %>
<%@ page import="com.cnw.shoppingweb.beans.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cnw.shoppingweb.service.impl.ProductServiceImpl" %>
<%@ page import="com.cnw.shoppingweb.beans.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Giỏ Hàng</title>
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
</head>

<style>
	td, th {
		text-align: start;
		padding: 8px;
	}
</style>

<body style="background-color: #f5f5f5;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}

	String addS = request.getParameter("add");
	if (addS != null) {

		int add = Integer.parseInt(addS);
		String uid = request.getParameter("uid");
		String pid = request.getParameter("pid");
		int avail = Integer.parseInt(request.getParameter("avail"));
		int cartQty = Integer.parseInt(request.getParameter("qty"));
		CartServiceImpl cart = new CartServiceImpl();

		if (add == 1) {
			//Add Product into the cart
			cartQty += 1;
			if (cartQty <= avail) {
		cart.addProductToCart(uid, pid, 1);
			} else {
		response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
			}
		} else if (add == 0) {
			//Remove Product from the cart
			cart.removeProductFromCart(uid, pid);
		}
	}
	%>



	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: black; font-size: 24px; font-weight: bold;">Giỏ Hàng</div>
	<!-- <script>document.getElementById('mycart').innerHTML='<i data-count="20" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;"></i>'</script>
 -->
	<!-- Start of Product Items List -->
	<div class="container" style="margin: 0; width: 100%">

		<table class="table table-hover">
			<thead
				style="background-color: #fff; color: black; font-size: 16px; font-weight: bold;
						border-bottom: 3px solid #DDD; margin-bottom: 20px">
				<tr>
					<th>Hình ảnh</th>
					<th>Sản phẩm</th>
					<th>Giá tiền</th>
					<th>Số lượng</th>
					<th>Thêm</th>
					<th>Xóa</th>
					<th>Số lượng</th>
				</tr>
			</thead>
			<tbody
				style="background-color: white; font-size: 15px; font-weight: bold;">



				<%
				CartServiceImpl cart = new CartServiceImpl();
				List<Cart> cartItems = new ArrayList<Cart>();
				cartItems = cart.getAllCartItems(userName);
				double totAmount = 0;
				for (Cart item : cartItems) {

					String prodId = item.getProdId();

					int prodQuantity = item.getQuantity();

					Product product = new ProductServiceImpl().getProductDetails(prodId);

					double currAmount = product.getProdPrice() * prodQuantity;

					totAmount += currAmount;

					if (prodQuantity > 0) {
				%>

				<tr>
					<td><img src="./ShowImage?pid=<%=product.getProdId()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=product.getProdName()%></td>
					<td><%=product.getProdPrice()%></td>
					<td><form method="post" action="./UpdateToCart">
							<input type="number" name="pqty" value="<%=prodQuantity%>"
								style="max-width: 70px; border-width: 0; box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); border-radius: 15px; padding-left: 10px" min="0"> <input type="hidden"
								name="pid" value="<%=product.getProdId()%>">
							<input
								style="border-radius: 15px; background-color: #ee4d2d; border-width: 0;
									color: white; padding: 5px"
								type="submit" name="Update" value="Cập nhật"
								style="max-width: 80px;">
						</form></td>
					<td><a
						href="cartDetails.jsp?add=1&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>"><i
							class="fa fa-plus"></i></a></td>
					<td><a
						href="cartDetails.jsp?add=0&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>"><i
							class="fa fa-minus"></i></a></td>
					<td><%=currAmount%></td>
				</tr>

				<%
				}
				}
				%>

				<tr style="background-color: #fff; color: black; border-bottom: 4px solid #ee4d2d;">
					<td colspan="6" style="text-align: center;">Tổng Số Tiền (VNĐ)</td>
					<td><%=totAmount%></td>
				</tr>
				<%
				if (totAmount != 0) {
				%>
				<tr style="background-color: #fff;  color: black;">
					<td colspan="4" style="text-align: center;">
					<td><form method="post">
							<button formaction="userHome.jsp"
								style="background-color: white; color: #888; border-width: 0">Hủy</button>
						</form></td>
					<td colspan="2" align="center"><form method="post">
							<button style="background-color: #ee4d2d; color: white; border-radius: 20px; border-width: 0"
								formaction="payment.jsp?amount=<%=totAmount%>">Thanh Toán</button>
						</form></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<!-- ENd of Product Items List -->


	<%@ include file="footer.jsp"%>

</body>
</html>