<%-- 
    Document   : blogs
    Created on : 10-Jul-2025, 4:12:31 PM
    Author     : balwant
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>All Wedlink Blogs</title>
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
            .blog-img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 12px 12px 0 0;
            }
            .card {
                border: none;
                border-radius: 16px;
                overflow: hidden;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                height: 100%;
            }
            .card:hover {
                transform: translateY(-6px);
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
            }
            .card-title {
                font-size: 1.2rem;
                font-weight: 600;
                color: #d81b60;
                margin-bottom: 10px;
            }
            a:hover {
                text-decoration: none;
            }
            .card-text {
                color: #444;
                font-size: 0.95rem;
                line-height: 1.5;
            }
            .section-heading {
                text-align: center;
                margin-bottom: 40px;
                font-size: 2rem;
            }
            .blog-meta {
                font-size: 0.85rem;
                color: #666;
                margin-top: 10px;
            }
            .read-more {
                color: #c2185b;
                font-weight: 600;
                font-size: 0.9rem;
                margin-top: 10px;
                display: inline-block;
            }
            .read-more:hover {
                color: #d81b60;
            }
            @media (max-width: 767px) {
                .blog-img {
                    height: 180px;
                }
                .card-title {
                    font-size: 1.1rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="section-heading">📝 All Wedlink Blogs</h2>
            
            <div class="row">
                <% 
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                        Statement st = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from blogs order by sn desc");
                        while(rs.next()){
                %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card shadow-sm h-100">
                        <a href="blog.jsp?code=<%=rs.getString(2)%>">
                            <img src="Admin/Blog/<%=rs.getString(2)%>.jpg" class="blog-img" alt="<%=rs.getString(3)%>">
                        </a>
                        <div class="card-body d-flex flex-column">
                            <a href="blog.jsp?code=<%=rs.getString(2)%>">
                                <h5 class="card-title"><%=rs.getString(3)%></h5>
                            </a>
                            <p class="card-text flex-grow-1">
                                <% 
                                    String description = rs.getString(4);
                                    if(description.length() > 150) {
                                        out.print(description.substring(0, 150) + "...");
                                    } else {
                                        out.print(description);
                                    }
                                %>
                            </p>
                            <a href="blog.jsp?code=<%=rs.getString(2)%>" class="read-more">
                                Read More →
                            </a>
                        </div>
                    </div>
                </div>
                <% 
                        }
                        rs.close();
                        st.close();
                        cn.close();
                    } catch(Exception e) {
                        out.print("<div class='alert alert-danger'>"+e.getMessage()+"</div>");
                    }
                %>
            </div>
            
            <% 
                // Check if no blogs found
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                    Statement st = cn.createStatement();
                    ResultSet countRs = st.executeQuery("SELECT COUNT(*) as total FROM blogs");
                    if(countRs.next() && countRs.getInt("total") == 0) {
            %>
            <div class="text-center mt-5">
                <div class="alert alert-info">
                    <h4>No Blogs Available</h4>
                    <p>We're working on creating amazing content for you. Check back soon!</p>
                </div>
            </div>
            <%
                    }
                    countRs.close();
                    st.close();
                    cn.close();
                } catch(Exception e) {
                    // Handle exception silently
                }
            %>
        </div>
    </body>
</html>
