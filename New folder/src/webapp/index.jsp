<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="object.*"%>

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
<title>Tea Shop</title>

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
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
						<a class="" href="index.jsp"><img src="img/logo.png"
							alt="teashop"></a>
					</h1>
					<button class="navbar-toggler py-2 px-3" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
						<span class="fa fa-bars text-primary"></span>
					</button>
					<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
						<div class="navbar-nav mx-auto">
							<a href="index" class="nav-item nav-link color-header">Trang
								Chủ</a> <a href="about.jsp" class="nav-item nav-link">Giới Thiệu</a>
							<a href="shop" class="nav-item nav-link">Cửa Hàng</a> <a
								href="blog.jsp" class="nav-item nav-link active">Blog</a> <a
								href="index.jsp#contact" class="nav-item nav-link">Liên Hệ</a>
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
				</nav>
			</div>
		</div>


	</header>
	<!-- Header Ends Here -->


	<!-- Start the Homes lider here -->
	<section id="home-slider">
		<!-- Start Slider Wraper Here -->
		<div class="slider-waper mt-3">
			<!-- Slider Single Item -->
			<div class="single-slide-item slider-bg-1 bg-overlay">
				<div class="container">
					<div class="teashop-table">
						<div class="teashop-table-cell">
							<div class="row header-slider">
								<div class="col-md-6">
									<h1>
										<span>Sống khỏe</span> mỗi ngày
									</h1>
									<p>với những ly trà xanh</p>
									<a href="shop.jsp" class="teashop-btn">Mua ngay</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Slider Single Item -->

			<!-- Slider Single Item -->
			<div class="single-slide-item slider-bg-2 bg-overlay">
				<div class="container">
					<div class="teashop-table">
						<div class="teashop-table-cell">
							<div class="row">
								<div class="col-md-6">
									<h1>
										<span>Sống khỏe</span> mỗi ngày
									</h1>
									<p>với những ly trà xanh</p>
									<a href="shop.jsp" class="teashop-btn">Mua ngay</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Slider Single Item -->

			<!-- Slider Single Item -->
			<div class="single-slide-item slider-bg-3 bg-overlay">
				<div class="container">
					<div class="teashop-table">
						<div class="teashop-table-cell">
							<div class="row">
								<div class="col-md-6">
									<h1>
										<span>Sống khỏe</span> mỗi ngày
									</h1>
									<p>với những ly trà xanh</p>
									<a href="shop.jsp" class="teashop-btn">Mua ngay</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Slider Single Item -->

			<!-- Slider Single Item -->
			<div class="single-slide-item slider-bg-4 bg-overlay">
				<div class="container">
					<div class="teashop-table">
						<div class="teashop-table-cell">
							<div class="row">
								<div class="col-md-6">
									<h1>
										<span>Sống khỏe</span> mỗi ngày
									</h1>
									<p>với những ly trà xanh</p>
									<a href="shop.jsp" class="teashop-btn">Mua ngay</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Slider Single Item -->
		</div>
		<!-- Ends Slider Wraper Here -->

		<!-- Start Social Icons Here -->
		<div class="social-icons">
			<div class="container">
				<a href="#"><i class="fa fa-facebook"></i> <span>Facebook</span></a>
				<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i> <span>Twitter</span></a>
				<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i> <span>Linkedin</span></a>
			</div>
		</div>
		<!-- Ends Social Icons Here -->
	</section>
	<!-- Home Slider ends here -->

	<!-- Start Product Here -->
	<section class="section-padding" id="product">
		<div class="container">
			<div class="row title-section">
				<div class="col-sm-8 col-sm-offset-2">
					<!-- Start Section Header Here -->
					<div class="section-header text-center">
						<h2>
							Trà là thức uống tốt cho <span>sức khỏe và sắc đẹp của bạn</span>
						</h2>
						<p>Trà không chỉ là một loại đồ uống thơm ngon mà còn mang lại
							nhiều lợi ích cho sức khỏe. Với chứa chất chống oxy hóa mạnh mẽ,
							trà giúp bảo vệ tế bào khỏi tổn thương và lão hóa sớm. Đồng thời,
							việc uống trà thường xuyên cũng có thể giúp tăng cường hệ miễn
							dịch, giảm căng thẳng và cải thiện tinh thần.</p>
					</div>
					<!-- Ends Section Header Here -->
				</div>
			</div>
			<%
			ArrayList<CategoriesObject> listcategories1 = (ArrayList<CategoriesObject>) request.getAttribute("data_categories1");
			%>
			<div class="row">
				<%
				if (listcategories1 != null) {
					for (CategoriesObject category : listcategories1) {
				%>
				<!-- Start Single Product Box Here -->
				<div class="col-md-3 col-sm-6">
					<div class="single-product-box">
						<h4><%=category.getCategoryName()%></h4>
						<div class="product-photo">
							<div class="teashop-table">
								<div class="teashop-table-cell">
									<img src="img/categories/<%=category.getPicture()%>.jpg"
										alt="Product Photo">
								</div>
							</div>
						</div>
						<p><%=category.getDescription()%></p>
						<!--<a class="teashop-btn" href="#">Xem thêm</a>-->
						<form action="index" method="post">
							<!-- Sử dụng form để gửi yêu cầu -->
							<input type="hidden" name="categoryId"
								value="<%=category.getCategoryID()%>">
							<button type="submit" class="teashop-btn">Xem thêm</button>
						</form>
					</div>
				</div>
				<!-- Ends Single Product Box Here -->
				<%
				}
				}
				%>
			</div>
		</div>
	</section>
	<!-- Ends Product Here -->

	<!-- Start About Here -->
	<section class="section-padding" id="about">
		<!-- Start Video Button Here -->
		<div class="video-area bg-overlay">
			<a class="video-play-btn mfp-iframe"
				href="https://www.youtube.com/watch?v=ypQUb12-F7Y"> <i
				class="fa fa-play"></i>
			</a>
		</div>
		<!-- Ends Video Button Here -->

		<!-- Start About Content Here -->
		<div class="container">
			<div class="row title-aboutus">
				<div class="col-md-6 col-md-offset-6">
					<div class="section-header">
						<h2>Giới thiệu</h2>
						<p>Chúng tôi là một công ty sản xuất trà với tâm huyết trong
							việc chăm sóc cây trà từ vườn trà đến ly trà của bạn, mang đến
							hương vị tự nhiên và chất lượng tốt nhất.</p>
					</div>
					<ul class="about-list">
						<li>
							<h3>
								<i class="fa fa-check"></i>100% Tự nhiên
							</h3> Với nguyên liệu 100% tự nhiên, chúng tôi cam kết mang đến cho
							bạn trải nghiệm trà tinh khiết và an toàn.
						</li>
						<li>
							<h3>
								<i class="fa fa-check"></i>Miễn phí vận chuyển
							</h3> Để giúp bạn tiết kiệm hơn, chúng tôi cung cấp dịch vụ vận chuyển
							miễn phí trên mọi đơn hàng.
						</li>
						<li>
							<h3>
								<i class="fa fa-check"></i>Chất lượng sản phẩm
							</h3> Chất lượng sản phẩm là ưu tiên hàng đầu của chúng tôi, với mọi
							sản phẩm được kiểm định và đảm bảo đạt chuẩn cao nhất.
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Ends About Content Here -->
	</section>
	<!-- Ends About Here -->

	<!-- Start Featurs Area -->
	<section class="section-padding" id="featurs">
		<div class="container">
			<div class="row title-section">
				<div class="col-md-8 col-md-offset-2">
					<!-- Start Section Header Here -->
					<div class="section-header text-center">
						<h2>
							Lựa chọn hương vị <span>dựa trên sự yêu thích của bạn</span>
						</h2>
						<p>Chào mừng đến với cửa hàng trà xanh của chúng tôi! Chúng
							tôi tự hào mang đến cho bạn những loại trà xanh tươi ngon và chất
							lượng. Tại đây, bạn có thể dễ dàng lựa chọn hương vị yêu thích
							của mình từ các loại trà xanh đa dạng, từ trà xanh tự nhiên đến
							những hương vị đặc biệt và thú vị. Hãy khám phá ngay và chọn cho
							mình một ly trà xanh thơm ngon để tận hưởng khoảnh khắc thư giãn
							và bổ ích!</p>
					</div>
					<!-- Ends Section Header Here -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- Portfolio Navigation Start Here -->
					<ul class="featurs-navigation">
						<li class="active" data-filter="*">Tất cả</li>
						<%
						ArrayList<CategoriesObject> listcategories2 = (ArrayList<CategoriesObject>) request.getAttribute("data_categories2");
						if (listcategories2 != null) {
							for (CategoriesObject category : listcategories2) {
						%>
						<li class="" data-filter=".<%=category.getCategoryID()%>"><%=category.getCategoryName()%></li>
						<%
						}
						}
						%>

					</ul>
					<!-- Portfolio Navigation Ends Here -->

					<%
					ArrayList<ProductObject> listAllProduct = (ArrayList<ProductObject>) request.getAttribute("data_product");
					%>
					<div class="row portfolio-list">
						<%
						if (listAllProduct != null) {
							for (ProductObject product : listAllProduct) {
						%>
						<!-- Start Single Featurs Box Here -->
						<div
							class="col-md-3 col-sm-6 col-xs-12 <%=product.getCategoryID()%>">
							<div class="shop-cart-box">
								<div class="cart-price">
									<img
										src="img/product/Categoies<%=product.getCategoryID()%>/<%=product.getProductImage()%>.jpg"
										alt="features product"
										onclick="sendProductId('<%=product.getProductID()%>')">
									<a class="teashop-btn" href="#"><%=product.getUnitPrice()%></a>
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
								} else {
								%>
								<button type="button"
									class="btn border border-secondary rounded-pill py-1 mb-4"
									data-bs-toggle="modal"
									data-bs-target="#loginModal<%=product.getProductID()%>">
									<i class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
									Hàng
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
											<div class="modal-body">Bạn cần đăng nhập để thực hiện
												chức năng này.</div>
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
						}
						%>

					</div>
					<!-- Portfolio List Ends Here -->
				</div>
			</div>
		</div>
	</section>
	<!-- Ends Featurs Area -->

	<!-- Start Discount Here -->
	<section class="section-padding bg-overlay" id="discount">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="section-header">
						<h2>
							Nhận những ưu đãi mới nhất <span>từ chúng tôi</span>
						</h2>
					</div>
				</div>
				<div class="col-md-5 col-md-offset-1">
					<div class="discount-form">
						<form action="index.jsp">
							<input type="email" name="d_email" id="d_email"
								placeholder="example@gmail.com" required="required">
							<button class="teashop-btn" type="submit">Gửi</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Ends Discount Here -->

	<!-- Start Health Here -->
	<section class="section-padding" id="health">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="section-header">
						<h2>Tại sao Trà là thực phẩm tốt cho sức khỏe?</h2>
						<p>Trà không chỉ là một thức uống thơm ngon, mà còn mang lại
							nhiều lợi ích cho sức khỏe. Các chất chống oxi hóa trong trà có
							thể giúp ngăn chặn quá trình lão hóa, cải thiện chức năng não bộ
							và hỗ trợ hệ thống miễn dịch.</p>
					</div>
					<ul class="health-list">
						<li>Ngăn ngừa bệnh tim mạch: uống trà giúp tăng cường độ đàn
							hồi của tim và tạo ra một trái tim khỏe mạnh.</li>
						<li>Ngăn ngừa lão hóa: các amino axit và vitamin trong trà
							giúp ngăn ngừa sự oxy hóa của tế bào</li>
						<li>Giảm cân hiệu quả: trong búp trà có chứa các chất oxy hóa
							và cafein, giúp đốt cháy năng lượng khi ăn và giảm mỡ
							cholesterol.</li>
						<li>Phòng chống ung thư: Trà ngăn ngừa ung thư dạ dày, ung
							thư vú và các bệnh liên quan đến đường ruột.</li>
					</ul>
					<a class="read-btn" href="#">Xem thêm bài viết <i
						class="fa fa-long-arrow-right"></i></a>
				</div>
				<div class="col-md-6">
					<div class="health-bg">
						<img src="img/helth-tea.jpg" alt="healthy photo">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Ends Health Here -->

	<!-- Start Blog Here -->
	<section class="section-padding" id="blog">
		<div class="container">
			<div class="row title-section">
				<div class="col-md-8 col-md-offset-2">
					<!-- Start Section Header Here -->
					<div class="section-header text-center">
						<h2>Bài viết mới nhất</h2>
						<p>Khám phá thế giới chè phong phú với blog của chúng tôi, nơi
							bạn sẽ tìm thấy những bài viết thú vị về các loại chè, cách pha
							chế, lợi ích sức khỏe và câu chuyện văn hóa đằng sau từng lá chè.
							Chúng tôi mang đến cho bạn những kiến thức bổ ích và những trải
							nghiệm đặc biệt qua từng tách trà, giúp bạn tận hưởng những phút
							giây thư giãn và cân bằng trong cuộc sống hàng ngày.</p>
					</div>
					<!-- Ends Section Header Here -->
				</div>
			</div>

			<!-- Start Blog Content Row -->
			<div class="row blog-content-wrap">
				<div class="col-sm-6">
					<div class="blog-bg blog-bg-1"></div>
				</div>
				<div class="col-sm-6">
					<div class="blog-content-box">
						<h3>
							Trà Long Tỉnh Tây Hồ đã trở thành sản phẩm của ngành <span>JUNE
								20, 2023</span>
						</h3>
						<p>Trà Long Tỉnh Tây Hồ được mệnh danh là “quốc trà”, đứng đầu
							trong thập đại danh trà Trung Hoa. Nga từ thời nhà Minh, trà đã
							nổi danh. Đến thời Khang Hy, trà chuyên dùng để tiến vua.</p>
						<a class="read-btn" href="blog.jsp">Đọc thêm <i
							class="fa fa-long-arrow-right"></i></a>

					</div>
				</div>
			</div>
			<!-- Ends Blog Content Row -->

			<!-- Start Blog Content Row -->
			<div class="row blog-content-wrap blog-content-wrap2">
				<div class="col-sm-6 col-sm-push-6">
					<div class="blog-bg blog-bg-2"></div>
				</div>
				<div class="col-sm-6 col-sm-pull-6">
					<div class="blog-content-box left-content">
						<h3>
							Trinh nữ trà là một loại đồ uống thơm phổ biến <span>JUNE
								20, 2023</span>
						</h3>
						<p>Chắc hẳn mọi người đã từng nghe về “Trinh nữ trà” với
							truyền thuyết: chế biến trà từ búp trà dấu trong ngực trinh nữ.
							Ít ai biết, Trà Bích Loa Xuân chính là danh trà huyền thoại ấy.</p>
						<a class="read-btn" href="blog.jsp">Đọc thêm <i
							class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
			</div>
			<!-- Ends Blog Content Row -->

			<!-- Start Blog Content Row -->
			<div class="row blog-content-wrap">
				<div class="col-sm-6">
					<div class="blog-bg blog-bg-3"></div>
				</div>
				<div class="col-sm-6">
					<div class="blog-content-box">
						<h3>
							Trà Phổ Nhĩ Vân Nam loại trà tạo nên thương hiệu <span>JUNE
								20, 2023</span>
						</h3>
						<p>Tây Bắc Việt Nam, Thượng Lào và Vân Nam Trung Quốc chính là
							quê hương của cây chè. Ở đây có loại trà shan tuyết cổ thụ danh
							tiếng mọc hoang trên các đỉnh núi cao. “Có phúc đưởng uống trà cổ
							thụ”.</p>
						<a class="read-btn" href="blog.jsp">Đọc thêm <i
							class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
			</div>
			<!-- Ends Blog Content Row -->
		</div>
	</section>
	<!-- Ends Blog Here -->

	<!-- Start Testimonial Here -->
	<section class="section-padding" id="testimonial">
		<div class="container">
			<div class="row title-section">
				<div class="col-md-8 col-md-offset-2">
					<div class="section-header text-center">
						<h2>
							Khách hàng nói gì? <span>Những cảm nhận của họ</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="testimonial-slides">
						<!-- Testimonial Single Item -->
						<div class="testimonial-single-item">
							<div class="clint">
								<img src="img/testimonial/nam.jpg" alt="clint">
								<div class="clint-name">
									<h4>
										Trịnh Hải Nam <span>Khách hàng Việt Nam</span>
									</h4>
									<div class="clint-ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
							</div>
							<div class="clint-reviews">
								<p>Nữ nhân cúi đầu không thấy mũi chân thì chính là "Giai
									nhân tuyệt sắc".</p>
							</div>
						</div>
						<!-- Testimonial Single Item -->

						<!-- Testimonial Single Item -->
						<div class="testimonial-single-item">
							<div class="clint">
								<img src="img/testimonial/2.jpg" alt="clint">
								<div class="clint-name">
									<h4>
										Nguyễn Đức Thanh Nam <span>Khách hàng Việt Nam</span>
									</h4>
									<div class="clint-ratting">
										<i class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
							</div>
							<div class="clint-reviews">
								<p>A wonderful serenity has taken possession of my entire
									soul, like these sweet mornings of spring which I enjoy with my
									whole heart. I am alone, and feel the charm of existence in
									this spot</p>
							</div>
						</div>
						<!-- Testimonial Single Item -->

						<!-- Testimonial Single Item -->
						<div class="testimonial-single-item">
							<div class="clint">
								<img src="img/testimonial/3.jpg" alt="clint">
								<div class="clint-name">
									<h4>
										Nguyễn Thành Nam <span>Khách hàng Việt Nam</span>
									</h4>
									<div class="clint-ratting">
										<i class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i>
									</div>
								</div>
							</div>
							<div class="clint-reviews">
								<p>Sed ut perspiciatis unde omnis iste natus error sit
									voluptatem accusantium doloremque laudantium, totam rem
									aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
									architecto beatae vitae dicta sunt explicabo.</p>
							</div>
						</div>
						<!-- Testimonial Single Item -->

						<!-- Testimonial Single Item -->
						<div class="testimonial-single-item">
							<div class="clint">
								<img src="img/testimonial/4.jpg" alt="clint">
								<div class="clint-name">
									<h4>
										Johny john <span>Usa Client</span>
									</h4>
									<div class="clint-ratting">
										<i class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i>
									</div>
								</div>
							</div>
							<div class="clint-reviews">
								<p>The quick, brown fox jumps over a lazy dog. DJs flock by
									when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
									Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for
									quick jigs vex!</p>
							</div>
						</div>
						<!-- Testimonial Single Item -->
					</div>
				</div>
				<div class="col-sm-6">
					<div class="testimonial-photo">
						<img src="img/testimonial/testimonial-bg.jpg" alt="testimonial-bg">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Start Testimonial Here -->

	<!-- Start Contact Here -->
	<section class="section-padding bg-overlay" id="contact">
		<div class="container">
			<div class="row title-section">
				<div class="col-md-8 col-md-offset-2">
					<div class="section-header text-center">
						<h2>Liên hệ với chúng tôi</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<ul class="contact-info">
						<li><i class="fa fa-map-marker"></i> Số 298 đường Cầu Diễn<br>quận
							Bắc Từ Liêm, Hà Nội</li>
						<li><i class="fa fa-phone"></i> 0763052381 <br>
							0763052381</li>
						<li><i class="fa fa-envelope"></i> <a
							href="mailto:trinhhainam274@gmail.com">trinhhainam274@gmail.com</a>
							<br> <a href="mailto:trinhhainam274@gmail.com">trinhhainam274@gmail.com</a>
						</li>
						<li><i class="fa fa-globe"></i> <a href="#">www.yourwebsite.com</a>
						</li>
					</ul>
				</div>
				<div class="col-sm-6">
					<div class="contact-form">
						<form action="process.php" id="contact_form" method="post">
							<div class="form_group" id="name_field">
								<div class="input_field">
									<input type="text" name="u_name" id="u_name"
										required="required" placeholder="Họ và tên..">
								</div>
							</div>
							<div class="form_group" id="email_field">
								<div class="input_field">
									<input type="email" name="u_email" id="u_email"
										required="required" placeholder="Email..">
								</div>
							</div>
							<div class="form_group" id="massage_field">
								<div class="input_field">
									<input type="text" name="u_massage" id="u_massage"
										required="required" placeholder="Nội dung..">
								</div>
							</div>
							<div class="form_group">
								<div class="input_field">
									<button class="teashop-btn" type="submit">Gửi lời nhắn</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Ends Contact Here -->

	<%-- Kiểm tra nếu có thông báo thành công từ servlet --%>
	<%
	if (request.getAttribute("successMessage") != null) {
	%>
	<div class="modal fade show" id="successModal" tabindex="-1"
		aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="successModalLabel">Thông báo</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%=request.getAttribute("successMessage")%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>

	<!-- Import Bootstrap JS và jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- JavaScript để tự động hiển thị modal thành công -->
	<script>
		$(document).ready(function() {
			$('#successModal').modal('show'); // Tự động hiển thị modal khi có thông báo thành công
		});
	</script>

	<!-- Start Google Map Here -->
	<div class="g-map cd-google-map">
		<div id="google-container"></div>
		<div id="cd-zoom-in"></div>
		<div id="cd-zoom-out"></div>
	</div>
	<!-- Ends Google Map Here -->

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
		<div class="footer-bottom">
			<div class="container">
				<div class="row"></div>
			</div>
		</div>
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

	<!-- Customes Javascript -->
	<script src="js/custome.js"></script>
	<script src="js/sanpham.js"></script>

</body>

</html>