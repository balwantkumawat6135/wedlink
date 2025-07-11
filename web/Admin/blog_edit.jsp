<%-- 
    Document   : blog_edit
    Created on : 02-Jul-2025, 5:46:05 PM
    Author     : balwant
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    Cookie c[] = request.getCookies();
    String email = "";
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("admin")) {
            email = c[i].getValue();
        }
    }
    if (email != null && session.getAttribute(email) != null) {
        if (request.getParameter("code") != null && request.getParameter("code").trim().length() > 0) {
            String code = request.getParameter("code");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                Statement st = cn.createStatement();

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
            $(document).ready(function () {
                $("#blog").addClass("active");
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
                        <a class="navbar-brand" href="#">Blogs</a>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <span class="nav-link">Welcome, Admin</span>
                            </li>
                        </ul>
                    </nav>
                    <%   
                        ResultSet r = st.executeQuery("select * from blogs where code='" + code + "'");
                       if(r.next()){
                    %>
                    <div class="row">
                        <div class="col-lg-12">
                            <form method="post" action="blog_update.jsp">
                                <input type="hidden" name="code" value="<%=r.getString(2)%>">
                                <div class="form-group">
                                    <label for="title">Title</label>
                                    <input type="text" name="title" value="<%=r.getString(3)%>" class="form-control" placeholder="Blog Title">
                                </div>
                                <div class="form-group">
                                    <label for="sd">Short Description</label>
                                    <input type="text" name="sd" class="form-control" value="<%=r.getString(4)%>" placeholder="Blog Short Description">
                                </div>
                                <div class="form-group">
                                    <%
                                        PreparedStatement pt=cn.prepareStatement("select * from blog_points where blog_code=?");
                                        pt.setString(1,r.getString(2));
                                        ResultSet rt=pt.executeQuery();
                                        String des="";
                                        while(rt.next()){
                                            des=des+rt.getString(2)+"\n";
                                        }
                                    %>
                                    <label for="des">Description</label>
                                    <textarea type="text" rows="10" name="des" class="form-control" placeholder="Blog Description"><%=des%></textarea>
                                </div>
                                <input type="submit" class="btn btn-outline-success" value="Submit">
                            </form>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </main>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

<%
            } catch (Exception E) {
                out.print(E.getMessage());
            }
        } else {
                response.sendRedirect("blog.jsp?empty=1");
            }
    } else {
        response.sendRedirect("index.jsp");
    }

%>

