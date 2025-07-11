<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>All Wedlink Success Stories</title>
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
            <h2 class="section-heading">💖 All Wedlink Success Stories</h2>
            <div class="row">
                <% 
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                        Statement st = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from success_stories order by sn desc");
                        while(rs.next()){
                %>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm h-100">
                        <a href="success_story.jsp?code=<%=rs.getString(2)%>"><img src="Admin/Story/<%=rs.getString(2)%>.jpg" class="card-img-top story-img" alt="<%=rs.getString(3)%>"></a>
                        <div class="card-body">
                            <a href="success_story.jsp?code=<%=rs.getString(2)%>"><h5 class="card-title"><%=rs.getString(3)%></h5></a>
                            <p class="card-text clamp-text"><%=rs.getString(4)%></p>
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
        </div>
    </body>
</html> 