<%-- 
    Document   : index.jsp
    Created on : 27-Jun-2025, 5:00:49 PM
    Author     : balwant
--%>
<%
    Cookie c[]=request.getCookies();
    String email="";
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("admin")){
            email=c[i].getValue();
        }
    }
    if(email!=null && session.getAttribute(email)!=null){
        response.sendRedirect("dashboard.jsp");
    }
    else{
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Sign In - Wedlink</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="code.js"></script>
        <style>
            body {
                background: linear-gradient(120deg, #6c5ce7, #00cec9);
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .card {
                border: none;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            }
            .form-control {
                border-radius: 20px;
            }
            .btn-primary {
                border-radius: 20px;
                background-color: #6c5ce7;
                border: none;
            }
            .btn-primary:hover {
                background-color: #5a4cd3;
            }
            .login-title {
                font-weight: bold;
                color: #2d3436;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card p-4">
                        <div class="card-body">
                            <h3 class="text-center login-title mb-4">Admin Sign In</h3>
                            <form  method="post">
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <input type="email" name="email" id="email" class="form-control " placeholder="admin@example.com" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="••••••••" required>
                                </div>
                                <button type="button" id="login" class="btn btn-primary btn-block">Sign In</button>
                                <div class="text-center mt-3">
                                    <a href="#">Forgot password?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <p class="text-center text-white mt-3">© 2025 Wedlink Admin Panel</p>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
<%
    }
%>