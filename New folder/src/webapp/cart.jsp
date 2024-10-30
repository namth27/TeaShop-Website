<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="object.*"%>
<%@ page import="products.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>

<%
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng -TeaShop</title>
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
	<%
	ProductFunction uf_product = new ProductFunctionImp(null);
	ArrayList<CartItemsObject> list_sp = (ArrayList<CartItemsObject>) request.getAttribute("list_sp");
	%>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<div class="container-fluid fixed-top">
		<div class="container px-0 mt-4">
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
								Chủ</a> <a href="about.jsp" class="nav-item nav-link">Giới Thiệu</a>
							<a href="shop" class="nav-item nav-link">Cửa Hàng</a> <a
								href="blog.jsp" class="nav-item nav-link active">Blog</a> <a
								href="index.html#contact" class="nav-item nav-link">Liên Hệ</a>
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

	<main>
		<!-- Single Page Header start -->
		<div class="container-fluid page-header">
			<h1 class="text-center text-white display-6">Giỏ hàng</h1>
			<ol class="breadcrumb justify-content-center mb-0">
				<li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
				<li class="breadcrumb-item active text-white">Giỏ hàng</li>
			</ol>
		</div>
		<!-- Single Page Header End -->

		<!-- Cart Page Start -->
		<div class="container-fluid py-5">
			<div class="container py-5">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Sản phẩm</th>
								<th scope="col">Tên</th>
								<th scope="col">Giá</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Tổng tiền</th>
								<th scope="col">Xử lý</th>
							</tr>
						</thead>
						<tbody>
							<%
							NumberFormat currencyFormat = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
							double shippingFee = (double) request.getAttribute("shippingFee");
							double totalAmount = shippingFee;
							if (list_sp != null) {
								for (CartItemsObject product : list_sp) {
									totalAmount += product.tongTien(product.getUnitPrice(), product.getQuantity());
							%>
							<tr>
								<th scope="row">
									<div class="d-flex align-items-center">
										<img
											src="img/product/Categoies<%=uf_product.getCategoryById(product.getProductID())%>/<%=product.getProductImage()%>.jpg"
											class="img-fluid me-5 rounded-circle"
											style="width: 80px; height: 80px;" alt="">
									</div>
								</th>
								<td>
									<p class="mb-0 mt-4"><%=product.getProductName()%></p>
								</td>
								<td>
									<p class="mb-0 mt-4"><%=currencyFormat.format(product.getUnitPrice())%></p>
								</td>
								<td>
									<div class="input-group quantity mb-3" style="width: 150px;">
										<div class="input-group-btn">
											<button type="button"
												class="btn btn-sm btn-minus rounded-circle bg-light border"
												data-product-id="<%=product.getProductID()%>">
												<i class="fa fa-minus"></i>
											</button>
										</div>
										<input type="text"
											class="form-control text-center quantity-input"
											name="quantity" value="<%=product.getQuantity()%>"
											data-unit-price="<%=product.getUnitPrice()%>"
											data-product-id="<%=product.getProductID()%>">
										<div class="input-group-btn">
											<button type="button"
												class="btn btn-sm btn-plus rounded-circle bg-light border"
												data-product-id="<%=product.getProductID()%>">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</td>
								<td>
									<p class="mb-0 mt-4 total-price"><%=currencyFormat.format(product.tongTien(product.getUnitPrice(), product.getQuantity()))%>
										VNĐ
									</p>
								</td>
								<td>
									<form action="addtocart" method="post"
										onsubmit="return confirmDelete();">
										<input type="hidden" name="action" value="delproduct">
										<input type="hidden" name="cartItemId"
											value="<%=product.getCartItemID()%>">
										<button type="submit" class="btn-danger mt-2">
											<i class="bi bi-trash"></i>
										</button>
									</form>
								</td>
								<script>
									function confirmDelete() {
										return confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
									}
								</script>

							</tr>
							<%
							}

							}
							%>
						</tbody>
					</table>
				</div>

				<script>
					document
							.addEventListener(
									'DOMContentLoaded',
									function() {
										// Lắng nghe sự kiện click cho các nút plus và minus
										document
												.querySelectorAll('.btn-plus')
												.forEach(
														function(button) {
															button
																	.addEventListener(
																			'click',
																			function(
																					event) {
																				adjustQuantity(
																						button,
																						0);
																			});
														});

										document
												.querySelectorAll('.btn-minus')
												.forEach(
														function(button) {
															button
																	.addEventListener(
																			'click',
																			function(
																					event) {
																				adjustQuantity(
																						button,
																						0);
																			});
														});

										// Hàm điều chỉnh số lượng với delta (số lượng cần thay đổi)
										function adjustQuantity(button, delta) {
											var productId = button
													.getAttribute('data-product-id');
											var input = button
													.closest('.input-group')
													.querySelector(
															'input.quantity-input');
											var currentValue = parseInt(input.value) || 1;
											var newValue = currentValue + delta;

											if (newValue < 1)
												newValue = 1;

											input.value = newValue;

											updatePrice(input);
											updateTotalPrice();
											sendUpdateRequest(productId,
													newValue);
										}

										// Cập nhật giá tiền cho mỗi sản phẩm
										function updatePrice(input) {
											var unitPrice = parseFloat(input.dataset.unitPrice);
											var quantity = parseInt(input.value) || 1;
											var totalPrice = unitPrice
													* quantity;
											var totalPriceElement = input
													.closest('tr')
													.querySelector(
															'.total-price');
											totalPriceElement.textContent = new Intl.NumberFormat(
													'vi-VN').format(totalPrice)
													+ ' VNĐ';
										}

										// Cập nhật tổng tiền cho giỏ hàng
										function updateTotalPrice() {
											var total = 0;
											document
													.querySelectorAll(
															'.quantity-input')
													.forEach(
															function(input) {
																var unitPrice = parseFloat(input.dataset.unitPrice);
																var quantity = parseInt(input.value) || 1;
																total += unitPrice
																		* quantity;
															});

											var shippingFee = parseFloat(
				<%=shippingFee%>
					);
											var estimatedFee = total;

											document
													.getElementById('estimated-fee').textContent = new Intl.NumberFormat(
													'vi-VN')
													.format(estimatedFee)
													+ ' VNĐ';
											document
													.getElementById('cart-total').textContent = new Intl.NumberFormat(
													'vi-VN')
													.format(estimatedFee
															+ shippingFee)
													+ ' VNĐ';
										}

										// Khởi tạo cập nhật tổng tiền lần đầu
										updateTotalPrice();
									});
				</script>

				<div class="row g-4 justify-content-end">
					<div class="col-8"></div>
					<div class="col-sm-8 col-md-7 col-lg-6 col-xl-5">
						<div class="bg-light rounded">
							<div class="p-4">
								<h1 class="display-6 mb-4">
									<span class="fw-normal">Tổng tiền thanh toán</span>
								</h1>
								<div class="d-flex justify-content-between mb-4">
									<h5 class="mb-0 me-4">Phí dự kiến:</h5>
									<p class="mb-0" id="estimated-fee"><%=currencyFormat.format(totalAmount - shippingFee)%>
										VNĐ
									</p>
								</div>
								<div class="d-flex justify-content-between">
									<h5 class="mb-0 me-4">Phí vận chuyển</h5>
									<div class="">
										<p class="mb-0" id="shipping-fee"><%=currencyFormat.format(shippingFee)%>
											VNĐ
										</p>
									</div>
								</div>

							</div>
							<div
								class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
								<h5 class="mb-0 ps-4 me-4">Tổng tiền</h5>
								<p class="mb-0 pe-4" id="cart-total"><%=currencyFormat.format(totalAmount)%>
									VNĐ
								</p>
							</div>
							<form action="order" method="post">
								<input type="hidden" name="cartItems" id="cartItemsInput">
								<button type="submit" name="action" value="checkcout"
									class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ">Xác nhận thanh toán</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Cart Page End -->
	</main>

	<!-- Start The ScrollToTop Here -->
	<div class="ScrollToTop">
		<a href="#"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- ScrollToTop Ends Here -->

	<!-- Start Footer Here -->
	<footer class="section-padding footer-padding" id="footer">
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

	<!-- All Script Here
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