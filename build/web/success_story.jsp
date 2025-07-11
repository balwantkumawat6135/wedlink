<%-- 
    Document   : ss
    Created on : 01-Jul-2025, 5:05:20 PM
    Author     : balwant
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("code") != null && request.getParameter("code").trim().length() > 0) {
        try {
            String code = request.getParameter("code").trim();
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
            Statement st = cn.createStatement();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Wedlink Success Stories</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #fefefe;
                color: #333;
                line-height: 1.6;
            }

            h2, h3 {
                font-weight: 700;
                color: #c2185b;
            }

            .story-img {
                width: 100%;
                height: auto;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .featured {
                background: linear-gradient(120deg, #ffe4ec, #ffffff);
                padding: 40px;
                border-radius: 16px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
                margin-bottom: 50px;
            }

            .card {
                border: none;
                border-radius: 16px;
                overflow: hidden;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                transform: translateY(-6px);
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
            }

            .card-title {
                font-size: 1.2rem;
                font-weight: 600;
                color: #d81b60;
            }
            a:hover{
                text-decoration:none;
            }

            .card-text {
                color: #444;
                font-size: 0.95rem;
            }

            .section-heading {
                text-align: center;
                margin-bottom: 40px;
                font-size: 2rem;
            }

            @media (max-width: 767px) {
                .featured .row {
                    flex-direction: column-reverse;
                }
            }
            .clamp-text {
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 4;
                overflow: hidden;
                text-overflow: ellipsis;
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <h2 class="section-heading">💖 Wedlink Success Stories</h2>

            <!-- Featured Story -->
            <div class="featured">
                <div class="row align-items-center">
                    <%
                        ResultSet r = st.executeQuery("select * from success_stories where code='" + code + "'");
                        if (r.next()) {
                    %>
                    <div class="col-md-6">
                        <img src="Admin/Story/<%=code%>.jpg"  class="story-img">
                    </div>
                    <div class="col-md-6 text-center">
                        <h3><%=r.getString(3)%></h3>
                        <p><%=r.getString(4)%></p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <!-- Random Stories -->
            <div class="row">
                <%
                    ResultSet rs=st.executeQuery("select * from success_stories where code <> '"+code+"' order by RAND() limit 0,6 ");
                    while(rs.next()){
                %>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm h-100">
                        <a href="success_story.jsp?code=<%=rs.getString(2)%>"><img src="Admin/Story/<%=rs.getString(2)%>.jpg" class="card-img-top" alt="Sneha & Rohit"></a>
                        <div class="card-body">
                            <a href="success_story.jsp?code=<%=rs.getString(2)%>"><h5 class="card-title"><%=rs.getString(3)%></h5></a>
                            <p class="card-text clamp-text"><%=rs.getString(4)%></p>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>

        </div>

    </body>
</html>
<%
        } catch (Exception e) {
            out.print(e.getMessage());
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>
