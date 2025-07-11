<%-- 
    Document   : view_profile
    Created on : Mar 27, 2025, 10:58:29 AM
    Author     : BALWANT
--%>


<%@page contentType="text/html" import="java.sql.*,java.util.Date, java.text.SimpleDateFormat, java.util.Calendar" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = null;
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
            break;
        }
    }
    if (email != null && session.getAttribute(email) != null) {
        String user = "";
        if (request.getParameter("id") != null && request.getParameter("id").trim().length() > 0) {
            user = request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
            Statement st = cn.createStatement();
            ResultSet r = st.executeQuery("select * from user_details where username='" + user + "'");
            String[] a = new String[13];
            if (r.next()) {
                for (int i = 0; i < 13; i++) {
                    a[i] = r.getString(i + 1);
                }
            }
            Calendar today = Calendar.getInstance();
            Calendar birthDate = Calendar.getInstance();
            String Sdob = a[9];
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
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Wedlink</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jquery-3.7.1.js"></script>
        <!-- Toaster links -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 

        <style>
            .button{
                font-size:30px;
                color:black;
            }
            .button:hover{
                font-size:35px;
                color:blue;
                cursor:pointer;
            }
            
            
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row" style="margin-top:50px;">
                <div class="col-lg-1 col-md-2 "></div>
                <div class="col-lg-10 col-md-8 col-sm-12 col-12 card bg-light">
                    <div class="row  mt-4 mx-3">
                        <div class="col-lg-12">
                            <span style="float:left" onclick="history.back()"><i class="fa fa-arrow-left mt-2 button"></i></span>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                            <h4 style="text-align:center;"><%=user%></h4>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-3">
                            <img src="profile/<%=user%>.jpg"  onerror="this.onerror=null; this.src='Image/profile.jpg';" style="width:120px;" class=" rounded-circle">
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-9">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-6">
                                    <p>Posted Images</p>
                                    <%
                                        PreparedStatement pi = cn.prepareStatement("select count(*) from gallery where email=?");
                                        pi.setString(1, a[3]);
                                        ResultSet ri = pi.executeQuery();
                                        int count = 0;
                                        if (ri.next()) {
                                            count = ri.getInt(1);
                                        }

                                    %>
                                    <sapn><%=count%></sapn>   
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-6">
                                    <p>Connections</p>
                                    <%
                                        PreparedStatement p6 = cn.prepareStatement("SELECT count(*) FROM intrested WHERE (to_username=? AND intrest=1) OR (email=? AND intrest=1)");
                                        p6.setString(1, user);
                                        p6.setString(2, a[3]);
                                        ResultSet r6 = p6.executeQuery();
                                        int c_count = 0;
                                        if (r6.next()) {
                                            c_count = r6.getInt(1);
                                        }
                                    %>
                                    <sapn><%=c_count%></sapn>   
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 mt-4">
                                    <table class="table table-borderless">
                                        <tr>
                                            <td><b>Name:</b></td>
                                            <td><%=a[1]%> <%=a[2]%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Age:</b></td>
                                            <td><%=age%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Gender:</b></td>
                                            <td><%=a[5]%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Caste:</b></td>
                                            <td><%=a[6]%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Religion:</b></td>
                                            <td><%=a[7]%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Occupation:</b></td>
                                            <td><%=a[8]%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Address:</b></td>
                                            <td><%=a[10]%>, <%=a[11]%></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12 mt-4"><h3 style="text-align:center;"><i>Posted Images</i></h3></div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="row">
                                <%
                                    PreparedStatement p90 = cn.prepareStatement("select intrest from intrested where (email=? AND to_username=?) OR (email=? AND to_username IN(select username from user_details where email=?))");
                                    p90.setString(1, email);
                                    p90.setString(2, user);
                                    p90.setString(3, a[3]);
                                    p90.setString(4, email);
                                    ResultSet r1 = p90.executeQuery();
                                    int flag = 0;
                                    if (r1.next()) {
                                        flag = r1.getInt(1);
                                    }
                                    if (flag == 1) {
                                        PreparedStatement p107 = cn.prepareStatement("select * from gallery where email=?");
                                        p107.setString(1, a[3]);
                                        ResultSet r107 = p107.executeQuery();
                                        int count11 = 0;
                                        while (r107.next()) {
                                            count11++;
                                %>
                                <div class=" col-lg-3 col-md-3 col-sm-6 col-6 my-3">
                                    <img src="Gallery/<%=r107.getInt(1)%>.jpg" class="img-fluid">
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <%
                                if (count11 == 0) {
                                    out.print("<div class='col-lg-12'><h6 class='py-4 my-4' style='text-align:center;'>No Images Found</h6></div>");
                                }
                            } else {
                                out.print("<div class='col-lg-12 mt-4' style='text-align:center;'><img src='Image/lock.png' class='img-fluid'></div><div class='col-lg-12 col-md-12 p-4'><h6 class='text-center'>You are Not Connected With Each-other</h6></div>");
                            }
                        %>
                    </div>
                </div>
                <div class="col-lg-1 col-md-2"></div>
            </div>
        </div>
        <footer class="bg-dark text-white py-4 mt-4 w-100">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>About MatriMingle</h5>
                        <p>Connecting hearts, one match at a time.</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Quick Links</h5>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-white">About Us</a></li>
                            <li><a href="#" class="text-white">Privacy Policy</a></li>
                            <li><a href="#" class="text-white">Terms of Service</a></li>
                            <li><a href="#" class="text-white">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Follow Us</h5>
                        <a href="#" class="text-white mr-2"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-white mr-2"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-white mr-2"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <hr class="bg-light">
                <div class="text-center">
                    <p>&copy; 2025 Wedlink. All rights reserved.</p>
                </div>
            </div>
        </footer>          

    </body>
</html>
<%
        } else {
            response.sendRedirect("index.jsp");
        }
    } else {
        response.sendRedirect("index.jsp?no_cookie=1");
    }
%>


