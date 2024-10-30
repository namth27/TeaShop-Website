$(document).ready(function() {
    $('.pagination a').click(function(e) {
        e.preventDefault();
        var url = $(this).attr('href');
        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
                $('.shop-product-list').html(data);
            }
        });
    });
});
