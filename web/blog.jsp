<%-- 
    Document   : blog
    Created on : 09-Jul-2025, 10:18:34 AM
    Author     : balwant
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%
            if (request.getParameter("code") != null && request.getParameter("code").trim().length() > 0) {
                String code = request.getParameter("code");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                    Statement st = cn.createStatement();

        %>

        <title>Matrimony Blog - Wedlink</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 900px;
                margin: auto;
                background-color: #ffffff;
                padding: 30px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                margin-top: 40px;
                margin-bottom: 40px;
                border-radius: 10px;
            }

            h1 {
                font-size: 2rem;
                color: #333;
            }

            p.description {
                font-size: 1.1rem;
                color: #555;
                margin-top: 10px;
            }

            ul.points {
                margin-top: 20px;
                padding-left: 20px;
            }

            ul.points li {
                margin-bottom: 10px;
                color: #444;
            }

            .main-image {
                width: 100%;
                max-height: 350px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .other-blogs {
                margin-top: 40px;
                border-top: 1px solid #ddd;
                padding-top: 20px;
            }

            .other-blogs h3 {
                margin-bottom: 10px;
                color: #333;
            }

            .blog-suggestion {
                display: flex;
                align-items: flex-start;
                margin-bottom: 15px;
                padding: 10px;
                background: #f1f1f1;
                border-radius: 6px;
            }

            .blog-suggestion img {
                width: 60px;
                height: 60px;
                object-fit: cover;
                border-radius: 5px;
                margin-right: 15px;
            }

            .blog-suggestion a {
                text-decoration: none;
                color: #007BFF;
                font-weight: bold;
                font-size: 1rem;
            }

            .blog-suggestion p {
                margin: 5px 0;
                font-size: 0.9rem;
                color: #555;
            }

            @media (max-width: 600px) {
                .container {
                    padding: 20px;
                }
                .blog-suggestion {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .blog-suggestion img {
                    margin-bottom: 10px;
                }
            }
        </style>
    </head>
    <body>

        <div class="container">
            <%      
                ResultSet r = st.executeQuery("select * from blogs where code='"+code+"'");
                if(r.next()){
            %>
            
            <img src="Admin/Blog/<%=r.getString(2)%>.jpg"  class="main-image">

            <h1><%=r.getString(3)%></h1>
            <p class="description">
                <%=r.getString(4)%>
            </p>
            <ul class="points">
            <%
                
                PreparedStatement p=cn.prepareStatement("select * from blog_points where blog_code=?");
                p.setString(1,r.getString(2));
                ResultSet rs=p.executeQuery();
                while(rs.next()){
            %>
                          <li><%=rs.getString(2)%></li>
            <%
                }
                }
            %>
          
            </ul>

            <div class="other-blogs">
                <h3>More Blog Suggestions</h3>
                <%
                    PreparedStatement pt=cn.prepareStatement("select * from blogs");
                    ResultSet rt=pt.executeQuery();
                    while(rt.next()){
                %>    
                        
                
                <div class="blog-suggestion">
                    <img src="Admin/Blog/<%=rt.getString(2)%>.jpg" >
                    <div>
                        <a href="blog.jsp?code=<%=rt.getString(2)%>"><%=rt.getString(3)%></a>
                        <p><%=rt.getString(4)%></p>
                    </div>
                </div>
                <%  
                    }
                %>
            </div>
        </div>

    </body>
    <%
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</html>
