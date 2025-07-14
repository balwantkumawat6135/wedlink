<%-- 
    Document   : searched_profile
    Created on : 10-Jul-2025, 10:53:41 AM
    Author     : balwant
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" import="java.sql.*,java.util.*,java.util.Date, java.text.SimpleDateFormat, java.util.Calendar" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = "";
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
        }
    }
    if (email != null && session.getAttribute(email) != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
            String[] users = request.getParameterValues("user");
            ArrayList<String> userList = new ArrayList<>();
            if (users != null) {
                for (String u : users) {
                    if (u != null && !u.trim().isEmpty()) {
                        u = u.trim().replaceAll("^\\[|\\]$", ""); // Remove square brackets from start/end
                        userList.add(u);
                    }
                }
            }

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Searched Profiles</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .profile-card {
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
                transition: transform 0.2s ease;
            }
            .profile-card:hover {
                transform: scale(1.02);
            }
            .profile-img {
                height: 180px;
                object-fit: cover;
                border-radius: 12px 12px 0 0;
            }
            .card-body {
                padding: 1rem;
            }
        </style>
    </head>
    <body>

        <div class="container py-4">
            <%                if (userList.isEmpty()) {
                    out.print("<h2 class='text-center mb-4'>Profiles Not Found</h2>");
                } else {
                    out.print("<h2 class='text-center mb-4'>Recently Searched Profiles</h2>");
                }
            %>

            <div class="row g-4">
                <%
                    PreparedStatement p = cn.prepareStatement("select * from user_details where username=?");
                    for (String u : userList) {
                        p.setString(1, u);
                        ResultSet r = p.executeQuery();
                        if (r.next()) {
                            Calendar today = Calendar.getInstance();
                            Calendar birthDate = Calendar.getInstance();
                            String Sdob = r.getString(10);
                            int age = 0;
                            if (Sdob != null && !Sdob.trim().isEmpty()) {
                                try {
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Ensure correct format
                                    Date dob = sdf.parse(Sdob);
                                    birthDate.setTime(dob);
                                    // Calculate age
                                    age = today.get(Calendar.YEAR) - birthDate.get(Calendar.YEAR);
                                    // Adjust if the birthday hasn’t occurred this year
                                    if (today.get(Calendar.DAY_OF_YEAR) < birthDate.get(Calendar.DAY_OF_YEAR)) {
                                        age--;
                                    }
                                } catch (Exception e) {
                                    out.println("<p style='color:red;'>Error parsing date: " + Sdob + "</p>");
                                }
                            }
                %>
                <!-- Profile Card 1 -->
                <div class="col-md-4">
                    <div class="card profile-card">
                        <a href="view_profile.jsp?id=<%=r.getString(1)%>"><img src="Profile/<%=r.getString(2)%>.jpg" class="card-img-top profile-img" onerror="this.onerror=null; this.src='Image/profile.jpg';" alt="Profile Image"></a>
                        <div class="card-body">
                            <a href="view_profile.jsp?id=<%=r.getString(1)%>"><h5 class="card-title"><%=r.getString(2)%>  <%=r.getString(3)%>, <%=age%></h5></a>
                            <p class="card-text"><strong>Location:</strong><%=r.getString(11)%> ,<%=r.getString(12)%></p>
                            <p class="card-text"><strong>Occupation:</strong><%=r.getString(9)%>, <%=r.getString(8)%></p>
                        </div>
                    </div>
                </div>   
                <%
                        }
                    }
                %>

            </div>
        </div>

    </body>
</html>
<%  } catch (Exception e) {
            out.print(e.getMessage());
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>

