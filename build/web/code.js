
$(document).on("click", "#rg", function() {
    var user = $("#username").val();
    var fname = $("#fname").val();
    var lname = $("#lname").val();
    var email = $("#email").val();
    var password = $("#pass").val();
    var gender = $('input[name="gender"]:checked').val();
    var caste = $("#caste").val();
    var religion = $("#religion").val();
    var occupation = $("#occupation").val();
    var dob = $("#date").val();
    var country = $("#country").val();
    var state = $("#state").val();
    var city = $("#city").val();
    console.log(user + " " + fname + " " + lname + " " + email + " " + password + " " + gender + " " + caste + " " + religion + " " + occupation + " " + dob + " " + country + " " + state + "" + city);
    $.post(
            "add_user.jsp", {username: user, fname: fname, lname: lname, email: email, pass: password, gender: gender, caste: caste, religion: religion, occupation: occupation, dob: dob, country: country, state: state, user: user, city: city}, function(data) {
        data = data.trim();
        if (data == 'success') {
            $.post(
                    "check.jsp", {email: email, pass: password}, function(data) {
                data = data.trim();
                if (data == 'success') {
                    $(".close").click();
                    window.open("http://localhost:8080/index.jsp", "_self");
                }
            }
            );
        }
    }
    );
});
$(document).on("click", "#login-btn", function() {
    var email = $("#email").val();
    var pass = $("#pass").val();
    $.post(
            "check.jsp", {email: email, pass: pass}, function(data) {
        data = data.trim();
        console.log(data);
        if (data == 'invalid_email') {
            $("#email-msg").html("Invalid Email");
        } else if (data == 'invalid_password') {
            $("#password-msg").html("Invalid Password");
        }
        else if (data == 'success') {
            $(".close").click();
            window.open("http://localhost:8080/index.jsp", "_self");
        }
    }
    );
});
$(document).on("click", ".cover-img", function() {
    $("#img").css("margin-top", "-140px");
    $(this).attr("class", "navbar-toggler clc-cover-img");
    $(".navbar").addClass("bg-dark");
});
$(document).on("click", ".clc-cover-img", function() {
    $("#img").css("margin-top", "-65px");
    $(this).attr("class", "navbar-toggler cover-img");
    $(".navbar").removeClass("bg-dark");
});
$(document).on("click", "#Create-Account", function() {
    $("#form").load("signup.jsp");
});
$(document).on("click", "#login", function() {
    $("#form").load("login.jsp");
});
$(document).on("click", ".logout", function() {
    $.post(
            "logout.jsp", {}, function(data) {
        data = data.trim();
        if (data == 'success') {
            window.open("http://localhost:8080/index.jsp", "_self");
        }
    }
    );
});
$(document).on("click", "#cng_pass-btn", function() {
    var cp = $("#current_pass").val();
    var pass = $("#new_pass").val();
    var repass = $("#repass").val();
    var flag = 1;
    if (cp.length < 1) {
        flag = 0;
        $("#current_pass").addClass("empty");
        $("#current_pass").attr("placeholder", "This feild Required");
    }
    if (pass.length < 1) {
        flag = 0;
        $("#new_pass").addClass("empty");
        $("#new_pass").attr("placeholder", "This feild Required");
    }
    if (repass.length < 1) {
        flag = 0;
        $("#repass").addClass("empty");
        $("#repass").attr("placeholder", "This feild Required");
    }
    if (flag == 0) {
        $.post(
                "change_pass.jsp", {cp: cp, pass: pass, repass: repass}, function(data) {
            data = data.trim();
            console.log(data);
            if (data == 'wrong_cp') {
                $("#current_pass").addClass("empty");
                $("#current_pass").attr("placeholder", "Wrong current password");
            }
            else if (data == 'pass_not_same') {
                $("#new_pass,#repass").addClass("empty");
                $("#new_pass,#repass").attr("placeholder", "Password Doesn't Match");
            }
            else if (data == 'cp_pass_same') {
                $("#new_pass,#repass").addClass("empty");
                $("#new_pass,#repass").attr("placeholder", "Current Password and New Password Must be Diffrent");
            }
            else if (data == 'success') {
                $("#close_pass").click();
                toastr.success("Password Changed Successfully");
            }


        }
        );
    }
});
$(document).on("click", ".empty", function() {
    $(this).removeClass("empty");
});
$(document).on("click", "#close_pass", function() {
        location.reload();
});
$(document).on("click", "#update-btn", function() {
    var fname = $("#fname").val();
    var lname = $("#lname").val();
    var gender = $('input[name="gender"]:checked').val();
    var caste = $("#caste").val();
    var religion = $("#religion").val();
    var occupation = $("#occupation").val();
    var dob = $("#date").val();
    var country = $("#country").val();
    var state = $("#state").val();
    var city = $("#city").val();
    var flag = 1;
    if (occupation.length < 1) {
        flag = 0;
        $("#occupation").addClass("empty");
        $("#occupation").attr("placeholder", "Fill This Field");
    }
    if (fname.length < 1) {
        flag = 0;
        $("#fname").addClass("empty");
        $("#fname").attr("placeholder", "Fill This Field");
    }
    if (lname.length < 1) {
        flag = 0;
        $("#lname").addClass("empty");
        $("#lname").attr("placeholder", "Fill This Field");
    }
    if (dob.length < 7) {
        flag = 0;
        $("#date").addClass("empty");
        $("#date").attr("placeholder", "Fill This Field");
    }
    if (flag == 1) {
        $.post(
                "update_profile.jsp", {fname: fname, lname: lname, gender: gender, caste: caste, religion: religion, occupation: occupation, dob: dob, country: country, state: state, city: city}, function(data) {
            data = data.trim();
            alert(data);
            if (data == 'success') {
                $("#close_pass").click();
                toastr.success("Profile Updated Successfully");
            }
            else if (data == 'again') {
                toastr.error("Something Went Wrong Try Again");
            }
            else {
                toastr.error(data);
            }
        }
        );
    }
});
$(document).on("click", "#search-btn", function() {
    var email=$(this).attr("email");
    email=email.trim();
    if (email != null && email.trim().length > 5){
        var gender = $("#gender").val();
        var s_age = $("#agefrom").val();
        var e_age = $("#ageto").val();
        var religion = $("#religion").val();
        var toungh = $("#tongue").val();
        if (s_age > e_age) {
            $("#agefrom").addClass("empty");
            toastr.error("Invalid Choise","Try Again");
        }
        else {
            $("input").removeClass("empty");
            $.post(
                "search.jsp",{gender:gender,s_age:s_age,e_age:e_age,religion:religion,toungh:toungh},function(data){
                    data=data.trim();
                    console.log(data);                    
                    window.location.href = "searched_profile.jsp?user=" + encodeURIComponent(data);
                }
            );
        }
    }
    else{
        $("#myModal").modal('show');
    }
    
});

