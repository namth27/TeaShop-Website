<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="object.*"%>
<%@ page import="java.util.ArrayList"%>
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
			<a href="index_admin.jsp" class="logo d-flex align-items-center"> <img
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
				</a>
				<!-- End Notification Icon -->

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

					</ul>
					<!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a>
				<!-- End Messages Icon -->

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

					</ul>
					<!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="img/profile-img.jpg" alt="Profile" class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">NT. Nam</span>
				</a>
				<!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>NT. Nam</h6> <span>Web Designer</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="pages-faq.html"> <i class="bi bi-question-circle"></i>
								<span>Need Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="logout"> <i class="bi bi-box-arrow-right"></i> <span>Đăng xuất</span>
						</a></li>

					</ul>
					<!-- End Profile Dropdown Items --></li>
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
				href="index_admin.jsp"> <i class="bi bi-grid"></i> <span>Bảng
						Điều Khiển</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-gem"></i><span>Chiến lược</span><i
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
					<i class="bi bi-people"></i></i><span>Đối Tác</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse"
					data-bs-parent="#sidebar-nav">
					<li><a href="forms-elements.html" class="active"> <i
							class="bi bi-circle"></i><span>Shopee</span>
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

			<li class="nav-item"><a class="nav-link"
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>Sản
						Phẩm</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse show"
					data-bs-parent="#sidebar-nav">
					<li><a href="adminproduct"> <i class="bi bi-circle"></i><span>Danh
								Sách</span>
					</a></li>
					<li><a href="formsanpham.jsp"> <i class="bi bi-circle"></i><span>Thêm</span>
					</a></li>
					<li><a href="thongkesanpham.jsp"> <i class="bi bi-circle"></i><span>Thống
								Kê</span>
					</a></li>
					<li><a href="phanhoisanpham.jsp" class="active"> <i
							class="bi bi-circle"></i><span>Phản Hồi Khách Hàng</span>
					</a></li>
				</ul></li>
			<!-- End Tables Nav -->

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
			<h1>Phản Hồi Khách Hàng</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index_admin.jsp">Bảng Điều
							Khiển</a></li>
					<li class="breadcrumb-item">Sản Phẩm</li>
					<li class="breadcrumb-item active">Phản Hồi Khách Hàng</li>
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
								<strong>DANH SÁCH THÔNG TIN PHẢN HỒI CỦA KHÁCH HÀNG</strong>
							</h5>

							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th><b>M</b>ã sản phẩm</th>
										<th>Khách hàng</th>
										<th>Email</th>
										<th>Thời gian</th>
										<th>Đánh giá</th>
										<th>Hành Động</th>
									</tr>
								</thead>
								<%
                                        String message = (String) session.getAttribute("message");
                                        if (message != null) {
                                    %>
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <%= message %>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                    <%
                                            session.removeAttribute("message"); // Xóa thông báo sau khi hiển thị
                                        }
                                    %>
								<tbody>
									<%
									ArrayList<CustomerRate> ds = (ArrayList<CustomerRate>) request.getAttribute("ds");
									if (ds != null) {
										for (CustomerRate rate : ds) {
									%>
									<tr>
										<td><%=rate.getProductID()%></td>
										<td><%=rate.getCustomerName()%></td>
										<td><%=rate.getEmail()%></td>
										<td><%=rate.getTimeRate()%></td>
										<td><%=rate.getResponse()%></td>
										<td>
											<!-- Nút phản hồi --> <a
											class="btn btn-primary btn-sm text-white"
											href="https://mail.google.com/" target="_blank"> <i
												class="bi bi-send-check"> Phản hồi</i>
										</a> <!-- Nút hoàn thành -->
											<button type="button"
												class="btn btn-success btn-sm text-white"
												data-bs-toggle="modal"
												data-bs-target="#confirmCompleteModal<%=rate.getRateID()%>">
												<i class="bi bi-check2-circle"> Đánh dấu</i>
											</button>
										</td>
									</tr>

									<!-- Modal xác nhận hoàn thành -->
									<div class="modal fade"
										id="confirmCompleteModal<%=rate.getRateID()%>" tabindex="-1"
										aria-labelledby="confirmCompleteModalLabel<%=rate.getRateID()%>"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title"
														id="confirmCompleteModalLabel<%=rate.getRateID()%>">Xác
														nhận hoàn thành</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Bạn có chắc chắn muốn đánh dấu
													phản hồi này là hoàn thành?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Hủy</button>
													<form action="adminrate" method="post"
														style="display: inline;">
														<input type="hidden" name="action" value="complete">
														<input type="hidden" name="RateID"
															value="<%=rate.getRateID()%>">
														<button type="submit" class="btn btn-success">Hoàn
															thành</button>
													</form>
												</div>
											</div>
										</div>
									</div>
									<%
									}
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