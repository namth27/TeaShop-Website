<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="object.CartItemsObject"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Data - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="css/bootstrap_admin.min.css" rel="stylesheet">
<link href="css/bootstrap-icons.css" rel="stylesheet">
<link href="css/boxicons.min.css" rel="stylesheet">
<link href="css/quill.snow.css" rel="stylesheet">
<link href="css/quill.bubble.css" rel="stylesheet">
<link href="css/remixicon.css" rel="stylesheet">
<link href="css/style_table.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="css/style_admin.css" rel="stylesheet">
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="adminview" class="logo d-flex align-items-center"> <img
				src="img/logo.png" alt=""> <span class="d-none d-lg-block">NiceAdmin</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a> <!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>Lorem Ipsum</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a> <!-- End Messages Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">You have 3 new messages <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="img/messages-1.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Maria Hudson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>4 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="img/messages-2.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Anna Nelson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>6 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="img/messages-3.jpg" alt="" class="rounded-circle">
								<div>
									<h4>David Muldon</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>8 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="dropdown-footer"><a href="#">Show all messages</a>
						</li>

					</ul> <!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="img/profile-img.jpg" alt="Profile" class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">Admin</span>
				</a>
				<!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>ADMIN</h6> <span></span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-person"></i> <span>Thông
									tin tài khoản</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>Cài
									đặt</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="login"> <i class="bi bi-box-arrow-right"></i> <span>Đăng
									xuất</span>
						</a></li>

					</ul>
					<!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link collapsed"
				href="adminview"> <i class="bi bi-grid"></i> <span>Bảng
						Điều Khiển</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-menu-button-wide"></i><span>Chiển Lược</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="components-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="components-alerts.html"> <i
							class="bi bi-circle"></i><span>Khách Hàng</span>
					</a></li>
					<li><a href="components-accordion.html"> <i
							class="bi bi-circle"></i><span>Sản Phẩm</span>
					</a></li>
					<li><a href="components-badges.html"> <i
							class="bi bi-circle"></i><span>Khuyến Mại</span>
					</a></li>

				</ul></li>
			<!-- End Components Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>Đối Tác</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="forms-elements.html"> <i class="bi bi-circle"></i><span>Shopee</span>
					</a></li>
					<li><a href="forms-layouts.html"> <i class="bi bi-circle"></i><span>TikTok</span>
					</a></li>
					<li><a href="forms-editors.html"> <i class="bi bi-circle"></i><span>Lazada</span>
					</a></li>
					<li><a href="forms-validation.html"> <i
							class="bi bi-circle"></i><span>Amazon</span>
					</a></li>
				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item"><a class="nav-link "
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>Giỏ
						hàng</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse show"
					data-bs-parent="#sidebar-nav">
					<li><a href="admincart" class="active"> <i
							class="bi bi-circle"></i><span>Danh Sách</span>
					</a></li>
					<li><a href="adminchartcart"> <i class="bi bi-circle"></i><span>Biểu
								đồ</span>

					</a></li>

				</ul></li>
			<!-- End Tables Nav -->

			<li class="nav-heading">Pages</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="users-profile.html"> <i class="bi bi-person"></i> <span>Profile</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-faq.html"> <i class="bi bi-question-circle"></i> <span>F.A.Q</span>
			</a></li>
			<!-- End F.A.Q Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-contact.html"> <i class="bi bi-envelope"></i> <span>Contact</span>
			</a></li>
			<!-- End Contact Page Nav -->

		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Data Tables</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminview">Home</a></li>
					<li class="breadcrumb-item">Tables</li>
					<li class="breadcrumb-item active">Data</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title" style="text-align: center;">
								<strong>DANH SÁCH GIỎ HÀNG</strong>
							</h5>
							<p style="text-align: center;">
								Khách hàng ID: <strong><%=request.getAttribute("customerId")%></strong>
							</p>
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th>Product Id</th>
										<th>Sản phẩm</th>
										<th>Đơn giá</th>
										<th>Số lượng</th>
										<th>Thành tiền</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<CartItemsObject> cartItems = (List<CartItemsObject>) request.getAttribute("cartItems");
									if (cartItems != null && !cartItems.isEmpty()) {
										for (CartItemsObject item : cartItems) {
									%>
									<tr>
										<td><%= item.getProductID() %></td>
										<td><%=item.getProductName()%></td>
										<td><%=item.getUnitPrice()%></td>
										<td><%=item.getQuantity()%></td>
										<td><%=item.tongTien(item.getUnitPrice(), item.getQuantity())%></td>
									</tr>
									<%
									}
									} else {
									%>
									<tr>
										<td colspan="5" style="text-align: center;">Không có sản
											phẩm nào trong giỏ hàng.</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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