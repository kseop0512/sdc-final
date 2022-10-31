

$(".btn-addr-search").on("click", function() {

    new daum.Postcode({
        oncomplete: function(data) {
            $("#pAddr").val(data.address);
        }
    }).open();
})

$(document).ready(function() {

    const INVALID_CLASS = "is-invalid";
    $(".form-control").on({
        "change" : function() {
            const input = $(this);
            const inputVal = input.val();
            const inputId = input.attr("id");

            const confirmValue = function(regex, str){
                if(regex.test(inputVal)){
                    input.removeClass(INVALID_CLASS);
                    // comment.text("");
                    // validation = true;
                } else {
                    input.addClass(INVALID_CLASS);
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
            } else if (inputId == "pDob") {
                const dobRef = /^(19[0-9][0-9]|200[0-3])(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
                confirmValue(dobRef);
            } else if (inputId == "pPhone") {
                const phoneRef = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
                confirmValue(phoneRef)
            }

        }
    });

    $(".btn-complete").on("click", function() {

        let isValid = true;
        $(".form-control").each(function(index, item) {

            if($(item).val() == "" || $(item).hasClass(INVALID_CLASS)) {
                $(item).focus();
                isValid = false;
                return false;
            }
        });

        if(isValid === false) {return};

        if($("[name=pGender]:checked").length < 1) {
            $("[name=pGender]").focus();
            return;
        } else if ($("[name=license]:checked").length < 1) {
            $("[name=license]").eq(0).focus();
            return;
        } else if($("[name=agreement]:checked").length < 2) {
            alert("동의 사항은 모두 필수 체크 항목입니다.");
            return;
        }

    })

    $("[name=profilename]").on("change", function(e) {
        var str = $(this).val();
        var fileName = str.split('\\').pop().toLowerCase();
        //checkFileName(fileName);

        var ext =  fileName.split('.').pop().toLowerCase();
        if($.inArray(ext, ['jpg', 'pdf', 'png', 'jpeg', 'gif']) == -1) {
            alert(ext+'파일은 업로드 하실 수 없습니다.');
            $(this).val("");
            return;
        }

        //파일명에 특수문자 체크
        var pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
        if(pattern.test(fileName) ){
            //alert("파일명에 허용된 특수문자는 '-', '_', '(', ')', '[', ']', '.' 입니다.");
            alert('파일명에 특수문자를 제거해주세요.');
            $(this).val("");
            return;
        }

        if (e.target.files && e.target.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(e.target.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }

    })


})



function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('preview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('preview').src = "";
    }
}

function checkFileName(str){

    //1. 확장자 체크
    var ext =  str.split('.').pop().toLowerCase();
    if($.inArray(ext, ['bmp' , 'hwp', 'jpg', 'pdf', 'png', 'xls', 'zip', 'pptx', 'xlsx', 'jpeg', 'doc', 'gif']) == -1) {

        //alert(ext);
        alert(ext+'파일은 업로드 하실 수 없습니다.');
    }

    //2. 파일명에 특수문자 체크
    var pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
    if(pattern.test(str) ){
        //alert("파일명에 허용된 특수문자는 '-', '_', '(', ')', '[', ']', '.' 입니다.");
        alert('파일명에 특수문자를 제거해주세요.');
    }
}

function checkPartnerMail(btn) {

    const emailInput = $("[name=pId]");
    if(emailInput.val() != "") {

        const email = emailInput.val();

        console.log(email)

        $.ajax({
            url : "/sendIdCheckMail.do",
            data: {email : email},
            success : function(result) {
                console.log(result);
            }

        })
    }

}
