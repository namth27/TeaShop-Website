//document.addEventListener("DOMContentLoaded", function() {
//    // Chọn tất cả các phần tử có class "product-img"
//    var productImages = document.querySelectorAll(".product-img");
//
//    // Lặp qua mỗi ảnh sản phẩm và thêm sự kiện click
//    productImages.forEach(function(image) {
//        image.addEventListener("click", function() {
//            // Điều hướng người dùng đến trang product-details.html
//            window.location.href = "product-details.jsp";
//        });
//    });
//});

// JavaScript

//document.addEventListener("DOMContentLoaded", function() {
//    // Lắng nghe sự kiện khi tài liệu HTML đã được tải hoàn toàn
//    // Chọn tất cả các nút "Thêm vào giỏ hàng"
//    var addToCartButtons = document.querySelectorAll('.btn.border.border-secondary.rounded-pill.px-3.py-1.mb-4');
//
//    // Lặp qua từng nút "Thêm vào giỏ hàng" và thêm sự kiện click
//    addToCartButtons.forEach(function(button) {
//        button.addEventListener("click", function(event) {
//            event.preventDefault(); // Ngăn chặn hành động mặc định của nút (chẳng hạn nhảy lên đầu trang)
//
//            // Hiển thị màn hình thông báo
//            var notificationOverlay = document.createElement("div");
//            notificationOverlay.className = "notification-overlay";
//
//            var notificationBox = document.createElement("div");
//            notificationBox.className = "notification-box";
//            notificationBox.innerHTML = '<i class="fa fa-check-circle"></i> Đã thêm vào giỏ hàng thành công';
//
//            notificationOverlay.appendChild(notificationBox);
//            document.body.appendChild(notificationOverlay);
//
//            // Xóa màn hình thông báo sau 3 giây
//            setTimeout(function() {
//                document.body.removeChild(notificationOverlay);
//            }, 2000);
//        });
//    });
//});

document.addEventListener('DOMContentLoaded', function () {
    // Số sản phẩm trên mỗi trang
    const productsPerPage = 9;
    // Danh sách sản phẩm
    const productList = document.getElementById('product-list');
    // Nút phân trang
    const prevPageBtn = document.getElementById('prev-page');
    const nextPageBtn = document.getElementById('next-page');
    // Số trang hiện tại
    let currentPage = 1;

    // Hàm hiển thị sản phẩm trên trang hiện tại
    function showProducts(page) {
        const start = (page - 1) * productsPerPage;
        const end = start + productsPerPage;
        const products = document.querySelectorAll('.shop-items');
        products.forEach((product, index) => {
            if (index >= start && index < end) {
                product.style.display = 'block';
            } else {
                product.style.display = 'none';
            }
        });
    }

    // Hàm cập nhật trạng thái nút phân trang
    function updatePaginationButtons() {
        if (currentPage === 1) {
            prevPageBtn.classList.add('disabled');
        } else {
            prevPageBtn.classList.remove('disabled');
        }

        if (currentPage === totalPages) {
            nextPageBtn.classList.add('disabled');
        } else {
            nextPageBtn.classList.remove('disabled');
        }
    }

    // Hàm tạo và hiển thị số trang
    function renderPageNumbers() {
        const pagination = document.getElementById('pagination');
        pagination.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            const li = document.createElement('li');
            li.classList.add('page-item');
            if (i === currentPage) {
                li.classList.add('active');
            }
            const a = document.createElement('a');
            a.classList.add('page-link');
            a.href = '#';
            a.textContent = i;
            li.appendChild(a);
            pagination.appendChild(li);
        }
    }

    // Xử lý khi click vào số trang
    document.getElementById('pagination').addEventListener('click', function (event) {
        event.preventDefault();
        if (event.target.tagName === 'A') {
            currentPage = parseInt(event.target.textContent);
            showProducts(currentPage);
            updatePaginationButtons();
            renderPageNumbers();
        }
    });

    // Xử lý khi click vào nút "Previous"
    prevPageBtn.addEventListener('click', function (event) {
        event.preventDefault();
        if (currentPage > 1) {
            currentPage--;
            showProducts(currentPage);
            updatePaginationButtons();
            renderPageNumbers();
        }
    });

    // Xử lý khi click vào nút "Next"
    nextPageBtn.addEventListener('click', function (event) {
        event.preventDefault();
        if (currentPage < totalPages) {
            currentPage++;
            showProducts(currentPage);
            updatePaginationButtons();
            renderPageNumbers();
        }
    });

    // Bắt đầu
    const totalProducts = document.querySelectorAll('.shop-items').length;
    const totalPages = Math.ceil(totalProducts / productsPerPage);
    showProducts(currentPage);
    updatePaginationButtons();
    renderPageNumbers();
});

// Hàm tạo và hiển thị số trang
function renderPageNumbers() {
    const pagination = document.getElementById('pagination');
    pagination.innerHTML = '';

    // Tạo nút "«" nếu không ở trang đầu
    if (currentPage > 1) {
        const prevLi = document.createElement('li');
        prevLi.classList.add('page-item');
        const prevLink = document.createElement('a');
        prevLink.classList.add('page-link');
        prevLink.href = '#';
        prevLink.innerHTML = '&laquo;';
        prevLi.appendChild(prevLink);
        pagination.appendChild(prevLi);
    }

    for (let i = 1; i <= totalPages; i++) {
        const li = document.createElement('li');
        li.classList.add('page-item');
        if (i === currentPage) {
            li.classList.add('active');
        }
        const a = document.createElement('a');
        a.classList.add('page-link');
        a.href = '#';
        a.textContent = i;
        li.appendChild(a);
        pagination.appendChild(li);
    }

    // Tạo nút "»" nếu không ở trang cuối
    if (currentPage < totalPages) {
        const nextLi = document.createElement('li');
        nextLi.classList.add('page-item');
        const nextLink = document.createElement('a');
        nextLink.classList.add('page-link');
        nextLink.href = '#';
        nextLink.innerHTML = '&raquo;';
        nextLi.appendChild(nextLink);
        pagination.appendChild(nextLi);
    }
}

function sendProductId(productId) {
    // Create a form dynamically
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "index"); // Your servlet URL

    // Create an input element for product ID
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "productId");
    hiddenField.setAttribute("value", productId);

    form.appendChild(hiddenField);

    // Add the form to the body and submit it
    document.body.appendChild(form);
    form.submit();
}

document.addEventListener('DOMContentLoaded', function () {
    const checkboxes = document.querySelectorAll('input[name="shippingOption"]');
    
    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', function () {
            if (this.checked) {
                checkboxes.forEach((cb) => {
                    if (cb !== this) {
                        cb.checked = false;
                    }
                });
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const checkboxes = document.querySelectorAll('input[name="paymentMethod"]');
    
    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', function () {
            if (this.checked) {
                checkboxes.forEach((cb) => {
                    if (cb !== this) {
                        cb.checked = false;
                    }
                });
            }
        });
    });
});












