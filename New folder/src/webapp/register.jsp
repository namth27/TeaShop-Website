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

                                        <div class="pb-2">
                                            <a href="index.html" class="d-flex justify-content-center mb-3">
                                                <img src="img/logo.png" alt="">
                                            </a>
                                            <h5 class="card-title text-center pb-0 fs-4">Tạo tài khoản</h5>
                                            <p class="text-center small">Nhập thông tin cá nhân để tạo tài khoản</p>
                                        </div>

                                        <div class="d-flex justify-content-center">                                         
                                            <c:if test="${not empty errorMessage}">
                                                <p style="color: red;">${errorMessage}</p>
                                            </c:if>
                                            <c:if test="${not empty successMessage}">
                                                <p style="color: green;">${successMessage}</p>
                                            </c:if>
                                        </div>

                                        <form action="register" method="POST" class="row g-3 needs-validation" novalidate>
                                            <div class="col-12">
                                                <label for="yourName" class="form-label">Nhập tên của bạn </label>
                                                <input type="text" name="name" class="form-control" id="yourName" required>
                                                <div class="invalid-feedback">Vui lòng nhập đầy đủ tên của bạn!</div>
                                            </div>

                                            <div class="col-12">
                                                <label for="yourEmail" class="form-label">Nhập email của bạn</label>
                                                <div class="input-group has-validation">
                                                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                    <input type="email" name="email" class="form-control" id="yourEmail" required>
                                                    <div class="invalid-feedback">Vui lòng nhập email của bạn</div>
                                                    <div class="d-flex justify-content-center">
                                                        <c:if test="${not empty errorMessageEmail}">
                                                            <p style="color: red;">${errorMessageEmail}</p>
                                                        </c:if>    
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label for="yourPassword" class="form-label">Nhập mật khẩu</label>
                                                <input type="password" name="password" class="form-control" id="yourPassword" required>
                                                <div class="invalid-feedback">Vui lòng nhập mật khẩu.</div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-check">
                                                    <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                                                    <label class="form-check-label" for="acceptTerms">Tôi đồng ý với các <a href="#">điều khoản và điều kiện</a></label>
                                                    <div class="invalid-feedback">Bạn chưa đồng ý với các điều khoản hợp lệ.</div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button class="btn btn-primary w-100" type="submit" name="action" value="register">Tạo tài khoản</button>
                                            </div>
                                            <div class="col-12">
                                                <p class="small mb-0">Đã có sẵn tài khoản? <a href="login">Đăng nhập</a></p>
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