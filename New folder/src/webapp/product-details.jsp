<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="object.ProductObject"%>
<%@ page import="categories.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="object.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Chi tiết sản phẩm - TeaShop</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />

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
<link href="css/style.css" rel="stylesheet">

<!-- Custome-Nam -->
<link rel="stylesheet" href="css/custome.css">
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->
	<%
	CategoryFunction uf = new CategoryFunctionImp(null);
	%>


	<!-- Navbar start -->
	<div class="container-fluid fixed-top">
		<div class="container px-0 mt-3">
			<nav class="navbar navbar-light bg-white navbar-expand-xl">
				<h1 class="brand-logo">
					<a class="" href="index"><img src="img/logo.png" alt="teashop"></a>
				</h1>
				<button class="navbar-toggler py-2 px-3" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars text-primary"></span>
				</button>
				<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
					<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
						<div class="navbar-nav mx-auto">
							<a href="index" class="nav-item nav-link color-header">Trang
								Chủ</a> <a href="about.jsp" class="nav-item nav-link">Giới Thiệu</a>
							<a href="shop" class="nav-item nav-link">Cửa Hàng</a> <a
								href="blog-page.html" class="nav-item nav-link active">Blog</a>
							<a href="index.html#contact" class="nav-item nav-link">Liên
								Hệ</a>
						</div>


						<div class="d-flex me-0">
							<div class="search-container position-relative">
								<form class="d-flex search-form" role="search">
									<input class="form-control me-2 mt-3 search-input"
										type="search" placeholder="Search" aria-label="Search">
									<a href="#"
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
	<!-- Navbar End -->

	<!-- Single Page Header start -->
	<div class="container-fluid page-header">
		<h1 class="text-center text-white display-6">Chi tiết sản phẩm</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
			<li class="breadcrumb-item active text-white">Chi tiết sản phẩm</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- Single Product Start -->
	<div class="container-fluid py-3">
		<div class="container py-5">
			<div class="row g-4 mb-5">
				<div class="col-lg-8 col-xl-9">
					<div class="row g-4">
						<%
						ProductObject product = (ProductObject) request.getAttribute("product");
						%>
						<div class="col-lg-6">
							<div
								class="border rounded d-flex justify-content-center align-items-center">
								<a href="#"> <img
									src="img/product/Categoies<%=product.getCategoryID()%>/<%=product.getProductImage()%>.jpg"
									class="img-fluid rounded product-image" alt="Product_image">
								</a>
							</div>
						</div>
						<div class="col-lg-6">
							<h4 class="fw-bold mb-3"><%=product.getProductName()%></h4>
							<p class="mb-3">
								Thể loại:
								<%=uf.getCategoryName(product.getCategoryID())%></p>
							<h5 class="fw-bold mb-3"><%=product.getUnitPrice()%>
								VNĐ
							</h5>
							<div class="d-flex mb-4">
								<i class="fa fa-star text-secondary"></i> <i
									class="fa fa-star text-secondary"></i> <i
									class="fa fa-star text-secondary"></i> <i
									class="fa fa-star text-secondary"></i> <i
									class="fa fa-star text-secondary"></i>
							</div>
							<hr>
							<p>Trạng thái: Còn hàng</p>
							<p>Sản Phẩm Tặng Kèm Túi Giấy Xách Ngoài</p>
							<p>Giao Hàng Miễn Phí Vận Chuyển Siêu Tốc Trong Thời Gian 30
								Phút Tại : Thái Nguyên - Hà Nội - Đà Nẵng - TPHCM</p>
							<p></p>

							<div class="d-flex flex-column align-items-center">
								<div class="input-group quantity mb-3" style="width: 150px;">
									<div class="input-group-btn">
										<button
											class="btn btn-sm btn-minus rounded-circle bg-light border">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<input type="text"
										class="form-control text-center quantity-input" value="1">
									<div class="input-group-btn">
										<button
											class="btn btn-sm btn-plus rounded-circle bg-light border">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>

								<!-- Include Bootstrap CSS -->
								<div class="d-flex justify-content-center">
									<form id="addToCartForm" action="addtocart" method="post"
										style="margin-right: 10px;" accept-charset="UTF-8">
										<input type="hidden" name="productId_cart"
											value="<%=product.getProductID()%>"> <input
											type="hidden" name="productImage_cart"
											value="<%=product.getProductImage()%>"> <input
											type="hidden" name="productName_cart"
											value="<%=product.getProductName()%>"> <input
											type="hidden" name="productPrice_cart"
											value="<%=product.getUnitPrice()%>"> <input
											type="hidden" name="quantity_tt" class="quantity-hidden">
										<button type="submit" name="action" value="addtocart"
											class="btn fixed-width border border-secondary rounded-pill px-3 py-1 mb-4">
											<i class="fa fa-cart-plus me-2 text-primary"></i> Thêm vào
											giỏ hàng
										</button>
									</form>


									<form id="checkoutForm" action="thanhtoan" method="post"
										accept-charset="UTF-8">
										<input type="hidden" name="productId_tt"
											value="<%=product.getProductID()%>"> <input
											type="hidden" name="productImage_tt"
											value="<%=product.getProductImage()%>"> <input
											type="hidden" name="productName_tt"
											value="<%=product.getProductName()%>"> <input
											type="hidden" name="productPrice_tt"
											value="<%=product.getUnitPrice()%>"> <input
											type="hidden" name="quantity_tt" class="quantity-hidden">
										<button type="submit" name = "action" value="checkout1"
											class="btn fixed-width border border-secondary rounded-pill px-3 py-1 mb-4">
											<i class="fa fa-cart-plus me-2 text-primary"></i> Mua Ngay
										</button>
									</form>
								</div>

								<!-- Bootstrap JS and custom JavaScript -->

								<script>
									document
											.addEventListener(
													'DOMContentLoaded',
													function() {
														const isLoggedIn =
								<%=(request.getSession().getAttribute("Login") != null)%>
									;

														document
																.getElementById(
																		'addToCartForm')
																.addEventListener(
																		'submit',
																		function(
																				event) {
																			if (!isLoggedIn) {
																				event
																						.preventDefault();
																				showAlertModal("Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng.");
																			}
																		});

														document
																.getElementById(
																		'checkoutForm')
																.addEventListener(
																		'submit',
																		function(
																				event) {
																			if (!isLoggedIn) {
																				event
																						.preventDefault();
																				showAlertModal("Bạn cần đăng nhập để thanh toán sản phẩm.");
																			}
																		});

														function showAlertModal(
																message) {
															const modal = new bootstrap.Modal(
																	document
																			.getElementById('loginAlertModal'));
															const modalBody = document
																	.getElementById('loginAlertModalBody');
															modalBody.textContent = message;
															modal.show();
														}
													});
								</script>
								<script>
                                            document.addEventListener('DOMContentLoaded', function () {
                                                const quantityInput = document.querySelector('.quantity-input');
                                                const quantityHiddenInputs = document.querySelectorAll('.quantity-hidden');

                                                function updateQuantityHiddenInputs() {
                                                    const quantityValue = quantityInput.value;
                                                    quantityHiddenInputs.forEach(input => {
                                                        input.value = quantityValue;
                                                    });
                                                }

                                                // Update hidden fields when the form is about to be submitted
                                                document.querySelectorAll('form').forEach(form => {
                                                    form.addEventListener('submit', updateQuantityHiddenInputs);
                                                });
                                            });
                                        </script>


								<!-- Modal for login alert -->
								<div class="modal fade" id="loginAlertModal" tabindex="-1"
									aria-labelledby="loginAlertModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="loginAlertModalLabel">Thông
													báo</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body" id="loginAlertModalBody">
												<!-- Dynamic content will be inserted here -->
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Đóng</button>
												<a href="login.jsp" class="btn btn-primary">Đăng nhập</a>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="col-lg-12">
							<nav>
								<div class="nav nav-tabs mb-3">
									<button class="nav-link active border-white border-bottom-0"
										type="button" role="tab" id="nav-about-tab"
										data-bs-toggle="tab" data-bs-target="#nav-about"
										aria-controls="nav-about" aria-selected="true">Mô tả</button>
									<button class="nav-link border-white border-bottom-0"
										type="button" role="tab" id="nav-mission-tab"
										data-bs-toggle="tab" data-bs-target="#nav-mission"
										aria-controls="nav-mission" aria-selected="false">Đánh
										giá</button>
								</div>
							</nav>
							<div class="tab-content mb-5">
								<div class="tab-pane active" id="nav-about" role="tabpanel"
									aria-labelledby="nav-about-tab">
									<p><%=uf.getCategoryName(product.getCategoryID())%>
										thượng hạng được sử dụng nguyên liệu sản xuất là các búp trà
										tân cương 1 tôm 2 lá nguyên liệu trên diện tích trồng trà sạch
										Vietgap của công ty Tân Cương Xanh
									</p>
									<p>
										Sản phẩm Trà Thượng Hạng TC1 của
										<%=uf.getCategoryName(product.getCategoryID())%>
										Xanh là sản phẩm bán chạy nhất trên thị trường bởi trà đạt đầy
										đủ tiêu chí <br>Hương - Sắc - Vị - Thần.
									</p>
									<p>
										Nước xanh, thơm, uống ngọt hậu sâu nơi cuống họng. Đặc biệt
										giá bán
										<%=uf.getCategoryName(product.getCategoryID())%>
										Thượng Hạng TC1 rất phải chăng<br> : 300 000 vnđ/1kg mẫu
										mã đa dạng chủng loại nên sản phẩm được đặc biệt yêu thích
									</p>
									<div class="px-2">
										<div class="row g-4">
											<div class="col-6">
												<div
													class="row bg-light align-items-center text-center justify-content-center py-2">
													<div class="col-6">
														<p class="mb-0">Cân nặng</p>
													</div>
													<div class="col-6">
														<p class="mb-0">1 kg</p>
													</div>
												</div>
												<div
													class="row text-center align-items-center justify-content-center py-2">
													<div class="col-6">
														<p class="mb-0">Xuất xứ</p>
													</div>
													<div class="col-6">
														<p class="mb-0">Thái Nguyên</p>
													</div>
												</div>
												<div
													class="row bg-light text-center align-items-center justify-content-center py-2">
													<div class="col-6">
														<p class="mb-0">Chất lượng</p>
													</div>
													<div class="col-6">
														<p class="mb-0">Cao cấp</p>
													</div>
												</div>
												<div
													class="row text-center align-items-center justify-content-center py-2">
													<div class="col-6">
														<p class="mb-0">Kiểm định</p>
													</div>
													<div class="col-6">
														<p class="mb-0">Tốt cho sức khỏe</p>
													</div>
												</div>
												<div
													class="row bg-light text-center align-items-center justify-content-center py-2">
													<div class="col-6">
														<p class="mb-0">Cân nặng tối thiểu</p>
													</div>
													<div class="col-6">
														<p class="mb-0">250 Kg</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="nav-mission" role="tabpanel"
									aria-labelledby="nav-mission-tab">
									<div class="d-flex">
										<img src="img/product-detail/avatar.jpg"
											class="img-fluid rounded-circle p-3"
											style="width: 100px; height: 100px;" alt="">
										<div class="">
											<p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
											<div class="d-flex justify-content-between">
												<h5>Nguyễn Thành Nam</h5>
												<div class="d-flex mb-3">
													<i class="fa fa-star text-secondary"></i> <i
														class="fa fa-star text-secondary"></i> <i
														class="fa fa-star text-secondary"></i> <i
														class="fa fa-star text-secondary"></i> <i
														class="fa fa-star text-secondary"></i>
												</div>
											</div>
											<p>Ôi sản phẩm thật tuyệt vời! Nước trà thanh, không
												chát, hậu vị ngọt. QUả thật là một hương vị của đất trời ban
												tặng, tôi gửi đánh giá 5* cho sản phẩm này</p>
										</div>
									</div>
									<div class="d-flex">
										<img src="img/product-detail/avatar.jpg"
											class="img-fluid rounded-circle p-3"
											style="width: 100px; height: 100px;" alt="">
										<div class="">
											<p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
											<div class="d-flex justify-content-between">
												<h5>Trịnh Hải Nam</h5>
												<div class="d-flex mb-3">
													<i class="fa fa-star text-secondary"></i> <i
														class="fa fa-star text-secondary"></i> <i
														class="fa fa-star text-secondary"></i> <i
														class="fa fa-star text-secondary"></i> <i
														class="fa fa-star"></i>
												</div>
											</div>
											<p class="text-dark">Dù không hoàn hảo, sản phẩm vẫn
												tuyệt vời! Nước trà thanh mát, không chát và hậu vị ngọt
												ngào. Một trải nghiệm thú vị đến từ đất trời.</p>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="nav-vision" role="tabpanel">
									<p class="text-dark">Tempor erat elitr rebum at clita. Diam
										dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos
										labore. 3</p>
									<p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu
										diam amet diam et eos labore. Clita erat ipsum et lorem et sit</p>
								</div>
							</div>
						</div>
						<form id="reviewForm" action="rateproduct" method="post"
							accept-charset="UTF-8">
							<h4 class="mb-5 fw-bold">Đánh giá sản phẩm</h4>
							<input type="hidden" name="productId"
								value="<%=product.getProductID()%>">
							<div class="row g-4">
								<div class="col-lg-6">
									<div class="border-bottom rounded">
										<input id="fullName" type="text"
											class="form-control border-0 me-4" name="fullName"
											placeholder="Họ và tên">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="border-bottom rounded">
										<input id="email" type="email" class="form-control border-0"
											name="email" placeholder="Email">
									</div>
								</div>
								<div class="col-lg-12">
									<div class="border-bottom rounded my-4">
										<textarea id="reviewContent" class="form-control border-0"
											name="review" cols="30" rows="8" placeholder="Đánh giá"
											spellcheck="false"></textarea>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="d-flex justify-content-between py-3 mb-5">
										<div class="d-flex align-items-center">
											<p class="mb-0 me-3">Please rate:</p>
											<div class="d-flex align-items-center"
												style="font-size: 12px;">
												<i class="fa fa-star text-muted"></i> <i class="fa fa-star"></i>
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div>
										<button id="submitReviewBtn" type="button"
											class="btn border border-secondary text-primary rounded-pill px-4 py-3">
											Gửi đánh giá</button>
									</div>
								</div>
							</div>
						</form>

						<!-- Modal thông báo lỗi -->
						<div class="modal fade" id="errorModal" tabindex="-1"
							aria-labelledby="errorModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="errorModalLabel">Thông báo
											lỗi</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Vui lòng điền đầy đủ thông tin
										trước khi gửi đánh giá.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Đóng</button>
									</div>
								</div>
							</div>
						</div>


						<!-- Import Bootstrap JS và jQuery -->
						<script
							src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
						<script
							src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

						<!-- JavaScript để kiểm tra và hiển thị modal thông báo -->
						<script>
						    document.addEventListener('DOMContentLoaded', function () {
						        const submitReviewBtn = document.getElementById('submitReviewBtn');
						        const errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
						
						        submitReviewBtn.addEventListener('click', function () {
						            // Lấy giá trị từ các trường input
						            const fullName = document.getElementById('fullName').value.trim();
						            const email = document.getElementById('email').value.trim();
						            const reviewContent = document.getElementById('reviewContent').value.trim();
						
						            // Kiểm tra các trường input
						            if (!fullName || !email || !reviewContent) {
						                // Hiển thị modal thông báo lỗi
						                errorModal.show();
						                return; // Ngăn chặn việc submit form nếu có lỗi
						            }
						
						            // Nếu các trường đã nhập đầy đủ, bạn có thể tiếp tục submit form
						            // Đoạn code submit form có thể được thêm vào đây nếu cần
						            document.getElementById('reviewForm').submit(); // Submit form
						        });
						    });
						</script>

						<!-- Cập nhật phần hiển thị modal thông báo thành công trong product.jsp -->

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
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
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


					</div>
				</div>
				<div class="col-lg-4 col-xl-3">
					<div class="row g-4 fruite">
						<div class="col-lg-12">
							<div class="mb-4">
								<h4>Thể loại</h4>
								<ul class="list-unstyled fruite-categorie">
									<%
									CategoryFunction categories = new CategoryFunctionImp(null);
									ArrayList<CategoriesObject> list_categories = categories.getAllCategories();
									if (list_categories != null) {
										for (CategoriesObject category : list_categories) {
									%>
									<li>
										<div class="d-flex justify-content-between fruite-name">
											<a href="#"
												onclick="postCategoryId(<%=category.getCategoryID()%>)">
												<i class="fa fa-envira me-2" aria-hidden="true"></i> <%=category.getCategoryName()%>
											</a> <span></span>
										</div>
									</li>
									<%
									}
									}
									%>

								</ul>
							</div>
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
						<div class="col-lg-12">
							<h4 class="mb-4">Sản phẩm nổi bật</h4>
							<div class="d-flex align-items-center justify-content-start">
								<div class="rounded" style="width: 100px; height: 100px;">
									<img src="img/product-detail/1.jpg" class="img-fluid rounded"
										alt="Image">
								</div>
								<div>
									<h6 class="mb-2">Bột trà xanh</h6>
									<div class="d-flex mb-2">
										<i class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i class="fa fa-star"></i>
									</div>
									<div class="d-flex mb-2">
										<h5 class="fw-bold me-2">2.99 $</h5>
										<h5 class="text-danger text-decoration-line-through">4.11
											$</h5>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center justify-content-start">
								<div class="rounded" style="width: 100px; height: 100px;">
									<img src="img/product-detail/2.jpg" class="img-fluid rounded"
										alt="">
								</div>
								<div>
									<h6 class="mb-2">Trà gói pha sẵn</h6>
									<div class="d-flex mb-2">
										<i class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i class="fa fa-star"></i>
									</div>
									<div class="d-flex mb-2">
										<h5 class="fw-bold me-2">2.99 $</h5>
										<h5 class="text-danger text-decoration-line-through">4.11
											$</h5>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center justify-content-start">
								<div class="rounded" style="width: 100px; height: 100px;">
									<img src="img/product-detail/3.jpg" class="img-fluid rounded"
										alt="">
								</div>
								<div>
									<h6 class="mb-2">Trà Shan tuyết Lạng Sơn</h6>
									<div class="d-flex mb-2">
										<i class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i class="fa fa-star"></i>
									</div>
									<div class="d-flex mb-2">
										<h5 class="fw-bold me-2">2.99 $</h5>
										<h5 class="text-danger text-decoration-line-through">4.11
											$</h5>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center justify-content-start">
								<div class="rounded me-4" style="width: 100px; height: 100px;">
									<img src="img/product-detail/4.jpg" class="img-fluid rounded"
										alt="">
								</div>
								<div>
									<h6 class="mb-2">Trà Thái Nguyên</h6>
									<div class="d-flex mb-2">
										<i class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i class="fa fa-star"></i>
									</div>
									<div class="d-flex mb-2">
										<h5 class="fw-bold me-2">2.99 $</h5>
										<h5 class="text-danger text-decoration-line-through">4.11
											$</h5>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center justify-content-start">
								<div class="rounded me-4" style="width: 100px; height: 100px;">
									<img src="img/product-detail/5.jpg" class="img-fluid rounded"
										alt="">
								</div>
								<div>
									<h6 class="mb-2">Trà Bát tiên</h6>
									<div class="d-flex mb-2">
										<i class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i class="fa fa-star"></i>
									</div>
									<div class="d-flex mb-2">
										<h5 class="fw-bold me-2">2.99 $</h5>
										<h5 class="text-danger text-decoration-line-through">4.11
											$</h5>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center justify-content-start">
								<div class="rounded me-4" style="width: 100px; height: 100px;">
									<img src="img/product-detail/6.jpg" class="img-fluid rounded"
										alt="">
								</div>
								<div>
									<h6 class="mb-2">Trà Ô long</h6>
									<div class="d-flex mb-2">
										<i class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i
											class="fa fa-star text-secondary"></i> <i class="fa fa-star"></i>
									</div>
									<div class="d-flex mb-2">
										<h5 class="fw-bold me-2">2.99 $</h5>
										<h5 class="text-danger text-decoration-line-through">4.11
											$</h5>
									</div>
								</div>
							</div>
							<div class="d-flex justify-content-center my-4">
								<a href="#"
									class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Xem
									thêm</a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="position-relative">
								<img src="img/product-detail/sp3.jpg"
									class="img-fluid w-100 rounded" alt="">
								<div class="position-absolute"
									style="top: 50%; right: 10px; transform: translateY(-50%);">
									<h3 class="text-secondary fw-bold">
										Fresh <br> Fruits <br> Banner
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<h1 class="fw-bold mb-0">Sản phẩm tương tự</h1>
			<div class="vesitable">
				<div class="owl-carousel vegetable-carousel justify-content-center">
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="img/product-detail/sp1.jpg"
								class="img-fluid w-100 rounded-top" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">Tea</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>Hộp Trà Thái Nguyên QT01 - 100gram Hộp Đỏ</h4>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
								sed do eiusmod te incididunt</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
								<!--                                    <a href="#"
                                                                           class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                                                class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ Hàng</a>-->
								<form action="index" method="POST">
									<input type="hidden" name="productId"
										value="<%=product.getProductID()%>"> <input
										type="hidden" name="productName"
										value="<%=product.getProductName()%>"> <input
										type="hidden" name="productPrice"
										value="<%=product.getUnitPrice()%>">
									<button type="submit"
										class="btn border border-secondary rounded-pill px-3 py-1 mb-4">
										<i class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
										Hàng
									</button>
								</form>
							</div>
						</div>
					</div>
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="img/product-detail/sp7.jpg"
								class="img-fluid w-100 rounded-top" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">Tea</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>Hộp Trà Thái Nguyên QT01 - 100gram Hộp Đỏ</h4>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
								sed do eiusmod te incididunt</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
									class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
									Hàng</a>
							</div>
						</div>
					</div>
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="img/product-detail/sp8.jpg"
								class="img-fluid w-100 rounded-top bg-light" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">Tea</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>Hộp Trà Thái Nguyên QT01 - 100gram Hộp Đỏ</h4>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
								sed do eiusmod te incididunt</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
									class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
									Hàng</a>
							</div>
						</div>
					</div>
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="img/product-detail/sp9.jpg"
								class="img-fluid w-100 rounded-top" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">Tea</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>Trà Tân Cương Thượng Hạng TC1-02 : 200gram</h4>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
								sed do eiusmod te incididunt</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
									class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
									Hàng</a>
							</div>
						</div>
					</div>
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="img/product-detail/sp5.jpg"
								class="img-fluid w-100 rounded-top" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">Tea</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>Trà Tân Cương Thượng Hạng TC1-02 : 200gram</h4>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
								sed do eiusmod te incididunt</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
									class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
									Hàng</a>
							</div>
						</div>
					</div>
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="img/product-detail/sp10.jpg"
								class="img-fluid w-100 rounded-top" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">Tea</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>Trà Tân Cương Thượng Hạng TC1-02 : 200gram</h4>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
								sed do eiusmod te incididunt</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
									class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
									Hàng</a>
							</div>
						</div>
					</div>
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="img/product-detail/sp6.jpg"
								class="img-fluid w-100 rounded-top" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">Tea</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>Trà Tân Cương Thượng Hạng TC1-02 : 200gram</h4>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
								sed do eiusmod te incididunt</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
									class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
									Hàng</a>
							</div>
						</div>
					</div>
					<div
						class="border border-primary rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="img/product-detail/sp10.jpg"
								class="img-fluid w-100 rounded-top" alt="">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px;">Tea</div>
						<div class="p-4 pb-0 rounded-bottom">
							<h4>Trà Tân Cương Thượng Hạng TC1-02 : 200gram</h4>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
								sed do eiusmod te incididunt</p>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
									class="fa fa-cart-plus me-2 text-primary"></i> Thêm Vào Giỏ
									Hàng</a>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!-- Single Product End -->


	<!-- Start The ScrollToTop Here -->
	<div class="ScrollToTop">
		<a href="#"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- ScrollToTop Ends Here -->

	<!-- Start Footer Here -->
	<footer class="section-padding" id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="footer-top text-center">
						<img src="img/logo.png" alt="">
						<!-- Social Icons -->
						<div class="social-icons">
							<a href="#"><i class="fa fa-facebook green-icon"></i>
								Facebook</a> <a href="#"><i class="fa fa-twitter green-icon"></i>
								Twitter</a> <a href="#"><i class="fa fa-linkedin green-icon"></i>
								Linkedin</a>
						</div>
						<!-- Social Icons -->
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom"></div>
	</footer>
	<!-- Ends Footer Here -->

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/easing-product.min.js"></script>
	<script src="js/waypoints-product.min.js"></script>
	<script src="js/lightbox-product.min.js"></script>
	<script src="js/owl.carousel-product.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main-product.js"></script>
	<script src="js/sanpham.js"></script>
</body>

</html>