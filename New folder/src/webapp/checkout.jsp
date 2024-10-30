<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="object.*" %>
<%@ page import="products.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Thanh toán - TeaShop</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">

        <!-- Custom Style -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/> -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

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


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0 mt-4">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <h1 class="brand-logo"><a class="" href="index"><img src="img/logo.png" alt="teashop"></a></h1>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                            <div class="navbar-nav mx-auto">
                                <a href="index" class="nav-item nav-link color-header">Trang Chủ</a>
                                <a href="about.jsp" class="nav-item nav-link">Giới Thiệu</a>
                                <a href="shop" class="nav-item nav-link">Cửa Hàng</a>
                                <a href="blog.jsp" class="nav-item nav-link active">Blog</a>
                                <a href="index.html#contact" class="nav-item nav-link">Liên Hệ</a>
                            </div>


                            <div class="d-flex me-0">
                                <div class="search-container position-relative">
                                    <form class="d-flex search-form" role="search">
                                        <input class="form-control me-2 mt-3 search-input" type="search" placeholder="Search" aria-label="Search">
                                        <a href="#" class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-3">
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
            <h1 class="text-center text-white display-6">Thanh Toán</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="index">Trang Chủ</a></li>
                <li class="breadcrumb-item"><a href="#">Giỏ Hàng</a></li>
                <li class="breadcrumb-item active text-white">Thanh Toán</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Checkout Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <h1 class="mb-4">Chi tiết thanh toán</h1>
                <form action="order" method="post" accept-charset="UTF-8">
                    <div class="row g-5">
                        <div class="col-md-11 col-lg-5 col-xl-6">

                            <div class="form-item">
                                <label class="form-label my-3">Họ và tên<sup>*</sup></label>
                                <input type="text" class="form-control" name="hoten">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">Địa chỉ <sup>*</sup></label>
                                <input type="text" class="form-control" name="diachi">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">Tỉnh/Thành phố<sup>*</sup></label>
                                <input type="text" class="form-control" name="tinhthanh">
                            </div>

                            <div class="form-item">
                                <label class="form-label my-3">Số điện thoại<sup>*</sup></label>
                                <input type="tel" class="form-control" name="sdt">
                            </div>

                            <hr>
                            <div class="form-check my-3">
                                <input class="form-check-input" type="checkbox" id="Address-1" name="Address"
                                       value="Address">
                                <label class="form-check-label" for="Address-1">Vận chuyển đến địa chỉ khác?</label>
                            </div>
                            <div class="form-item">
                                <textarea name="text" class="form-control" spellcheck="false" cols="30" rows="11"
                                          placeholder="Ghi chú"></textarea>
                            </div>
                        </div>
                        <div class="col-md-1 col-lg-7 col-xl-6">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 20%;">Sản phẩm</th>
                                            <th scope="col" style="width: 20%;">Tên</th>
                                            <th scope="col" style="width: 20%;">Giá tiền</th>
                                            <th scope="col" style="width: 20%;">Số lượng</th>
                                            <th scope="col" style="width: 20%;">Tổng tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ProductFunction uf_product = new ProductFunctionImp(null);
                                            ArrayList<CartItemsObject> listProduct = (ArrayList<CartItemsObject>) request.getAttribute("list_ product");
                                            float tongtien = 0;
                                            int count = 0;
                                            int id = 0;
                                            if (listProduct != null) { 
                                                for (CartItemsObject product : listProduct) {
                                                	count++;
                                                	id = product.getProductID();
                                                
                                        %>
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center mt-2">
                                                    <img src="img/product/Categoies<%= uf_product.getCategoryById(product.getProductID()) %>/<%= product.getProductImage() %>.jpg" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                                </div>
                                            </th>
                                            <td class="py-5"><%= product.getProductName() %></td>
                                            <td class="py-5"><%= product.getUnitPrice() %></td>
                                            <td class="py-5"><%= product.getQuantity()%></td>
                                            <input type="hidden" name="quantity" value="<%= product.getQuantity() %>">
                                            <td class="py-5"><%= product.tongTien(product.getUnitPrice(), product.getQuantity()) %></td>
                                        </tr>
                                        <%
                                                tongtien += product.tongTien(product.getUnitPrice(), product.getQuantity());
                                                }
                                            }
                                        %>
                                        <tr>
                                            <th scope="row">
                                            </th>
                                            <td class="py-3" colspan="2">
                                                <p class="mb-0 text-dark py-3">Phí dự kiến</p>
                                            </td>
                                            <td class="py-3" colspan="2">
                                                <div class="py-3 border-bottom border-top">
                                                    <p class="mb-0 text-dark" id="basePrice"><%= tongtien %> VNĐ</p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                            </th>
                                            <td class="py-5">
                                                <p class="mb-0 text-dark py-4">Phí vận chuyển</p>
                                            </td>
                                            <td colspan="3" class="py-5">
                                                <div class="form-check text-start">
                                                    <input type="radio" class="form-check-input bg-primary border-0" id="Shipping-1" name="shippingOption" value="0" checked>
                                                    <label class="form-check-label" for="Shipping-1">Miễn phí vận chuyển(Thời gian 15-20 ngày)</label>
                                                </div>
                                                <div class="form-check text-start">
                                                    <input type="radio" class="form-check-input bg-primary border-0" id="Shipping-2" name="shippingOption" value="15000">
                                                    <label class="form-check-label" for="Shipping-2">Giao hàng tiết kiệm(Thời gian 7-9 ngày)</label>
                                                </div>
                                                <div class="form-check text-start">
                                                    <input type="radio" class="form-check-input bg-primary border-0" id="Shipping-3" name="shippingOption" value="30000">
                                                    <label class="form-check-label" for="Shipping-3">Giao hàng hỏa tốc(Thời gian 3-4 ngày)</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                            </th>
                                            <td class="py-5" colspan="2">
                                                <p class="mb-0 text-dark text-uppercase py-3">TỔNG TIỀN THANH TOÁN</p>
                                            </td>
                                            <td class="py-5" colspan="2">
                                                <div class="py-3 border-bottom border-top">
                                                    <p class="mb-0 text-dark" id="totalPrice"><%= tongtien %> VNĐ</p>
                                                </div>
                                            </td>
                                        </tr>
                                    <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const basePrice = parseFloat(<%= tongtien %>);
                                            const totalPriceElement = document.getElementById('totalPrice');
                                            const shippingOptions = document.querySelectorAll('input[name="shippingOption"]');

                                            function updateTotalPrice() {
                                                let shippingCost = 0;
                                                shippingOptions.forEach(option => {
                                                    if (option.checked) {
                                                        shippingCost = parseFloat(option.value);
                                                    }
                                                });
                                                const totalPrice = basePrice + shippingCost;
                                                totalPriceElement.textContent = totalPrice.toLocaleString('vi-VN') + ' VNĐ';
                                            }

                                            // Add event listeners to all shipping options
                                            shippingOptions.forEach(option => {
                                                option.addEventListener('change', updateTotalPrice);
                                            });

                                            // Initialize the total price on page load
                                            updateTotalPrice();
                                        });
                                    </script>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                            </div>
                            <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                    <div class="col-12">
                                        <div class="form-check text-start my-3">
                                            <input type="checkbox" class="form-check-input bg-primary border-0" id="Delivery-1" name="paymentMethod" value="Delivery">
                                            <label class="form-check-label" for="Delivery-1">Thanh toán sau khi nhận hàng</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                    <div class="col-12">
                                        <div class="form-check text-start my-3">
                                            <input type="checkbox" class="form-check-input bg-primary border-0" id="Paypal-1" name="paymentMethod" value="Paypal">
                                            <label class="form-check-label" for="Paypal-1">Thanh toán bằng VNPay</label>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="sl" value="<%= count %>">
                                <input type="hidden" name="id" value="<%= id %>">
                                
                                
                                <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                    <button type="submit" name="action" value="isok"
                                            class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Đặt Hàng</button>
                                </div>
                            </div>
                        </div>
                </form>
            </div>
        </div>
        <!-- Checkout Page End -->


        <!-- Start Footer Here -->
        <footer class="section-padding footer-padding" id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="footer-top text-center">
                            <img src="img/logo.png" alt="">
                            <!-- Social Icons -->
                            <div class="social-icons">
                                <a href="#"><i class="fa fa-facebook green-icon"></i> Facebook</a>
                                <a href="#"><i class="fa fa-twitter green-icon"></i> Twitter</a>
                                <a href="#"><i class="fa fa-linkedin green-icon"></i> Linkedin</a>
                            </div>
                            <!-- Social Icons -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">

            </div>
        </footer>
        <!-- Ends Footer Here -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                class="fa fa-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcTTWvVJPW54aA5PEWrQTldVBFDhC0c-Q"></script>
        <!-- Contact Form -->
        <script type="text/javascript" src="js/contact-form.js"></script>
        <!-- Active Scripts Here -->
        <script type="text/javascript" src="js/active.js"></script>
        <!-- JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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