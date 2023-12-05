<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.cnw.shoppingweb.service.impl.*, com.cnw.shoppingweb.service.*,com.cnw.shoppingweb.beans.*,java.util.*,jakarta.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Ellison Electronics</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body style="background-color: #E6F9E6;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>



	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: black; font-size: 14px; font-weight: bold;"><%=message%></div>
	<!-- <script>document.getElementById('mycart').innerHTML='<i data-count="20" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;"></i>'</script>
 -->
	<!-- Start of Product Items List -->
	<div class="container">
		<div class="row text-center">

			<%
			for (ProductBean product : products) {
				int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
			%>
			<div class="col-sm-4" style='height: 350px;'>
				<div class="thumbnail" style="height: 340px;box-shadow: rgba(0, 0, 0, 0.24) 0px 2px 5px;">
					<img src="ShowImage?pid=<%=product.getProdId()%>" alt="Product"
						style="height: 150px; max-width: 180px">
					<%
						String productName = product.getProdName();
						if(productName.length() > 20){
							productName = productName.substring(0, 20) + " ...";
						}
					%>
					<p class="productname"><%=productName%>
					</p>
					<%
					String description = product.getProdInfo();
					if(description.length() > 100){
					description = description.substring(0, Math.min(description.length(), 100)) + " ...";
					}

					%>
					<p class="productinfo"><%=description%>
					</p>
					<p class="price">
						Vnd
						<%=product.getProdPrice()%>
					</p>
					<form method="post">
						<%
						if (cartQty == 0) {
						%>
						<button type="submit"
								style="border-radius: 10px;
								box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
								background-color: #ee4d2d;
								border-color: #ef4223"

							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
							class="btn--add btn ">Add to Cart</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit"
								style="border-radius: 10px;
								/*border-color: #004a9f;*/
								/*background-color: #053bad;*/
								box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
								:hover {
								color: #d0d2d5 !important;
								}"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
							class="btn--buy btn btn-black-hover" >Buy Now</button>
						<%
						} else {
						%>
						<button type="submit"
								style="box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;background-color: #e77b26;border-color: #d36b33"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0"
							class="btn btn-danger">Remove From Cart</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit" formaction="cartDetails.jsp"
							class="btn btn-success" style="box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;background-color: #33bfd3;border-color: #33bfd3">Checkout</button>
						<%
						}
						%>
					</form>
					<br />
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<!-- ENd of Product Items List -->


	<%@ include file="footer.html"%>

</body>
</html>