<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
        <!-- Vendor CSS Files -->
        <link href="css/bootstrap.min_lg.css" rel="stylesheet">
        <link href="css/quill.bubble_lg.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="css/custome_lg.css" rel="stylesheet">

    </head>

    <body>

        <main>
            <div class="container-fluid bg-full">

                <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                                <div class="card mb-3">

                                    <div class="card-body">

                                        <div class="pb-2 mt-2">
                                            <a href="index.html" class="d-flex justify-content-center mb-3">
                                                <img src="img/logo.png" alt="">
                                            </a>
                                            <h5 class="card-title text-center pb-0 fs-4">Đăng nhập tài khoản</h5>
                                            <p class="text-center small">Nhập tài khoản & mật khẩu để đăng nhập</p>
                                        </div>

                                        <form action="login" method="POST" class="row g-3 needs-validation" novalidate>
                                            <!-- Hiển thị thông báo lỗi -->
                                            <div class="d-flex justify-content-center">
                                                <c:if test="${not empty errorMessage}">
                                                    <p style="color: red;">${errorMessage}</p>
                                                </c:if>    
                                            </div>

                                            <div class="col-12">
                                                <div class="input-group has-validation">
                                                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                    <input type="email" name="email_login" class="form-control" placeholder="Email" required>
                                                    <div class="invalid-feedback">Nhập thông tin tài khoản</div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <input type="password" name="pass_login" class="form-control" placeholder="Password" required>
                                                <div class="invalid-feedback">Vui lòng nhập mật khẩu</div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                                                    <label class="form-check-label" for="rememberMe">Nhớ mật khẩu</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button class="btn btn-primary w-100" type="submit" name="action" value="login">Đăng nhập</button>
                                            </div>
                                            <div class="col-12">
                                                <p class="small mb-0">Bạn mới biết đến TeaShop? <a href="register">Đăng ký</a></p>
                                            </div>
                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main><!-- End #main -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="js/apexcharts.min_lg.js"></script>
        <script src="js/tinymce.min_lg.js"></script>
        <!-- Template Main JS File -->
        <script src="js/main_lg.js"></script>

    </body>

</html>