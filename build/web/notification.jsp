<%@ page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8" %>
<%
    Cookie c[] = request.getCookies();
    String email = null;
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
            break;
        }
    }
    Random R=new Random();
    int v=Math.abs(R.nextInt()%10);

    if (email != null && session.getAttribute(email) != null) {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
        PreparedStatement p = cn.prepareStatement("SELECT * FROM user_details WHERE email=?");
        p.setString(1, email);
        String username = "";
        ResultSet r = p.executeQuery();
        if (r.next()) {
            username = r.getString("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Wedlink - Notifications</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <script src="jquery-3.7.1.js"></script>
    <script src="code.js?v=<%=v%>"></script>
    <!-- Bootstrap & Font Awesome -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Custom Styles -->
    <style>
        .profile-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 25px;
            transition: transform 0.2s ease;
        }

        .profile-card:hover {
            transform: scale(1.01);
        }

        .profile-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
        }

        .action-btns i {
            font-size: 16px;
        }

        .no-data {
            background: #f8f9fa;
            padding: 50px;
            border-radius: 10px;
            text-align: center;
        }
        .back-btn{
            float:left;
            cursor:pointer;
            font-size:30px;
        }
        .back-btn:hover{
            font-size:32px;
        }
    </style>
</head>
<body>
    
    <div class="container py-5">
        <span class="back-btn" onclick="history.back()"><i class="fa fa-arrow-left mt-2 button"></i></span>
        <h2 class="text-center mb-4">Notifications</h2>
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <%
                    try {
                        PreparedStatement p6 = cn.prepareStatement("SELECT * FROM intrested WHERE to_username=? AND intrest=0");
                        p6.setString(1, username);
                        ResultSet r6 = p6.executeQuery();
                        int count = 0;
                        while (r6.next()) {
                            count++;
                            String i_email = r6.getString("email");
                            PreparedStatement p7 = cn.prepareStatement("SELECT * FROM user_details WHERE email=?");
                            p7.setString(1, i_email);
                            ResultSet r7 = p7.executeQuery();
                            if (r7.next()) {
                %>
                <div class="profile-card" id="profile_<%=count%>">
                    <div class="row align-items-center">
                        <div class="col-md-2 text-center">
                            <img src="profile/<%=r7.getString("email")%>.jpg"
                                 onerror="this.onerror=null; this.src='Image/profile.jpg';"
                                 alt="Profile"
                                 class="profile-img">
                        </div>
                        <div class="col-md-7">
                            <h5 class="mb-1"><%=r7.getString("fname")%> <%=r7.getString("lname")%></h5>
                            <p class="text-muted mb-0"><i class="fa fa-envelope"></i> <%=r7.getString("email")%></p>
                        </div>
                        <div class="col-md-3 text-right action-btns">
                            <a href="view_profile.jsp?id=<%=r7.getString(1)%>"><button class="btn btn-outline-dark btn-sm mx-1" 
                                                title="View Profile" res="1">
                                <i class="fa fa-eye"></i>
                                </button></a>
                            <button class="btn btn-outline-danger btn-sm mx-1" id="delete"
                                    title="Reject" res="0"
                                    user="<%=username%>" email="<%=i_email%>" pid="<%=count%>">
                                <i class="fa fa-times"></i>
                            </button>
                            <button class="btn btn-outline-secondary btn-sm mx-1" id="block"
                                    title="Block" block_email="<%=email%>"
                                    user="<%=username%>" email="<%=i_email%>" pid="<%=count%>">
                                <i class="fa fa-ban"></i>
                            </button>
                            <button class="btn btn-outline-success btn-sm mx-1" id="conform"
                                    title="Accept" res="1"
                                    user="<%=username%>" email="<%=i_email%>" pid="<%=count%>">
                                <i class="fa fa-check"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                        if (count == 0) {
                %>
                <div class="no-data">
                    <h5>No new notifications</h5>
                    <p>We'll let you know when someone shows interest in you!</p>
                </div>
                <%
                        }
                    } catch (Exception e) {
                        out.print("<div class='alert alert-danger'>" + e.getMessage() + "</div>");
                    }
                %>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white mt-5 p-4 text-center">
        <div class="container">
            <p class="mb-0">© 2025 Wedlink. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
<%
        }
    } else {
        response.sendRedirect("index.jsp?no_cookie=1");
    }
%>
