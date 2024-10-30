<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConnectionPool"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="categories.*"%>
<%@ page import="products.*"%>
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
				src="img/favicon.png" alt=""> <span class="d-none d-lg-block">TeaShop</span>
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
						<span class="d-none d-md-block dropdown-toggle ps-2">NT. Nam</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>NT. Nam</h6> <span>Web Designer</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-person"></i> <span>Trang
									cá nhân</span>
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

						<li><a class="dropdown-item d-flex align-items-center"
							href="pages-faq.html"> <i class="bi bi-question-circle"></i>
								<span>Hỗ trợ?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="logout"> <i class="bi bi-box-arrow-right"></i> <span>Đăng
									xuất</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
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
					<li><a href="thongkesanpham.jsp" class="active"> <i
							class="bi bi-circle"></i><span>Thống Kê</span>
					</a></li>
					<li><a href="rateproduct"> <i class="bi bi-circle"></i><span>Phản
								Hồi Khách Hàng</span>
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
				href="users-profile.html"> <i class="bi bi-person"></i> <span>Trang
						Cá Nhân</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-faq.html"> <i class="bi bi-question-circle"></i> <span>Hỏi
						Đáp</span>
			</a></li>
			<!-- End F.A.Q Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-contact.html"> <i class="bi bi-envelope"></i> <span>Liên
						Hệ</span>
			</a></li>
			<!-- End Contact Page Nav -->

		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>ApexCharts</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index_admin.jsp">Bảng Điều
							Khiển</a></li>
					<li class="breadcrumb-item">Sản Phẩm</li>
					<li class="breadcrumb-item active">Thống Kê</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">

				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								Biểu đồ Tương tác <span>/Hôm nay</span>
							</h5>


							<!-- Line Chart -->
							<div id="realtimeChart"></div>

							<script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                        const now = new Date();
                                        const dataTimes = [];
                                        const viewsData = [];
                                        const commentsData = [];
                                        const cartData = [];
                                        const buyNowData = [];

                                        for (let i = 0; i <= 24; i += 2) {
                                            const time = new Date(now.getFullYear(), now.getMonth(), now.getDate(), i, 0, 0, 0);
                                            dataTimes.push(time.toISOString());
                                            // Thêm dữ liệu mẫu cho mỗi 2 giờ
                                            viewsData.push(Math.floor(Math.random() * 500));
                                            commentsData.push(Math.floor(Math.random() * 60));
                                            cartData.push(Math.floor(Math.random() * 55));
                                            buyNowData.push(Math.floor(Math.random() * 45));
                                        }

                                        window.chart = new ApexCharts(document.querySelector("#realtimeChart"), {
                                            series: [{
                                                    name: 'Lượt Xem',
                                                    data: viewsData,
                                                }, {
                                                    name: 'Bình luận',
                                                    data: commentsData
                                                }, {
                                                    name: 'Thêm vào Giỏ Hàng',
                                                    data: cartData
                                                }, {
                                                    name: 'Mua Ngay',
                                                    data: buyNowData
                                                }],
                                            chart: {
                                                height: 350,
                                                type: 'line',
                                                toolbar: {
                                                    show: true,
                                                    tools: {
                                                        download: true,
                                                        selection: true,
                                                        zoom: true,
                                                        zoomin: true,
                                                        zoomout: true,
                                                        pan: true,
                                                        reset: true
                                                    },
                                                },
                                            },
                                            markers: {
                                                size: 4
                                            },
                                            colors: ['#4154f1', '#2eca6a', '#ff771d', '#ff4560'],
                                            fill: {
                                                type: "gradient",
                                                gradient: {
                                                    shadeIntensity: 1,
                                                    opacityFrom: 0.3,
                                                    opacityTo: 0.4,
                                                    stops: [0, 90, 100]
                                                }
                                            },
                                            dataLabels: {
                                                enabled: false
                                            },
                                            stroke: {
                                                curve: 'smooth',
                                                width: 2
                                            },
                                            xaxis: {
                                                type: 'datetime',
                                                categories: dataTimes,
                                                title: {
                                                    text: 'Giờ trong Ngày'
                                                }
                                            },
                                            tooltip: {
                                                x: {
                                                    format: 'HH:mm'
                                                },
                                            }
                                        });

                                        chart.render();
                                    });
                                </script>
							<!-- End Line Chart -->

						</div>
					</div>
				</div>

				<%
				ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
				CategoryFunction category = new CategoryFunctionImp(cp);
				ProductFunction product = new ProductFunctionImp(cp);

				ArrayList<String> categories = category.getAllNameCategories();
				String jsonCategories = category.convertListToJSONString(categories);

				ArrayList<Integer> sl = product.getTotalUnitInStockByCategory();
				ArrayList<Integer> slOrder = product.getTotalUnitsOnOrderByCategory();
				%>

				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title" style="text-align: center;">Biểu Đồ
								Thống Kê Số Lượng Theo Thể Loại</h5>

							<!-- Pie Chart -->
							<div id="pieChart"></div>

							<script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                        new ApexCharts(document.querySelector("#pieChart"), {
                                            series: <%=sl%>,
                                            chart: {
                                                height: 360,
                                                type: 'pie',
                                                toolbar: {
                                                    show: true
                                                }
                                            },
                                            labels: <%=jsonCategories%>
                                        }).render();
                                    });
                                </script>
							<!-- End Pie Chart -->

						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title" style="text-align: center;">Biều Đồ
								Thống Kê Số Lượng Sản Phẩm Bán Được Theo Thể Loại</h5>

							<!-- Column Chart -->
							<div id="columnChart"></div>

							<script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                        new ApexCharts(document.querySelector("#columnChart"), {
                                            series: [{
                                                    name: 'Tổng số lượng',
                                                    data: <%=sl%>
                                                }, {
                                                    name: 'Số lượng bán được',
                                                    data: <%=slOrder%>
                                                }, {
                                                    name: 'Số lượng tồn kho',
                                    <%ArrayList<Integer> result = new ArrayList<>();

							for (int i = 0; i < sl.size(); i++) {
								int diff = sl.get(i) - slOrder.get(i);
								result.add(diff);
							}%>
                                                    data: <%=result%>
                                                }],

                                            chart: {
                                                type: 'bar',
                                                height: 350
                                            },
                                            plotOptions: {
                                                bar: {
                                                    horizontal: false,
                                                    columnWidth: '55%',
                                                    endingShape: 'rounded'
                                                },
                                            },
                                            dataLabels: {
                                                enabled: false
                                            },
                                            stroke: {
                                                show: true,
                                                width: 2,
                                                colors: ['transparent']
                                            },
                                            xaxis: {

                                                categories: <%=jsonCategories%>,
                                            },
                                            yaxis: {
                                                title: {
                                                    text: 'Số Lượng'
                                                }
                                            },
                                            fill: {
                                                opacity: 1
                                            },
                                            tooltip: {
                                                y: {
                                                    formatter: function (val) {
                                                        return +val
                                                    }
                                                }
                                            }

                                        }).render();
                                    });
                                </script>
							<!-- End Column Chart -->

						</div>
					</div>
				</div>


				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title" style="text-align: center;">Biểu đồ
								Thống kê Lượt Phản hồi theo Tháng</h5>
							<div id="feedbackChart"></div>

							<script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                        // Dữ liệu mẫu cho biểu đồ cột về lượt phản hồi theo tháng và loại sản phẩm
                                        const productCategories = <%=jsonCategories%>;
                                        const feedbackCounts = [
                                            [30, 40, 35, 50, 49, 60, 70, 91], // Tháng 1
                                            [20, 30, 25, 35, 39, 40, 45, 50], // Tháng 2
                                            [25, 35, 30, 40, 42, 50, 55, 60], // Tháng 3
                                            [28, 40, 33, 45, 48, 55, 60, 70], // Tháng 4
                                            [35, 50, 45, 55, 52, 60, 65, 75], // Tháng 5
                                            [40, 60, 50, 65, 60, 70, 75, 85], // Tháng 6
                                            [45, 65, 55, 70, 65, 75, 80, 90], // Tháng 7
                                            [50, 70, 60, 75, 70, 80, 85, 95], // Tháng 8
                                            [55, 75, 65, 80, 75, 85, 90, 100], // Tháng 9
                                            [60, 80, 70, 85, 80, 90, 95, 105], // Tháng 10
                                            [65, 85, 75, 90, 85, 95, 100, 110], // Tháng 11
                                            [70, 90, 80, 95, 90, 100, 105, 115]  // Tháng 12
                                        ];

                                        // Chuyển đổi dữ liệu thành series cho biểu đồ
                                        const monthNames = [
                                            'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
                                            'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8',
                                            'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'
                                        ];

                                        const series = monthNames.map((monthName, index) => ({
                                                name: monthName,
                                                data: feedbackCounts[index]
                                            }));

                                        // Cấu hình biểu đồ
                                        const options = {
                                            series: series,
                                            chart: {
                                                type: 'bar',
                                                height: 350,
                                                stacked: true
                                            },
                                            xaxis: {
                                                categories: productCategories,
                                                title: {
                                                    text: 'Thể loại Sản phẩm'
                                                }
                                            },
                                            yaxis: {
                                                title: {
                                                    text: 'Lượt Phản hồi'
                                                }
                                            },
                                            tooltip: {
                                                y: {
                                                    formatter: function (val) {
                                                        return `${val} lượt`;
                                                    }
                                                }
                                            }
                                        };

                                        // Tạo và hiển thị biểu đồ
                                        const chart = new ApexCharts(document.querySelector("#feedbackChart"), options);
                                        chart.render();
                                    });
                                </script>
						</div>
					</div>
				</div>


				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title" style="text-align: center;">Biểu Đồ
								Thống Kê Về Giá Sản Phẩm Theo Loại Sản Phẩm</h5>
							<div id="boxPlotChart"></div>

							<script>
						        document.addEventListener("DOMContentLoaded", () => {
						          // Dữ liệu mẫu cho biểu đồ hộp
						          const series = [
						            {
						              type: 'boxPlot',
						              data: [
						                {
						                  x: 'Trà Shan Tuyết',
						                  y: <%= product.getStatisticalByUnitprice(1) %>
						                },
						                {
						                  x: 'Trà Thái Nguyên',
						                  y: <%= product.getStatisticalByUnitprice(2) %>
						                },
						                {
						                  x: 'Trà Ô Long',
						                  y: <%= product.getStatisticalByUnitprice(3) %>
						                },
						                {
						                  x: 'Trà Phổ Nhĩ',
						                  y: <%= product.getStatisticalByUnitprice(4) %>
						                },
						                {
						                  x: 'Bạch Trà',
						                  y: <%= product.getStatisticalByUnitprice(5) %>
						                },
						                {
						                  x: 'Hồng Trà',
						                  y: <%= product.getStatisticalByUnitprice(6) %>
						                },
						                {
						                  x: 'Lục Trà',
						                  y: <%= product.getStatisticalByUnitprice(7) %>
						                },
						                {
						                  x: 'Đại Hồng Bào',
						                  y: <%= product.getStatisticalByUnitprice(8) %>
						                }
						              ]
						            }
						          ];
						
						          const options = {
						            series: series,
						            chart: {
						              type: 'boxPlot',
						              height: 350
						            },
						            title: {
						              align: 'left'
						            },
						            xaxis: {
						              title: {
						                text: 'Loại sản phẩm'
						              }
						            },
						            yaxis: {
						              title: {
						                text: 'Giá'
						              }
						            }
						          };
						
						          const chart = new ApexCharts(document.querySelector("#boxPlotChart"), options);
						          chart.render();
						        });
						      </script>
							<!-- End Radar Chart -->
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