

$(".btn-addr-search").on("click", function() {

    new daum.Postcode({
        oncomplete: function(data) {
            $("#pAddr").val(data.address);
        }
    }).open();
})

$(document).ready(function() {

    $(".form-control").on({
        "change" : function() {
            const input = $(this);
            const inputVal = input.val();
            const inputId = input.attr("id");

            const confirmValue = function(regex, str){
                if(regex.test(inputVal)){
                    input.removeClass("is-invalid");
                    // comment.text("");
                    // validation = true;
                } else {
                    input.addClass("is-invalid");
                    // comment.text(str);
                    // validation = false;
                    input.focus();
                }
            }
            if(inputId == "pId") {

                // $.ajax({
                //     url : "/ajaxCheckPartnerId.do",
                //     success: function() {
                //
                //     }
                // })
                const idRef = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                confirmValue(idRef);

            } else if (inputId == "pPw") {
                const pwReg = /^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
                confirmValue(pwReg);
            } else if (inputId == "dob") {
                const dobRef = /^(19[0-9][0-9]|200[0-3])(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
                confirmValue(dobRef);
            } else if (inputId == "pPhone") {
                const phoneRef = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
                confirmValue(phoneRef)
            }

        }
    })
})