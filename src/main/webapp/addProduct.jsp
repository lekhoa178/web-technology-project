<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Thêm Sản Phẩm</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/changes.css" />
    <link rel="stylesheet" href="css/FormProduct.css" />
  </head>
  <body style="background-color: #e6f9e6">
    <% /* Checking the user credentials */ String userType = (String)
    session.getAttribute("usertype"); String userName = (String)
    session.getAttribute("username"); String password = (String)
    session.getAttribute("password"); if (userType == null ||
    !userType.equals("admin")) { response.sendRedirect("login.jsp?message=Access
    Denied, Login as admin!!"); } else if (userName == null || password == null)
    { response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
    } %>

    <jsp:include page="header.jsp" />

    <% String message = request.getParameter("message"); %>
    <div class="container">
      <div
        class="row"
        style="margin-top: 5px; margin-left: 2px; margin-right: 2px"
      >
        <form
          action="./AddProductSrv"
          method="post"
          enctype="multipart/form-data"
          class="col-md-6 col-md-offset-3 form-container"
        >
          <div style="font-weight: bold" class="text-center">
            <h2 style="color: green">Thêm Sản Phẩm</h2>
            <% if (message != null) { %>
            <p style="color: blue"><%=message%></p>
            <% } %>
          </div>
          <div></div>
          <div class="row">
            <div class="col-md-6 form-group">
              <label for="last_name">Tên Sản Phẩm</label>
              <input
                type="text"
                placeholder="Nhập tên sản phẩm"
                name="name"
                class="form-control"
                id="last_name"
                required
              />
            </div>
            <div class="col-md-6 form-group">
              <label for="producttype">Loại Sản Phẩm</label>
              <select
                name="type"
                id="producttype"
                class="form-control"
                required
              >
                <option value="shoes">GIÀY DÉP</option>
                <option value="handbag">TÚI SÁCH</option>
                <option value="jewellery">TRANG SỨC</option>
                <option value="wallet">VÍ</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="last_name">Mô Tả Sản Phẩm</label>
            <textarea
              name="info"
              class="form-control"
              id="last_name"
              required
            ></textarea>
          </div>
          <div class="row">
            <div class="col-md-6 form-group">
              <label for="last_name">Tiền Tệ</label>
              <input
                type="number"
                placeholder="Nhập Tiền Tệ"
                name="price"
                class="form-control"
                id="last_name"
                required
              />
            </div>
            <div class="col-md-6 form-group">
              <label for="last_name">Số Lượng Sản Phẩm</label>
              <input
                type="number"
                placeholder="Nhập Số Lượng Sản Phẩm"
                name="quantity"
                class="form-control"
                id="last_name"
                required
              />
            </div>
          </div>
          <div>
            <div class="col-md-12 form-group">
              <label for="last_name">Hình Ảnh Sản Phẩm</label>
              <input
                type="file"
                placeholder="Chọn Hình Ảnh"
                name="image"
                class="form-control"
                id="last_name"
                required
              />
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 text-center" style="margin-bottom: 2px">
              <button type="reset" class="btn btn-danger">Reset</button>
            </div>
            <div class="col-md-6 text-center">
              <button type="submit" class="btn btn-success">
                Thêm Sản Phẩm
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <%@ include file="footer.html"%>
  </body>
</html>
