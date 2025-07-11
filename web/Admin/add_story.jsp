<%-- 
    Document   : add_story
    Created on : 27-Jun-2025, 9:44:38 PM
    Author     : balwant
--%>

<%@page import="java.sql.*"%>
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
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink","root","");
            Statement st=cn.createStatement();
        
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Wedlink</title>
    <script src="jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        .s_img{
            width:200px;
            height: 100px;
        }
        .s_icon{
            font-size: 30px;
        }
        
    </style>
    <script>
        $(document).ready(function(){
           $("#add_story").addClass("active"); 
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
                <a class="navbar-brand" href="#">Add Story</a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <span class="nav-link">Welcome, Admin</span>
                    </li>
                </ul>
            </nav>

            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="story.jsp">
                        <div class="form-group">
                            <label for="title">Stroy Title</label>
                            <input type="text" name="title" class="form-control" placeholder="Story Title">
                        </div>
                        <div class="form-group">
                            <label for="des">Stroy</label>
                            <textarea type="text" rows="10" name="des" class="form-control" placeholder="Story"></textarea>
                        </div>
                        <input type="submit" class="btn btn-outline-success" value="Submit">
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <table class="table">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Title</th>
                                <th>Stroy Description</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet r=st.executeQuery("select * from success_stories");
                                while(r.next()){
                            %>
                            <tr>
                                <td><img src="Story/<%=r.getString(2)%>.jpg" class="s_img"></td>
                                <td><%=r.getString(3)%></td>
                                <td><%=r.getString(4)%></td>
                                <td><a href="story_edit.jsp?code=<%=r.getString(2)%>"><i class="fa fa-edit s_icon" style="color:green;"></i></a></td>
                                <td><a href="story_delete.jsp?code=<%=r.getString(2)%>"<i class="fa fa-trash s_icon" style="color:red;"></i></a></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
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
        catch(Exception E){
            out.print(E.getMessage());
        }
    }
    else{
        response.sendRedirect("index.jsp");
    }

%>
