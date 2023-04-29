$(document).ready(function () {
    unmatchPassword();
    existedUsername();


});

function unmatchPassword() {
    $("form").submit(function (event) {
        let password = $("#password").val();
        let repassword = $("#rePassword").val();
        if (password != repassword) {
            $("#rePassword").next().text("Không trùng khớp! Vui lòng nhập lại");
            event.preventDefault();
        }
        else {
            $("#rePassword").next().text("");
        }
    });
}


