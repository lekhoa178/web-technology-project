<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.cnw.shoppingweb.service.impl.*, com.cnw.shoppingweb.service.*,com.cnw.shoppingweb.beans.*,java.util.*,jakarta.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Xem Sản Phẩm</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f5f5f5;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String userType = (String) session.getAttribute("usertype");

	if (userType == null || !userType.equals("ADMIN")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<Product> products = new ArrayList<Product>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "Tất Cả Sản Phẩm";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Kết Quả Tìm Kiếm Của '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Kết Quả Tìm Kiếm Của '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "Không Tìm Thấy Sản Phẩm Của '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>



	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: black; font-size: 16px; font-weight: bold; margin-bottom: 15px"><%=message%></div>

	<!-- Start of Product Items List -->
	<div class="container" style="background-color: #f5f5f5;">
		<div class="row text-center">

			<%
			for (Product product : products) {
			%>
			<div class="col-sm-4" style='height: 350px;'>
				<div class="thumbnail" style="height: 340px;box-shadow: rgba(0, 0, 0, 0.24) 0px 2px 5px;">
					<img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product"
						style="height: 150px; max-width: 180px;">
					<%
						String productName = product.getProdName();
						if(productName.length() > 20){
							productName = productName.substring(0, 20) + " ...";
						}
					%>
					<p class="productname">
						<%=productName%>
						(
						<%=product.getProdId()%>
						)
					</p>
					<%
						String description = product.getProdInfo();
						boolean lengthOver = description.length() > 100;
						if(lengthOver){
							description = description.substring(0, Math.min(description.length(), 100)) + " ...";
						}

					%>
						<p class="productinfo"><%=description%></p>
					<p class="price">
						VNĐ
						<%=product.getProdPrice()%>
					</p>
					<form method="post" >
						<button type="submit"
							formaction="./RemoveProductSrv?prodid=<%=product.getProdId()%>"
							class="btn btn-danger"
							style="
							background-color: #ee4d2d;
							border-color: #ee4d2d;
							box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;">Xóa sản phẩm</button>
						&nbsp;&nbsp;&nbsp;
						
						<button type="submit"
							formaction="updateProduct.jsp?prodid=<%=product.getProdId()%>"
							class="btn btn-primary" style="box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;background-color: #33bfd3;border-color: #33bfd3">Cập nhật sản phẩm</button>
					</form>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<!-- ENd of Product Items List -->

	<%@ include file="footer.jsp"%>

</body>
</html>