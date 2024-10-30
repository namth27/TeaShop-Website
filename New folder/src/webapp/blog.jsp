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
        <title>Blog - TeaShop</title>

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
            <h1 class="text-center text-white display-6">Blog</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
                <li class="breadcrumb-item active text-white">Blog</li>
            </ol>
        </div>
        <!-- Ends Page Banner Here -->

        <!-- Start Blog Content Here -->
        <section class="section-padding" id="blog-page-content">
            <div class="container">
                <div class="row row-reverse">
                    <!-- Start Blog Content Here -->
                    <div class="col-md-9 col-md-push-3">
                        <!-- Start Blog Post Content -->
                        <div class="blog-post-content">
                            <!-- Start Signle Blog Box -->
                            <div class="signle-blog-box">
                                <div class="blog-bg blog-bg-1"></div>
                                <div class="blog-content-box">
                                    <h3>Trà Long Tỉnh Tây Hồ đã trở thành sản phẩm của ngành</h3>
                                    <div class="blog-meta">
                                        <span><i class="fa fa-calendar"></i> April 8, 2024</span>
                                        <span><a href="#"><i class="fa fa-user"></i>Nguyễn Thành Nam</a></span>
                                    </div>
                                    <p>Trà Long Tỉnh Tây Hồ được mệnh danh là “quốc trà”, đứng đầu trong thập đại danh trà
                                        Trung Hoa.
                                        Nga từ thời nhà Minh, trà đã nổi danh. Đến thời Khang Hy, trà chuyên dùng để tiến
                                        vua. Tương truyền,
                                        đến thời Càn Long, vua có ngự qua vùng Tây Hồ, đê mê vì cảnh sắc và vị trà liền thử
                                        làm “nông dân” hái trà.
                                        Chợt nghe tin thái hậu trong cung lâm bệnh liền bỏ vội cánh trà trong tay áo. Sau
                                        khi hồi cung,
                                        vua lấy trà pha cho Thái hậu uống liền khỏi bệnh. Từ đó, trà được phong Hoàng trà và
                                        trở thành
                                        danh trà số 1 trong 10 loại trà nổi tiếng của Trung Hoa.</p>
                                    <a class="read-btn" href="blog-details.jsp">Đọc thêm<i
                                            class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                            <!-- Ends Signle Blog Box -->

                            <!-- Start Signle Blog Box -->
                            <div class="signle-blog-box">
                                <div class="blog-bg blog-bg-2"></div>
                                <div class="blog-content-box">
                                    <h3>Trinh nữ trà là một loại đồ uống thơm phổ biến</h3>
                                    <div class="blog-meta">
                                        <span><i class="fa fa-calendar"></i> April 8, 2024</span>
                                        <span><a href="#"><i class="fa fa-user"></i>Nguyễn Thành Nam</a></span>
                                    </div>
                                    <p>Chắc hẳn mọi người đã từng nghe về “Trinh nữ trà” với truyền thuyết: chế biến trà từ
                                        búp trà dấu trong
                                        ngực trinh nữ. Ít ai biết, Trà Bích Loa Xuân chính là danh trà huyền thoại ấy. Chính
                                        bởi điển tích này,
                                        lúc đầu, trà có tên là “Hách Sát Nhân Hương”. Sau đó vua Càn Long thử trà, thấy
                                        thích, nghe cái tên không
                                        được nhã nên đã đổi tên là Bích Loa Xuân.</p>
                                    <a class="read-btn" href="blog-details.jsp">Đọc thêm<i
                                            class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                            <!-- Ends Signle Blog Box -->

                            <!-- Start Signle Blog Box -->
                            <div class="signle-blog-box">
                                <div class="blog-bg blog-bg-3"></div>
                                <div class="blog-content-box">
                                    <h3>Trà Phổ Nhĩ Vân Nam loại trà tạo nên thương hiệu</h3>
                                    <div class="blog-meta">
                                        <span><i class="fa fa-calendar"></i> April 8, 2024</span>
                                        <span><a href="#"><i class="fa fa-user"></i>Nguyễn Thành Nam</a></span>
                                    </div>
                                    <p>Tây Bắc Việt Nam, Thượng Lào và Vân Nam Trung Quốc chính là quê hương của cây chè. Ở
                                        đây có loại trà shan tuyết
                                        cổ thụ danh tiếng mọc hoang trên các đỉnh núi cao. “Có phúc đưởng uống trà cổ thụ”.
                                        Các trà nhân đều khao khát loại
                                        trà này. Đặc biệt, các bánh Trà Phổ Nhĩ Vân Nam được làm từ shan tuyết cổ thụ cho ra
                                        chất lượng tuyệt hảo với vị ngọt nhẹ,
                                        thanh và hương thơm rất dễ chịu. Một bánh trà Phổ Nhĩ nửa kg 60 năm tuổi từng được
                                        bán với giá 150 ngàn đô la Mỹ. Tính ra, 1 gam trà đắt gấp vài lần 1 gam vàng. Đây
                                        chính là loại trà quý hơn vàng!</p>
                                    <a class="read-btn" href="blog-details.jsp">Đọc thêm<i
                                            class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                            <!-- Ends Signle Blog Box -->
                        </div>
                        <!-- Ends Blog Post Content -->

                        <!-- Start Pagination Here -->
                        <div class="pagination-area">
                            <ul class="">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li class="active"><a href="#">3</a></li>
                                <li><a href="#">...</a></li>
                                <li><a href="#">10</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
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
                                <form action="#">
                                    <input type="search" placeholder="Tìm kiếm...">
                                    <button type="submit" class=""><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                            <!-- Ends Search Box Widget -->

                            <!-- Start Categories Widget -->
                            <div class="categories-widget sidebar-widget">
                                <div class="sidebar-titel">
                                    <h4>Thể loại</h4>
                                </div>
                                <ul class="categories-item">
                                    <li><a href="#">Trà xanh <span>25</span></a></li>
                                    <li><a href="#">Trà thảo mộc <span>15</span></a></li>
                                    <li><a href="#">Trà Shan tuyết <span>35</span></a></li>
                                    <li><a href="#">Trà phổ nhĩ <span>20</span></a></li>
                                    <li><a href="#">Trà ô long <span>10</span></a></li>
                                    <li><a href="#">Trà Đại hồng bào <span>25</span></a></li>
                                    <li><a href="#">Kỳ Môn Hồng trà <span>17</span></a></li>
                                    <li><a href="#">Bạch trà <span>30</span></a></li>
                                </ul>
                            </div>
                            <!-- Ends Categories Widget -->

                            <!-- Start Featurs Product Widget Here -->
                            <div class="recent-post-widget sidebar-widget">
                                <div class="sidebar-titel">
                                    <h4>Sản phẩm nổi bật</h4>
                                </div>

                                <ul class="featured-prodcut-list">
                                    <li>
                                        <a href="#">
                                            <img src="img/product/featured/1.jpg" alt="Featured Product">
                                            <p>
                                                Trà Bạch Hào Ngân Châm <span>Price: $10-$180</span>
                                            </p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img src="img/product/featured/2.jpg" alt="Featured Product">
                                            <p>
                                                Trà Lục An Qua Phiến <span>Price: $10-$180</span>
                                            </p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img src="img/product/featured/3.jpg" alt="Featured Product">
                                            <p>
                                                Kỳ Môn Hồng Trà <span>Price: $10-$180</span>
                                            </p>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- Ends Featurs Product Here -->

                            <!-- Start Tag List widget Here 
                            <div class="sidebar-widget">
                                <div class="sidebar-titel">
                                    <h4>Tag List </h4>
                                </div>
                                <ul class="taglist">
                                    <li><a href="#">Green</a></li>
                                    <li><a href="#">Black</a></li>
                                    <li><a href="#">Loose Tea</a></li>
                                    <li><a href="#">Herbal</a></li>
                                    <li><a href="#">White</a></li>
                                    <li><a href="#">Orange</a></li>
                                    <li><a href="#">Loose Tea</a></li>
                                    <li><a href="#">Black</a></li>
                                    <li><a href="#">Orange</a></li>
                                </ul>
                            </div>
                             Ends Tag List widget Here -->
                        </div>
                    </div>
                    <!-- Ends Side Bar Here -->
                </div>
            </div>
        </section>
        <!-- Ends Blog Content Here -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
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