$(document).on("click", "#interst-btn", function() {
    var username = $(this).attr("pid");
    var sn=$(this).attr("sn");
    alert(sn);
    $.post(
            "instrested.jsp", {username: username}, function(data) {
        data = data.trim();
        if (data == 'success') {
            $("#row").load(location.href + " #row");
        }
    }
    );
});

$(document).on("click", "#conform,#delete", function() {
    var res = $(this).attr("res");
    var username = $(this).attr("user");
    var email = $(this).attr("email");
    var cname = $(this).attr("pid");
    alert(username);
    alert(email);
    $.post(
            "interst_update.jsp", {response: res, username: username, email: email}, function(data) {
        data = data.trim();
        alert(data);
        if (data == 'success') {
            $("#profile_" + cname).fadeOut();
        }
    }
    );
});
$(document).on("click",".login-btn",function(){
   $('#myModal').modal('show');
});

$(document).on("click",".upload_img",function(){
   $('#post_image').modal('show');
});
$(document).on("click",".p_gallery",function(){
   $('#gallery').modal('show');
});

$(document).on("click", "#block", function() {
    var res = 2;
    var username = $(this).attr("user");
    var email = $(this).attr("email");
    var cname = $(this).attr("pid");
    var block_by = $(this).attr("block_email")
    alert(username);
    alert(email);
    alert(block_by);
    $.post(
            "user_block.jsp", {response: res, username: username, email: email, block_by: block_by}, function(data) {
        data = data.trim();
        alert(data);
        if (data == 'success') {
            $(".pid-" + cname).fadeOut();
        }
    }
    );
});
$(document).on("click", "#msg-send", function() {
    var t_username = $("#msg_row").attr("t_username");
    var f_username = $("#msg_row").attr("f_username");
    var a = $("#messageInput").val();
    $.post(
            "send_msg.jsp", {t_username: t_username, f_username: f_username, msg: a}, function(data) {
        data = data.trim();
        if (data == 'success') {
            $("#new_msg").html("<span class='b'>" + a + "</span>");
            $("#messageInput").val("");
        }
    }
    );
});
var to_username = "";
var from_username = "";
var chatInterval;

$(document).on("click", ".contact", function() {
    $(".display-none").attr("class", "chat-input-area");
    
    to_username = $(this).attr("to_username");
    from_username = $(this).attr("from_username");
    
    $("#receiverImg").attr("src", "profile/" + to_username + ".jpg");
    $("#receiverName").text(to_username);
    
    $("#chatBox").load("msg.jsp", {
        to_username: to_username,
        from_username: from_username
    });

    // Clear previous interval if already running
    if (chatInterval) clearInterval(chatInterval);

    // Start new interval
    chatInterval = setInterval(function() {
        $("#chatBox").load("msg.jsp", {
            to_username: to_username,
            from_username: from_username
        });
    }, 10000);
});
$(document).on("click","#sidebar_btn",function(){
   $("#profileSidebar").addClass("open"); 
});
$(document).on("click",".close-btn",function(){
   $("#profileSidebar").removeClass("open"); 
});