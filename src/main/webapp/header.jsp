<%@ page import="com.cnw.shoppingweb.service.impl.CartServiceImpl" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Đăng Xuất</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="/css/changes.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>
  <body style="background-color: #e6f9e6">
    <!--Company Header Starting  -->
    <div
      class="container-fluid text-center"
      style="
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
        margin: 45px 0;
        background-color: #ee4d2d;
        color: white;
        padding: 5px;
      "
    >
      <h2 style="font-weight: bold">👟👜👔💍Cửa Hàng Thời Trang</h2>
      <form class="form-inline" action="index.jsp" method="get">
        <div
          class="input-group"
          style="
            border: none;
            border-radius: 5px;
            padding: 2px;
            background-color: white;
          "
        >
          <input
            type="text"
            class="form-control shadow-none"
            style="border: none; box-shadow: none"
            size="100"
            name="search"
            placeholder="Tìm kiếm sản phẩm"
            required
          />
          <div class="input-group-btn">
            <input
              type="submit"
              style="
                background-color: #ee4d2d;
                border: 0;
                border-radius: 3px;
                margin-right: 1px;
              "
              class="btn btn-primary"
              value="Tìm kiếm"
            />
          </div>
        </div>
      </form>

      <%
      String userType = (String)
                session.getAttribute("usertype");
      int notf = new CartServiceImpl().getCartCount((String)
      session.getAttribute("username")); if (notf == 0 && userType != null && userType.equals("USER")) { %>
      <a href="cartDetails.jsp">
        <span class="glyphicon glyphicon-shopping-cart">Giỏ hàng</span>
      </a>

      <% } else { %>
      <a href="cartDetails.jsp" style="margin: 0px; padding: 0px" id="mycart"
        ><i
          data-count="<%=notf%>"
          class="fa fa-shopping-cart fa-3x icon-white badge"
          style="
            background-color: #fff;
            color: #ee4d2d;
            margin: 0px;
            padding: 0px;
            padding-bottom: 0px;
            padding-top: 5px;
          "
        >
        </i
      ></a>
      <% } %>
    </div>
    <!-- Company Header Ending -->

    <% /* Checking the user credentials */ if (userType == null) { //LOGGED OUT %>

    <!-- Starting Navigation Bar -->
    <nav class="navbar navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button
            type="button"
            class="navbar-toggle"
            data-toggle="collapse"
            data-target="#myNavbar1"
          >
            <span class="icon-bar"></span> <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">
            <span class="glyphicon glyphicon-home">&nbsp; </span>
            Bài tập công nghệ Web
          </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="login.jsp">Đăng nhập</a></li>
            <li><a href="register.jsp">Đăng kí</a></li>
            <li><a href="index.jsp">Sản phẩm</a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"
                >Danh mục<span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li><a href="index.jsp?type=shoes">Giày dép</a></li>
                <li><a href="index.jsp?type=handbag">Túi xách</a></li>
                <li><a href="index.jsp?type=jewellery">Trang sức</a></li>
                <li><a href="index.jsp?type=wallet">Ví</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <% } else if ("USER".equalsIgnoreCase(userType)) { //CUSTOMER HEADER %>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button
            type="button"
            class="navbar-toggle"
            data-toggle="collapse"
            data-target="#myNavbar"
          >
            <span class="icon-bar"></span> <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="userHome.jsp"
            ><span class="glyphicon glyphicon-home">&nbsp;</span>Bài tập công
            nghệ Web</a
          >
        </div>

        <div class="collapse navbar-collapse" id="myNavbar1">
          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="userHome.jsp"><span>Sản phẩm</span></a>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"
                >Danh mục<span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li><a href="userHome.jsp?type=shoes">Giày dép</a></li>
                <li><a href="userHome.jsp?type=handbag">Túi xách</a></li>
                <li><a href="userHome.jsp?type=jewellery">Trang sức</a></li>
                <li><a href="userHome.jsp?type=wallet">Ví</a></li>
              </ul>
            </li>

            <li><a href="profile.jsp">Hồ sơ</a></li>
            <li><a href="./LogoutSrv">Đăng xuất</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <% } else if ("ADMIN".equalsIgnoreCase(userType)) { //ADMIN HEADER %>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button
            type="button"
            class="navbar-toggle"
            data-toggle="collapse"
            data-target="#myNavbar"
          >
            <span class="icon-bar"></span> <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="adminViewProduct.jsp"
            ><span class="glyphicon glyphicon-home">&nbsp;</span>Bài tập công
            nghệ Web</a
          >
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="adminViewProduct.jsp">Sản phẩm</a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"
                >Danh mục<span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li><a href="adminViewProduct.jsp?type=shoes">Giày dép</a></li>
                <li>
                  <a href="adminViewProduct.jsp?type=handbag">Túi xách</a>
                </li>
                <li>
                  <a href="adminViewProduct.jsp?type=jewellery">Trang sức</a>
                </li>
                <li><a href="adminViewProduct.jsp?type=wallet">Ví</a></li>
              </ul>
            </li>
            <li><a href="adminStock.jsp">Kho hàng</a></li>
            <li><a href="shippedItems.jsp">Đã giao</a></li>
            <li><a href="unshippedItems.jsp">Đơn hàng</a></li>
            <!-- <li><a href=""> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Cart</a></li> -->
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"
                >Cập nhật sản phẩm<span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li><a href="addProduct.jsp">Thêm sản phẩm</a></li>
                <li><a href="removeProduct.jsp">Xóa sản phẩm</a></li>
                <li><a href="updateProductById.jsp">Cập nhật sản phẩm</a></li>
              </ul>
            </li>
            <li><a href="./LogoutSrv">Đăng xuất</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <% } %>
    <!-- End of Navigation Bar -->
  </body>
</html>
