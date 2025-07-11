$(document).on("click", "#login", function () {
    var email = $("#email").val().trim();
    var password = $("#password").val().trim();
    $.post(
            "check_admin.jsp", {email: email, password: password}, function (data) {
        data = data.trim();
        if (data == 'success') {
            window.open("http://localhost:8080/Admin/dashboard.jsp", "_self");
        } else {
            toastr.error(data);
        }
    }
    );
});
