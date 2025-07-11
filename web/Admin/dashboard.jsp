<%-- 
    Document   : dashboard
    Created on : 27-Jun-2025, 5:04:59 PM
    Author     : balwant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = "";
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("admin")) {
            email = c[i].getValue();
        }
    }
    if(email!=null && session.getAttribute(email)!=null){
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Wedlink</title>
    <script src="jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
            color: #fff;
        }
        .sidebar a {
            color: #adb5bd;
            padding: 10px 20px;
            display: block;
        }
        .sidebar a:hover, .sidebar .active {
            color: #fff;
            background-color: #495057;
            text-decoration: none;
        }
        .card {
            border-radius: 10px;
        }
        .navbar-brand {
            font-weight: bold;
        }
    </style>
    <script>
            $(document).ready(function(){
           $("#dashboard").addClass("active"); 
        });
    </script>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="sidebar.jsp"%>

        <!-- Main Content -->
        <main role="main" class="col-md-10 ml-sm-auto px-4">
            <!-- Top Navbar -->
            <nav class="navbar navbar-expand navbar-light bg-white mt-3 mb-4 shadow-sm rounded">
                <a class="navbar-brand" href="#">Dashboard</a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <span class="nav-link">Welcome, Admin</span>
                    </li>
                </ul>
            </nav>

            <!-- Dashboard Cards -->
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="card bg-info text-white shadow-sm">
                        <div class="card-body">
                            <h5>Total Users</h5>
                            <h3>5,432</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card bg-success text-white shadow-sm">
                        <div class="card-body">
                            <h5>Successful Matches</h5>
                            <h3>1,248</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card bg-warning text-white shadow-sm">
                        <div class="card-body">
                            <h5>Pending Approvals</h5>
                            <h3>36</h3>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="card mt-4">
                <div class="card-header bg-primary text-white">
                    Recent User Activity
                </div>
                <div class="card-body">
                    <ul>
                        <li>Rohit Sharma updated his profile</li>
                        <li>Kavya Patel sent a match request to Ramesh</li>
                        <li>Admin approved 10 new accounts</li>
                        <li>Sneha joined the platform</li>
                    </ul>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%
    }
    else{
        response.sendRedirect("index.jsp");
    }

%>