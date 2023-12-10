<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.cnw.shoppingweb.service.impl.*, com.cnw.shoppingweb.service.*,com.cnw.shoppingweb.beans.*,java.util.*,jakarta.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Cập Nhật Sản Phẩmm</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
	<link rel="stylesheet" href="css/FormProduct.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f5f5f5;">
	<%
	/* Checking the user credentials */
	String utype = (String) session.getAttribute("usertype");
	String uname = (String) session.getAttribute("username");
	String pwd = (String) session.getAttribute("password");
	String prodid = request.getParameter("prodid");
	ProductBean product = new ProductServiceImpl().getProductDetails(prodid);
	if (prodid == null || product == null) {
		response.sendRedirect("updateProductById.jsp?message=Please Enter a valid product Id");
		return;
	} else if (utype == null || !utype.equals("ADMIN")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
		return;
	} else if (uname == null || pwd == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>

	<jsp:include page="header.jsp" />

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./UpdateProductSrv" method="post"
				class="col-md-6 col-md-offset-3 "
				style=" background-color: #fff;
						border-radius: 10px;
						padding: 10px;
						box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<img src="./ShowImage?pid=<%=product.getProdId()%>"
							alt="Product Image" height="100px" />
						<h2 style="color: green;">Form Cập Nhật Sản Phẩm</h2>
					</div>

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
				<div class="row">
					<input type="hidden" name="pid" class="form-control"
						value="<%=product.getProdId()%>" id="last_name" required>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Tên sản phẩm</label> <input type="text"
							placeholder="Nhập tên sản phẩm" name="name" class="form-control"
							value="<%=product.getProdName()%>" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<%
						String ptype = product.getProdType();
						%>
						<label for="producttype">Loại sản phẩm</label> <select name="type"
							id="producttype" class="form-control" required>
							<option value="mobile"
								<%="mobile".equalsIgnoreCase(ptype) ? "selected" : ""%>>GIÀY DÉP</option>
							<option value="tv"
								<%="tv".equalsIgnoreCase(ptype) ? "selected" : ""%>>TÚI XÁCH</option>
							<option value="camera"
								<%="camera".equalsIgnoreCase(ptype) ? "selected" : ""%>>TRANG SỨC</option>
							<option value="laptop"
								<%="laptop".equalsIgnoreCase(ptype) ? "selected" : ""%>>VÍ</option>
							<option value="other"
								<%="other".equalsIgnoreCase(ptype) ? "selected" : ""%>>ĐỒ DÙNG KHÁC</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Mô tả sản phẩm</label>
					<textarea name="info" class="form-control text-align-left"
						id="last_name" required><%=product.getProdInfo()%></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Giá tiênf</label> <input type="number"
							value="<%=product.getProdPrice()%>"
							placeholder="Nhập giá tiền" name="price" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Số lượng hàng tồn kho</label> <input type="number"
							value="<%=product.getProdQuantity()%>"
							placeholder="Nhập số lượng" class="form-control"
							id="last_name" name="quantity" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4" style="margin-bottom: 2px;">
						<button formaction="adminViewProduct.jsp" class="btn btn-danger">Hủy</button>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn btn-success">Cập nhật sản phẩm</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>