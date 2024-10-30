<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="object.*"%>
<%@ page import="categories.*"%>
<%@ page import="products.*"%>

<!DOCTYPE html>
<html lang="en-US">

<head>
<!-- Meta Tage -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description"
	content="Green Leaf Tea Shop is a modern and functional html Template best suitable for your Tea Company & Online Tea Shop. Green Leaf Tea Shop has an intuitive visual interface and informative layout that looks wonderful on any platform, since it’s fully responsive ">
<meta name="keywords"
	content="	coffee, coffee shop, drink, food, gift shop, online shop, organic, organic tea, responsive, store, tea, tea company, Tea Shop, template, visual composer cv, portfolio, cv Html, Html, Html5, portfolio tamplate, personal website" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />

<!-- Website Title Here -->
<title>Cửa Hàng - TeaShop</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">

<!-- Custom Style -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="css/lightbox.min.css" rel="stylesheet">
<link href="css/owl.carousel.min.css" rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style_cart.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<!-- Custome-Nam -->
<link rel="stylesheet" href="css/custome.css">
</head>

<body>
	<div id="home"></div>
	<!-- Start The Pageloader -->
	<div class="teashop-pageloader">
		<div class="preloader-spinner"></div>
	</div>
	<!-- Pageloader Ends Here -->

	<!-- Start The Header Here -->
	<header>

		<div class="container-fluid fixed-top">
			<div class="container px-0 mt-3">
				<nav class="navbar navbar-light bg-white navbar-expand-xl">
					<h1 class="brand-logo">
						<a class="" href="index.html"><img src="img/logo.png"
							alt="teashop"></a>
					</h1>
					<button class="navbar-toggler py-2 px-3" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
						<span class="fa fa-bars text-primary"></span>
					</button>
					<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
						<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
							<div class="navbar-nav mx-auto">
								<a href="index" class="nav-item nav-link color-header">Trang
									Chủ</a> <a href="about.jsp" class="nav-item nav-link">Giới
									Thiệu</a> <a href="shop" class="nav-item nav-link">Cửa Hàng</a> <a
									href="blog.jsp" class="nav-item nav-link active">Blog</a> <a
									href="index.html#contact" class="nav-item nav-link">Liên Hệ</a>
							</div>


							<div class="d-flex me-0">
								<div class="search-container position-relative">
								<form id="searchForm" class="d-flex search-form" role="search"
									action="shop" method="post" accept-charset="UTF-8">
									<input class="form-control me-2 mt-3 search-input"
										name="content" type="search" placeholder="Search"
										aria-label="Search"> <a href="#"
										onclick="document.getElementById('searchForm').submit();"
										class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-3">
										<span class="fa fa-search text-primary"></span>
									</a>
								</form>
							</div>
							<%-- Kiểm tra trạng thái đăng nhập --%>
							<%
							CustomerObject user = (CustomerObject) request.getSession().getAttribute("Login");
							String cartLink = (user != null) ? "addtocart" : "#loginPromptModal";
							Object slObject = request.getAttribute("sl");
							int sl = 0;
							if (slObject != null && slObject instanceof Integer) {
								sl = (Integer) slObject;
							}
							%>
							<!-- Shopping Cart Icon with login prompt modal -->
							<a href="<%=cartLink%>" class="position-relative me-4 my-auto"
								data-bs-toggle="<%=(user != null) ? "" : "modal"%>"
								data-bs-target="<%=(user != null) ? "" : "#loginPromptModal"%>">
								<i class="fa fa-shopping-cart fa-2x header-icon"></i> <span
								id="cartItemCount"
								class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
								style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
									<%=sl%> <!-- Initial count, can be fetched from session if available -->
							</span>
							</a>

							<!-- Modal for login prompt when clicking on the cart -->
							<div class="modal fade" id="loginPromptModal" tabindex="-1"
								aria-labelledby="loginPromptModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="loginPromptModalLabel">Yêu
												cầu đăng nhập</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Đăng nhập để thực hiện tính năng
											giỏ hàng.</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Đóng</button>
											<a href="login.jsp" class="btn btn-primary">Đăng nhập</a>
										</div>
									</div>
								</div>
							</div>

								<div class="btn-group">
									<a href="#" class="my-auto" data-bs-toggle="dropdown"> <i
										class="fa fa-user fa-2x header-icon"></i>
									</a>
									<ul class="dropdown-menu dropdown-menu-end">
										<%
										if (user == null) {
										%>
										<li><a class="dropdown-item" href="login.jsp">Đăng
												nhập</a></li>
										<%
										} else {
										%>
										<li><a class="dropdown-item" href="#">Chi tiết tài
												khoản</a></li>
										<li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
										<%
										}
										%>
									</ul>

								</div>

							</div>

						</div>
					</div>
				</nav>
			</div>
		</div>


	</header>
	<!-- Header Ends Here -->

	<!-- Start Page Banner Here -->
	<!-- Single Page Header start -->
	<div class="container-fluid page-header banner-shop">
		<h1 class="text-center text-white display-6">Cửa Hàng</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
			<li class="breadcrumb-item active text-white">Cửa Hàng</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- Start Blog Content Here -->
	<section class="section-padding" id="blog-page-content">
		<div class="container">
			<div class="row row-reverse">
				<!-- Start Blog Content Here -->
				<div class="col-md-9 col-md-push-3">
					<!-- Start Search result Here -->
					<div class="search-result">
						<!--<h3>Kết quả tìm kiếm 1-9 trong 12 trang</h3>-->
						<%-- Hiển thị thông báo nếu có --%>
						<%
						String message = (String) request.getAttribute("message");
						if (message != null && !message.isEmpty()) {
						%>
						<h3><%=message%></h3>
						<%
						}
						%>
						<div class="select-form">
							<form action="#">
								<select name="speed" id="speed">
									<option>Sắp xếp theo giá tiền</option>
									<option>Giảm dần</option>
									<option>Tăng dần</option>
								</select>
							</form>
						</div>
					</div>
					<!-- Start Search result Here -->



					<!-- Start Shop Product Here -->
					
						<div class="shop-prodcut">
							<!-- Start Shope Product Row -->
							<div class="row shop-product-list" id="product-list">

								<%
								ArrayList<ProductObject> list_products = (ArrayList<ProductObject>) request.getAttribute("data_products");
								if (list_products != null) {
									for (ProductObject product : list_products) {
								%>
								<div class="col-sm-4 shop-items">
									<div class="shop-cart-box">
										<div class="cart-price">
											<img class="product-img"
												src="img/product/Categoies<%=product.getCategoryID()%>/<%=product.getProductImage()%>.jpg"
												alt="featurs product"
												onclick="sendProductId('<%=product.getProductID()%>')">
											<a class="teashop-btn" href="#">$<%=product.getUnitPrice()%></a>
										</div>
										<p><%=product.getDescription()%></p>
										<%
										if (user != null) { // If the user is logged in
										%>
										<form action="addtocart" method="POST" accept-charset="UTF-8">
											<input type="hidden" name="productId_cart"
												value="<%=product.getProductID()%>"> <input
												type="hidden" name="productImage_cart"
												value="<%=product.getProductImage()%>"> <input
												type="hidden" name="productName_cart"
												value="<%=product.getProductName()%>"> <input
												type="hidden" name="productPrice_cart"
												value="<%=product.getUnitPrice()%>"> <input
												type="hidden" name="quantity_tt" value="1">
											<button type="submit" name="action" value="addtocart"
												class="btn border border-secondary rounded-pill px-3 py-1 mb-4">
												<i class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
												Hàng
											</button>
										</form>
										<%
										} else { // If the user is not logged in
										%>
										<button type="button"
											class="btn border border-secondary rounded-pill py-1 mb-4"
											data-bs-toggle="modal"
											data-bs-target="#loginModal<%=product.getProductID()%>">
											<i class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào
											Giỏ Hàng
										</button>

										<!-- Login Modal -->
										<div class="modal fade"
											id="loginModal<%=product.getProductID()%>" tabindex="-1"
											aria-labelledby="loginModalLabel<%=product.getProductID()%>"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title"
															id="loginModalLabel<%=product.getProductID()%>">Thông
															báo</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">Bạn cần đăng nhập để thực
														hiện chức năng này.</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Đóng</button>
														<a href="login.jsp" class="btn btn-primary">Đăng nhập</a>
													</div>
												</div>
											</div>
										</div>
										<%
										}
										%>

									</div>
								</div>
								<%
								}
								} else {
								%>
								<h3>Chưa có sản phẩm nào</h3>
								<%
								}
								%>

							</div>
							<!-- Ends Shope Product Row -->
						</div>
					
					<!-- Start Shop Product Here -->

					<!-- Start Pagination Here -->
					<div class="pagination-area">
						<ul class="pagination" id="pagination">
							<!-- Nút "Previous" -->
							<li class="page-item disabled" id="prev-page"><a
								class="page-link" href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<!-- Số trang -->
							<!-- Nút "Next" -->
							<li class="page-item" id="next-page"><a class="page-link"
								href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</div>
					<!-- Ends Pagination Here -->



				</div>
				<!-- Ends Blog Content Here -->



				<!-- Start Side Bar Here -->
				<div class="col-md-3 col-md-pull-9">
					<div class="side-bar">
						<!-- Start Search Box Widget -->
						<div class="search-box sidebar-widget">
							<form action="shop" method="post">
								<input type="search" placeholder="Tìm kiếm..." name = "content">
								
								<button type="submit" class="">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
						<!-- Ends Search Box Widget -->

						<!-- Start Categories Widget -->
						<div class="categories-widget sidebar-widget">
							<div class="sidebar-titel">
								<h4>Thể loại</h4>
							</div>
							<ul class="categories-item">
								<%
								
								CategoryFunction categories = new CategoryFunctionImp(null);
								ProductFunction product = new ProductFunctionImp(null);
								ArrayList<CategoriesObject> list_categories = categories.getAllCategories();
								
								if (list_categories != null) {
									for (CategoriesObject category : list_categories) {
								%>
								<li><a href="#" onclick="postCategoryId(<%=category.getCategoryID()%>)"><%=category.getCategoryName()%> <span><%= product.countProductByCategory(category.getCategoryID()) %></span></a></li>
								<%
								}
								}
								%>
							</ul>
						</div>
						<script>
						    function postCategoryId(categoryId) {
						        var form = document.createElement("form");
						        form.setAttribute("method", "post");
						        form.setAttribute("action", "index");
						
						        var hiddenField = document.createElement("input");
						        hiddenField.setAttribute("type", "hidden");
						        hiddenField.setAttribute("name", "categoryId");
						        hiddenField.setAttribute("value", categoryId);
						
						        form.appendChild(hiddenField);
						
						        document.body.appendChild(form);
						        form.submit();
						    }
						</script>
						<!-- Ends Categories Widget -->

						<!-- Start Featurs Product Widget Here -->
						<div class="recent-post-widget sidebar-widget">
							<div class="sidebar-titel">
								<h4>Sản phẩm nổi bật</h4>
							</div>

							<ul class="featured-prodcut-list">
								<li><a href="#"> <img src="img/product/featured/1.jpg"
										alt="Featured Product"> Trà Bạch Hào Ngân Châm <span>
											100.000 VNĐ-180.000 VNĐ</span>

								</a></li>
								<li><a href="#"> <img src="img/product/featured/2.jpg"
										alt="Featured Product"> Trà Lục An Qua Phiến <span>
											150.000 VNĐ-300.000 VNĐ</span>

								</a></li>
								<li><a href="#"> <img src="img/product/featured/3.jpg"
										alt="Featured Product"> Kỳ Môn Hồng Trà <span>
											300.000 VNĐ-500.000 VNĐ</span>

								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Ends Side Bar Here -->
			</div>
		</div>
		<!-- Ends Featurs Product Here -->
	</section>
	<!-- Ends Blog Content Here -->

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>

	<!-- Start Footer Here -->
	<footer class="section-padding" id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="footer-top text-center">
						<img src="img/logo.png" alt="">
						<!-- Social Icons -->
						<div class="social-icons">
							<a href="#"><i class="fa fa-facebook"></i> Facebook</a> <a
								href="#"><i class="fa fa-twitter"></i> Twitter</a> <a href="#"><i
								class="fa fa-linkedin"></i> Linkedin</a>
						</div>
						<!-- Social Icons -->
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom"></div>
	</footer>
	<!-- Ends Footer Here -->

	<!-- 
            All Script Here
    ================================ -->
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-3.3.7.min.js"></script>
	<script type="text/javascript" src="js/sticky.js"></script>
	<script type="text/javascript" src="js/easing.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/isotope-3.0.4.min.js"></script>
	<script type="text/javascript" src="js/magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/wow-1.3.0.min.js"></script>
	<!-- Google Map -->
	<script type="text/javascript" src="js/google-map.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcTTWvVJPW54aA5PEWrQTldVBFDhC0c-Q"></script>
	<!-- Contact Form -->
	<script type="text/javascript" src="js/contact-form.js"></script>
	<!-- Active Scripts Here -->
	<script type="text/javascript" src="js/active.js"></script>
	<!-- JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/lightbox.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!-- Template Javascript -->
	<script src="js/main-cart.js"></script>
	<script src="js/sanpham.js"></script>


</body>

</html>