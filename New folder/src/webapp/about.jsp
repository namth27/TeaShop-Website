<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="object.*" %>
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
        <title>About - TeaShop</title>

        <!-- All Stylesheet Here -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
                    <nav class="navbar navbar-light bg-white navbar-expand-xl mt-4">
                        <h1 class="brand-logo"><a class="" href="index"><img src="img/logo.png" alt="teashop"></a></h1>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                            <div class="navbar-nav mx-auto">
                                <a href="index" class="nav-item nav-link color-header">Trang Chủ</a>
                                <a href="about.jsp" class="nav-item nav-link">Giới Thiệu</a>
                                <a href="shop" class="nav-item nav-link">Cửa Hàng</a>
                                <a href="blog.jsp" class="nav-item nav-link active">Blog</a>
                                <a href="index#contact" class="nav-item nav-link">Liên Hệ</a>
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
                                    String cartLink = (user != null) ? "cart.jsp" : "javascript:void(0);";
                                    String cartMessage = (user != null) ? "" : "Đăng nhập để thực hiện tính năng giỏ hàng";
                                %>
                                <a href="<%= cartLink %>" class="position-relative me-4 my-auto" onclick="<%= (user == null) ? "alert('" + cartMessage + "')" : "" %>">
                                    <i class="fa fa-shopping-cart fa-2x header-icon"></i>
                                    <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" 
                                          style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
                                        3    
                                    </span>
                                </a>


                                <div class="btn-group">
                                    <a href="#" class="my-auto" data-bs-toggle="dropdown">
                                        <i class="fa fa-user fa-2x header-icon"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <% if (user == null) { %>
                                        <li><a class="dropdown-item" href="login.jsp">Đăng nhập</a></li>
                                            <% } else { %>
                                        <li><a class="dropdown-item" href="#">Chi tiết tài khoản</a></li>
                                        <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                                            <% } %>
                                    </ul>

                                </div>

                            </div>

                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <!-- Header Ends Here -->

        <!-- Start Page Banner Here -->
        <div class="container-fluid page-header">
            <h1 class="text-center text-white display-6">Giới Thiệu</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
                <li class="breadcrumb-item active text-white">Giới Thiệu</li>
            </ol>
        </div>
        <!-- Ends Page Banner Here -->

        <!-- Start About Us Here -->
        <section class="section-padding" id="about-us">
            <div class="container">
                <div class="row">
                    <div class="section-header text-center">
                        <h2>Giới Thiệu Về Chúng Tôi</h2>
                        <p>TeaShop tự hào mang đến cho bạn những loại chè thượng hạng, được tuyển chọn kỹ lưỡng từ các vùng chè nổi tiếng.
                            Với niềm đam mê và cam kết chất lượng, chúng tôi mong muốn mang đến cho khách hàng những trải nghiệm thưởng thức chè tuyệt vời,
                            đậm đà hương vị và phong phú về chủng loại. TeaShop luôn đặt khách hàng lên hàng đầu và không ngừng hoàn thiện để phục vụ tốt nhất.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="about-us-video">
                            <div class="video-area bg-overlay">
                                <a class="video-play-btn mfp-iframe" href="https://www.youtube.com/watch?v=ypQUb12-F7Y">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="about-list-box about-list">
                            <h3><i class="fa fa-check"></i>100% Tự nhiên</h3>
                            TeaShop cam kết cung cấp chè 100% tự nhiên, không chất bảo quản, mang đến hương vị thuần khiết và an toàn cho sức khỏe.
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="about-list-box about-list">
                            <h3><i class="fa fa-check"></i>Miễn Phí Giao Hàng</h3>
                            TeaShop cung cấp dịch vụ giao hàng miễn phí toàn quốc, đảm bảo chè đến tay bạn nhanh chóng và an toàn.
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="about-list-box about-list">
                            <h3><i class="fa fa-check"></i>Sản Phẩm Chất Lượng</h3>
                            TeaShop tự hào cung cấp các sản phẩm chè chất lượng cao, được chọn lọc kỹ lưỡng từ những vùng chè nổi tiếng, đảm bảo hương vị tuyệt hảo và an toàn.
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Ends About Us Here -->

        <!-- Start Team Here -->
        <section class="section-padding" id="team">
            <div class="container">
                <div class="row">
                    <div class="section-header text-center">
                        <h2>Gặp gỡ chúng tôi </h2>
                        <p>Luôn hân hạnh được gặp gỡ và đón tiếp mọi quý khách hàng</p>
                    </div>
                </div>
                <div class="team-slides">
                    <div class="single-team-item">
                        <div class="single-team-box">
                            <img src="img/about-page/team/GiamDoc.jpg" alt="team member">
                            <h4 class="team-overlay">Nguyễn Thành Nam <span>Tổng giám đốc công ty</span></h4>
                        </div>
                    </div>
                    <div class="single-team-item">
                        <div class="single-team-box">
                            <img src="img/about-page/team/a9.jpg" alt="team member">
                            <h4 class="team-overlay">Nguyễn Thị Phương Anh <span>Trưởng phòng nhân sự</span></h4>
                        </div>
                    </div>
                    <div class="single-team-item">
                        <div class="single-team-box">
                            <img src="img/about-page/team/DaiDienThuongHieu.jpg" alt="team member">
                            <h4 class="team-overlay">Cao Thanh Hoa Lệ <span>Đại diện thương hiệu</span></h4>
                        </div>
                    </div>
                    
                    <div class="single-team-item">
                        <div class="single-team-box">
                            <img src="img/about-page/team/a7.jpg" alt="team member">
                            <h4 class="team-overlay">Phạm Thái Hoa Nhài <span>Phó giám đốc kinh doanh</span></h4>
                        </div>
                    </div>
                    
                    <div class="single-team-item">
                        <div class="single-team-box">
                            <img src="img/about-page/team/a5.jpg" alt="team member">
                            <h4 class="team-overlay">Đỗ Quang Trường <span>Hợp tác thương hiệu</span></h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Ends Team Here -->

        <!-- Start Testimonial Here -->
        <section class="section-padding" id="testimonial">
            <div class="container">
                <div class="row">
                    <div class="section-header text-center">
                        <h2>Khách hàng của chúng tôi nói gì?</h2>
                        <span><strong>Phản hồi của khách hàng</strong></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="testimonial-slides">
                            <!-- Testimonial Single Item -->
                            <div class="testimonial-single-item">
                                <div class="clint">
                                    <img src="img/testimonial/kh1.jpg" alt="clint">
                                    <div class="clint-name">
                                        <h4>Đinh Nhật Minh <span>Khách hàng thân thiết</span></h4>
                                        <div class="clint-ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="clint-reviews">
                                    <p>Không chỉ là một cửa hàng trà, TeaShop còn là nơi tôi tìm thấy sự yên bình và thư giãn.
                                        Hương trà tinh tế và không gian trà êm đềm tạo nên một trải nghiệm thực sự đặc biệt.</p>
                                </div>
                            </div>
                            <!-- Testimonial Single Item -->

                            <!-- Testimonial Single Item -->
                            <div class="testimonial-single-item">
                                <div class="clint">
                                    <img src="img/testimonial/kh3.jpg" alt="clint">
                                    <div class="clint-name">
                                        <h4>Nguyễn Thị Yến <span>Quý khách hàng</span></h4>
                                        <div class="clint-ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="clint-reviews">
                                    <p>TeaShop mang lại cho tôi trải nghiệm thưởng thức trà tuyệt vời nhất mỗi buổi sáng.
                                        Hương vị tinh tế và độ đậm đà của từng ly trà thật sự khiến tôi không thể rời mắt.</p>
                                </div>
                            </div>
                            <!-- Testimonial Single Item -->

                            <!-- Testimonial Single Item -->
                            <div class="testimonial-single-item">
                                <div class="clint">
                                    <img src="img/testimonial/kh2.jpg" alt="clint">
                                    <div class="clint-name">
                                        <h4>Nguyễn Minh Đức <span>Quý khách hàng</span></h4>
                                        <div class="clint-ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="clint-reviews">
                                    <p>Tôi đã thử nhiều loại trà từ nhiều nơi, nhưng chỉ có TeaShop làm tôi thực sự hài lòng.
                                        Chất lượng của trà cùng dịch vụ chăm sóc khách hàng tận tình đã làm tôi trở thành khách hàng trung thành.</p>
                                </div>
                            </div>
                            <!-- Testimonial Single Item -->

                            <!-- Testimonial Single Item -->
                            <div class="testimonial-single-item">
                                <div class="clint">
                                    <img src="img/testimonial/kh4.jpg" alt="clint">
                                    <div class="clint-name">
                                        <h4>Lê Thị Hòa <span>Khách hàng thân thiết</span></h4>
                                        <div class="clint-ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="clint-reviews">
                                    <p>Tôi rất ấn tượng với sự chất lượng và chăm sóc khách hàng tại TeaShop.
                                        Họ luôn luôn tạo ra những sản phẩm tuyệt vời và luôn sẵn lòng hỗ trợ 
                                        và tư vấn cho khách hàng như tôi.</p>
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
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="section-header text-center">
                            <h2>Liên hệ ngay</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <ul class="contact-info">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                172 Trần Bình <br>
                                Hoàng Mai, Hà Nội
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>
                                +84 385 88 6262 <br>
                                +84 800 22 8888
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i>
                                <a href="mailto:example@gmail.com">traxanhteashop@gmail.com</a> <br>
                            </li>
                            <li>
                                <i class="fa fa-globe"></i>
                                <a href="#">www.teashop.com</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <div class="contact-form">
                            <form action="process.php" id="contact_form" method="post">
                                <div class="form_group" id="name_field">
                                    <div class="input_field">
                                        <input type="text" name="u_name" id="u_name" required="required"
                                               placeholder="Họ và Tên">
                                    </div>
                                </div>
                                <div class="form_group" id="email_field">
                                    <div class="input_field">
                                        <input type="email" name="u_email" id="u_email" required="required"
                                               placeholder="Email..">
                                    </div>
                                </div>
                                <div class="form_group" id="massage_field">
                                    <div class="input_field">
                                        <input type="text" name="u_massage" id="u_massage" required="required"
                                               placeholder="Đánh giá">
                                    </div>
                                </div>
                                <div class="form_group">
                                    <div class="input_field">
                                        <button class="teashop-btn" type="submit">Gửi Đánh Giá</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Ends Contact Here -->

        <!-- Start Google Map Here -->
        <div class="g-map cd-google-map">
            <div id="google-container"></div>
            <div id="cd-zoom-in"></div>
            <div id="cd-zoom-out"></div>
        </div>
        <!-- Ends Google Map Here -->

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
                                <a href="#"><i class="fa fa-facebook"></i> Facebook</a>
                                <a href="#"><i class="fa fa-twitter"></i> Twitter</a>
                                <a href="#"><i class="fa fa-linkedin"></i> Linkedin</a>
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