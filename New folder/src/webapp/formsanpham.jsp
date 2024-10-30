<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="object.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>TeaShop - Trang Quản Lý</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="css/bootstrap_admin.min.css" rel="stylesheet">
        <link href="css/bootstrap-icons.css" rel="stylesheet">
        <link href="css/boxicons.min.css" rel="stylesheet">
        <link href="css/quill.snow.css" rel="stylesheet">
        <link href="css/quill.bubble.css" rel="stylesheet">
        <link href="css/remixicon.css" rel="stylesheet">
        <link href="css/style_table.css" rel="stylesheet">General Form Elements

        <!-- Template Main CSS File -->
        <link href="css/style_admin.css" rel="stylesheet">

    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="index_admin.jsp" class="logo d-flex align-items-center">
                    <img src="img/logo.png" alt="">
                    <span class="d-none d-lg-block">NiceAdmin</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div><!-- End Logo -->

            <div class="search-bar">
                <form class="search-form d-flex align-items-center" method="POST" action="#">
                    <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                    <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                </form>
            </div><!-- End Search Bar -->

            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">

                    <li class="nav-item d-block d-lg-none">
                        <a class="nav-link nav-icon search-bar-toggle " href="#">
                            <i class="bi bi-search"></i>
                        </a>
                    </li><!-- End Search Icon-->

                    <li class="nav-item dropdown">

                        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                            <i class="bi bi-bell"></i>
                            <span class="badge bg-primary badge-number">4</span>
                        </a><!-- End Notification Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                            <li class="dropdown-header">
                                You have 4 new notifications
                                <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-exclamation-circle text-warning"></i>
                                <div>
                                    <h4>Lorem Ipsum</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>30 min. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-x-circle text-danger"></i>
                                <div>
                                    <h4>Atque rerum nesciunt</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>1 hr. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-check-circle text-success"></i>
                                <div>
                                    <h4>Sit rerum fuga</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>2 hrs. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-info-circle text-primary"></i>
                                <div>
                                    <h4>Dicta reprehenderit</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>4 hrs. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li class="dropdown-footer">
                                <a href="#">Show all notifications</a>
                            </li>

                        </ul><!-- End Notification Dropdown Items -->

                    </li><!-- End Notification Nav -->

                    <li class="nav-item dropdown">

                        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                            <i class="bi bi-chat-left-text"></i>
                            <span class="badge bg-success badge-number">3</span>
                        </a><!-- End Messages Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
                            <li class="dropdown-header">
                                You have 3 new messages
                                <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="message-item">
                                <a href="#">
                                    <img src="img/messages-1.jpg" alt="" class="rounded-circle">
                                    <div>
                                        <h4>Maria Hudson</h4>
                                        <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                        <p>4 hrs. ago</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="message-item">
                                <a href="#">
                                    <img src="img/messages-2.jpg" alt="" class="rounded-circle">
                                    <div>
                                        <h4>Anna Nelson</h4>
                                        <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                        <p>6 hrs. ago</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="message-item">
                                <a href="#">
                                    <img src="img/messages-3.jpg" alt="" class="rounded-circle">
                                    <div>
                                        <h4>David Muldon</h4>
                                        <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                        <p>8 hrs. ago</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="dropdown-footer">
                                <a href="#">Show all messages</a>
                            </li>

                        </ul><!-- End Messages Dropdown Items -->

                    </li><!-- End Messages Nav -->

                    <li class="nav-item dropdown pe-3">

                        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                            <img src="img/profile-img.jpg" alt="Profile" class="rounded-circle">
                            <span class="d-none d-md-block dropdown-toggle ps-2">NT. Nam</span>
                        </a><!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6>NT. Nam</h6>
                                <span>Web Designer</span>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                                    <i class="bi bi-person"></i>
                                    <span>My Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                                    <i class="bi bi-gear"></i>
                                    <span>Account Settings</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                                    <i class="bi bi-question-circle"></i>
                                    <span>Need Help?</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Sign Out</span>
                                </a>
                            </li>

                        </ul><!-- End Profile Dropdown Items -->
                    </li><!-- End Profile Nav -->

                </ul>
            </nav><!-- End Icons Navigation -->

        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link collapsed" href="index_admin.jsp">
                        <i class="bi bi-grid"></i>
                        <span>Bảng Điều Khiển</span>
                    </a>
                </li><!-- End Dashboard Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-gem"></i><span>Chiến Lược</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="components-alerts.html">
                                <i class="bi bi-circle"></i><span>Alerts</span>
                            </a>
                        </li>
                        <li>
                            <a href="components-accordion.html">
                                <i class="bi bi-circle"></i><span>Accordion</span>
                            </a>
                        </li>
                        <li>
                            <a href="components-badges.html">
                                <i class="bi bi-circle"></i><span>Badges</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Components Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-people"></i></i><span>Đối Tác</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="forms-elements.html" class="active">
                                <i class="bi bi-circle"></i><span>Form Elements</span>
                            </a>
                        </li>
                        <li>
                            <a href="forms-layouts.html">
                                <i class="bi bi-circle"></i><span>Form Layouts</span>
                            </a>
                        </li>
                        <li>
                            <a href="forms-editors.html">
                                <i class="bi bi-circle"></i><span>Form Editors</span>
                            </a>
                        </li>
                        <li>
                            <a href="forms-validation.html">
                                <i class="bi bi-circle"></i><span>Form Validation</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Forms Nav -->

                <li class="nav-item">
                    <a class="nav-link" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-layout-text-window-reverse"></i><span>Sản Phẩm</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="tables-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="adminproduct">
                                <i class="bi bi-circle"></i><span>Danh Sách</span>
                            </a>
                        </li>
                        <%
                            String sua = (String) session.getAttribute("sua");
                            if (sua != null) {
                        %>
                        <li>
                            <a href="formsanpham.jsp" class="active">
                                <i class="bi bi-circle"></i><span><%= sua %></span>
                            </a>
                        </li>
                        <% 
                            } else {
                        %>
                        <li>
                            <a href="formsanpham.jsp" class="active">
                                <i class="bi bi-circle"></i><span>Thêm</span>
                            </a>
                        </li>
                        <%
                            }
                        %>
                        <li>
                            <a href="thongkesanpham.jsp">
                                <i class="bi bi-circle"></i><span>Thống Kê</span>
                            </a>
                        </li>
                        <li>
                            <a href="rateproduct">
                                <i class="bi bi-circle"></i><span>Phản Hồi Khách Hàng</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Tables Nav -->

                <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-person-check"></i><span>Tài Khoản</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="admincustomer">
              <i class="bi bi-circle"></i><span>Danh Sách</span>
            </a>
          </li>
          <li>
            <a href="formtaikhoan.jsp">
              <i class="bi bi-circle"></i><span>Thêm</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-clipboard-check"></i><span>Giỏ Hàng</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="admincart">
              <i class="bi bi-circle"></i><span>Danh Sách</span>
            </a>
          </li>
          <li>
            <a href="adminchartcart">
              <i class="bi bi-circle"></i><span>Biểu Đồ</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->
	  
	  <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#ds-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bag-check"></i><span>Đơn Hàng</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="ds-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="adminorder">
              <i class="bi bi-circle"></i><span>Danh Sách</span>
            </a>
          </li>
          <li>
            <a href="ChartOrder.jsp">
              <i class="bi bi-circle"></i><span>Thống Kê</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

                <li class="nav-heading">Pages</li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="users-profile.html">
                        <i class="bi bi-person"></i>
                        <span>Trang cá nhân</span>
                    </a>
                </li><!-- End Profile Page Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="pages-faq.html">
                        <i class="bi bi-question-circle"></i>
                        <span>Hỏi Đáp</span>
                    </a>
                </li><!-- End F.A.Q Page Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="pages-contact.html">
                        <i class="bi bi-envelope"></i>
                        <span>Liên Hệ</span>
                    </a>
                </li><!-- End Contact Page Nav -->

            </ul>

        </aside><!-- End Sidebar-->


        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Form Elements</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index_admin.jsp">Bảng Điều Khiển</a></li>
                        <li class="breadcrumb-item">Sản Phẩm</li>
                        <li class="breadcrumb-item active">Elements</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center;">Thông Tin Sản Phẩm</h5>

                                <%
                                    ProductObject Product = (ProductObject) request.getAttribute("product"); 
                                    if (Product != null) {
                                    int productID = Product.getProductID();
                                %>
                                <!-- General Form Elements -->
                                <form action="formproduct" method="post" accept-charset="UTF-8">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="productId" value="<%= productID %>">
                                    <div class="row mb-3">
                                        <label for="inputText" class="col-sm-2 col-form-label">Tên Sản Phẩm</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="tenSanPham" value="<%= Product.getProductName() %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Ảnh Sản Phẩm</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" type="file" id="formFile" value="<%= Product.getProductImage() %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Mã Nhà Cung Cấp</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="maNCC" value="<%= Product.getSupplierID() %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Mã Thể Loại</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="maTheLoai" value="<%= Product.getCategoryID() %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputText" class="col-sm-2 col-form-label">Khối Lượng / 1ĐV</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="khoiLuong" value="<%= Product.getQuantityPerUnit() %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Giá Tiền / 1 ĐV</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="giaTien" value="<%= Product.getUnitPrice() %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Số Lượng</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="soLuong" value="<%= Product.getUnitsInStock() %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Mô Tả</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" style="height: 100px" name="moTa"><%= Product.getDescription() %></textarea>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-3">
                                        <legend class="col-form-label col-sm-2 pt-0">Sản Suất</legend>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="false" <%= Product.isDiscontinued() ? "checked" : "" %>>
                                                <label class="form-check-label" for="gridRadios1">
                                                    Còn Sản Suất
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="true" <%= !Product.isDiscontinued() ? "checked" : "" %>>
                                                <label class="form-check-label" for="gridRadios2">
                                                    Tạm Dừng
                                                </label>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <div class="row mb-3">
                                        <div class="col-sm-10 d-flex justify-content-center">
                                            <% if (sua != null) { %>
                                            <button type="submit" class="btn btn-primary mx-2">Cập nhật</button>
                                            <% } else { %>
                                            <button type="submit" class="btn btn-primary mx-2">Thêm mới</button>
                                            <% } %>
                                            <button type="reset" class="btn btn-danger mx-2">Hủy bỏ</button>
                                        </div>
                                    </div>

                                </form><!-- End General Form Elements -->
                                <%
                                    } else {
                                        ArrayList<String> errors = (ArrayList<String>) request.getAttribute("errors");
                                        if (errors != null && !errors.isEmpty()) {
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <ul>
                                        <% for (String error : errors) { %>
                                        <li><%= error %></li>
                                            <% } %>
                                    </ul>
                                </div>
                                <% } %>
                                <form action="formproduct" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <div class="row mb-3">
                                        <label for="inputText" class="col-sm-2 col-form-label">Tên Sản Phẩm</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="tenSanPham" value="<%= request.getParameter("tenSanPham") != null ? request.getParameter("tenSanPham") : "" %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="formFile" class="col-sm-2 col-form-label">Ảnh Sản Phẩm</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" type="file" id="formFile" name="anhSanPham">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Mã Nhà Cung Cấp</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="maNCC" value="<%= request.getParameter("maNCC") != null ? request.getParameter("maNCC") : "" %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Mã Thể Loại</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="maTheLoai" value="<%= request.getParameter("maTheLoai") != null ? request.getParameter("maTheLoai") : "" %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputText" class="col-sm-2 col-form-label">Khối Lượng / 1ĐV</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="khoiLuong" value="<%= request.getParameter("khoiLuong") != null ? request.getParameter("khoiLuong") : "" %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Giá Tiền / 1 ĐV</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="giaTien" value="<%= request.getParameter("giaTien") != null ? request.getParameter("giaTien") : "" %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputNumber" class="col-sm-2 col-form-label">Số Lượng</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="soLuong" value="<%= request.getParameter("soLuong") != null ? request.getParameter("soLuong") : "" %>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Mô Tả</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" style="height: 100px" name="moTa"><%= request.getParameter("moTa") != null ? request.getParameter("moTa") : "" %></textarea>
                                        </div>
                                    </div>
                                    <fieldset class="row mb-3">
                                        <legend class="col-form-label col-sm-2 pt-0">Sản Suất</legend>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="sanXuat" id="gridRadios1" value="conSanXuat" 
                                                       <%= "conSanXuat".equals(request.getParameter("sanXuat")) ? "checked" : "" %>>
                                                <label class="form-check-label" for="gridRadios1">
                                                    Còn Sản Suất
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="sanXuat" id="gridRadios2" value="tamDung" 
                                                       <%= "tamDung".equals(request.getParameter("sanXuat")) ? "checked" : "" %>>
                                                <label class="form-check-label" for="gridRadios2">
                                                    Tạm Dừng
                                                </label>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <div class="row mb-3">
                                        <div class="col-sm-10 d-flex justify-content-center">
                                            <button type="submit" class="btn btn-primary mx-2" value="add">Thêm mới</button>
                                            <button type="reset" class="btn btn-danger mx-2">Hủy bỏ</button>
                                        </div>
                                    </div>
                                </form><!-- End General Form Elements -->
                                <%
                                    }
                                %>

                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="js/apexcharts.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/chart.umd.js"></script>
        <script src="js/echarts.min.js"></script>
        <script src="js/quill.min.js"></script>
        <script src="js/simple-datatables.js"></script>
        <script src="js/tinymce.min.js"></script>
        <script src="js/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="js/main.js"></script>

    </body>

</html>