

$(".btn-addr-search").on("click", function() {

    new daum.Postcode({
        oncomplete: function(data) {

        }
    }).open();
})