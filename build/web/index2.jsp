<%-- 
    Document   : index
    Created on : Jan 15, 2025, 11:54:49 AM
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
        <title>Matrimonial Website</title>
        <script src="jquery-3.7.1.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="code.js?v=10"></script>
        <link rel="stylesheet" href="f_profile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 

        <style>
            td{
                font-size:20px;
            }
            body {

                min-height: 100vh;
            }
            .overlay {
                background-image: url('Image/cover.jpg');
                background-size: cover;
                background-position: center;
                background-color: rgba(0, 0, 0, 0.5);
                min-height: 100vh;
            }
            .content {
                padding-top: 50px;
            }
            .tagline {
                color: white;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            }
            .form-container {
                background-color: rgba(255, 255, 255, 0.9);
                border-radius: 10px;
                padding: 20px;
            }
            @media (max-width: 768px) {
                .form-group {
                    margin-bottom: 15px;
                }
                #img{
                    padding-bottom: 50px;
                    padding-top: 50px;
                }
            }

            .span-clr{
                color:white;
            }
            .empty{
                border-color:red;
            }

            /* Sidebar styles */
            #profileSidebar {
                position: fixed;
                top: 43px;
                left: -300px; /* Hidden by default */
                height: auto;
                /* background: rgba(0, 0, 0, 0.5);  Semi-transparent black background */
                background-color:black;
                backdrop-filter: blur(10px);
                box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
                transition: right 0.3s ease;
                z-index: 1050; /* Above other content */
            }

            #profileSidebar.open {
                left: 0; /* Slide in the sidebar */
            }

            /* Close button */
            #profileSidebar .close-btn {
                cursor: pointer;
                text-align: right;
                padding: 10px;
            }

            .clamp-text {
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 4;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .parallax {
                /* The image used */


                /* Set a specific height */
                min-height: 500px; 

                /* Create the parallax scrolling effect */
                background-attachment: fixed;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .card-profile:hover{

                box-shadow: 5px 6px 6px 2px #e9ecef;

            }
            .card-profile{
                cursor:pointer;
            }
            /* for all profile card height same*/
            #row {
                display: flex;
                flex-wrap: wrap; /* Ensure it wraps on smaller screens */
            }

            #card {
                display: flex;
                flex-direction: column;
                height: 100%;
            }

            #card-body {
                flex-grow: 1; /* Allow content to stretch and fill space */
            }

            #myVideo {
                min-width: 100%; 
                min-height: 80%;
            }
            @media (max-width: 767.98px) {
                #nav-bar{
                    display:none;
                }
                #nav_buttom{
                    display:inline;
                }
            }
            @media (min-width: 767.98px) {
                .nav_buttom{
                    display:none;
                    font-size:50px;
                }
            }



        </style>


    </head>
    <body>        
        <%
            String nav_style = "";
            String nav_class = "";
            if (email != null && session.getAttribute(email) != null) {
                nav_style = "background-color:black;";
            } else {
                nav_style = "background-color:transparent;";
            }
        %>
        <%@include file="modals.jsp"%>
        <%@include file="nav_buttom.jsp"%>
        <%@include file="nav.jsp"%>
        <%@include file="sidebar.jsp"%>
        <%
            if (request.getParameter("img_posted") != null && Integer.parseInt(request.getParameter("img_posted")) == 1) {
        %>
        <script>
            toastr.success("Image Posted");
        </script>
        <%            }
            if (email != null && session.getAttribute(email) != null) {
        %>
        <div class="container-fluid" style="margin-top:70px;">
            <div class="row mt-4">
                <div class="col-lg-2 col-md-2 col-sm-2 col-2">

                </div>
                <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                    <div class="card ">
                        <div class="card-header bg-light">
                            <h5 style="text-align:center;">Upload your Movement</h5>
                        </div>
                        <form method="post" action="add_gallery.jsp"  enctype="multipart/form-data" >
                            <input type="file" class="form-control mb-4" name="image" style="border:none;">
                            <button type="submit"  class="btn btn-outline-success mx-3 my-2">Upload</button> 
                        </form>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-2">

                </div>
            </div>
        </div>
        <%        } else {
        %>
        <div class="overlay d-flex align-items-center justify-content-center" id="img" style="margin-top:-70px;">
            <div class="container content">
                <div class="text-center mb-5">
                    <h1 class="tagline">Find Your Perfect Match</h1>
                    <p class="lead tagline">Begin your journey to lasting love</p>
                </div>
                <div class="form-container">
                    <div class="form-row">
                        <div class="form-group col-md-4 col-lg-2">
                            <label for="gender">Looking For a</label>
                            <select id="gender" name="gender" class="form-control">
                                <option value="Man">Man</option>
                                <option value="Woman">Woman</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <label for="agefrom">Aged</label>
                            <select id="agefrom" name="agefrom" class="form-control">
                                <% for (int i = 21; i <= 75; i++) {%>
                                <option value="<%= i%>"><%= i%></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <label for="ageto">To</label>
                            <select id="ageto" name="ageto" class="form-control">
                                <% for (int i = 21; i <= 75; i++) {%>
                                <option value="<%= i%>"><%= i%></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <label for="religion">of Religion</label>
                            <select id="religion" name="religion" class="form-control">
                                <option value="Hindu">Hindu</option>
                                <option value="Muslim">Muslim</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4 col-lg-2">
                            <label for="tongue">and Mother Tongue</label>
                            <select id="tongue" name="tongue" class="form-control">
                                <option value="Hindi">Hindi</option>
                                <option value="Urdu">Urdu</option>
                                <option value="Marathi">Marathi</option>
                                <option value="Bagri">Bagri</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4 col-lg-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary btn-block" id="search-btn">Let's Begin</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <div class="container-fluid p-4 bg-light mt-4">
            <%
                if (email != null && session.getAttribute(email) != null) {
            %>
            <h2 class="text-center mb-4 pt-4">Featured Profiles</h2>
            <div class="row py-4" id="row">
                <div class="col-lg-1"></div>
                <%
                    Calendar today = Calendar.getInstance();
                    Calendar birthDate = Calendar.getInstance();
                    ResultSet rs2 = st.executeQuery("SELECT * FROM user_details where email<>'" + email + "' AND email NOT IN(select email from intrested where block_by='" + email + "') ORDER BY RAND() LIMIT 5 ");
                    int pcount = 0;
                    while (rs2.next()) {
                        String user_email = rs2.getString(4);
                        PreparedStatement p90 = cn.prepareStatement("select intrest from intrested where (email=? AND to_username=?) OR (email=? AND to_username=?)");
                        p90.setString(1, email);
                        p90.setString(2, rs2.getString(1));
                        p90.setString(3, user_email);
                        p90.setString(4, username);
                        ResultSet r90 = p90.executeQuery();
                        int pflag = -1;
                        if (r90.next()) {
                            pflag = r90.getInt(1);
                        } else {
                            pcount++;
                            String Sdob = rs2.getString(10);
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
                <div class="col-md-2 col-6 col-sm-6">
                        <div class="product-grid6">
                            <div class="product-image6">
                                <a href="#">
                                    <img class="pic-1 img-fluid" src="profile/<%=rs2.getString(1)%>.jpg" onerror="this.onerror=null; this.src='Image/profile.jpg';"  >
                                </a>
                            </div>
                            <div class="product-content">
                                <h3 class="title"><a><%= rs2.getString("fname")%> <%=rs2.getString("lname")%>,<%=age%></a></h3>
                                <span><%=rs2.getString(9)%>, <%=rs2.getString(11)%></span>
                            </div>
                            <ul class="social">
                                <li><a data-tip="Intrested"  id="interst-btn" pid="<%=rs2.getString(1)%>" email="<%=email%>"><i class="fa fa-plus"></i></a></li>
                                <li><a href="view_profile.jsp?id=<%=rs2.getString(1)%>" data-tip="View Profile"><i class="fa fa-eye profile"></i></a></li>
                            </ul>
                        </div>
                </div>
                <%
                        }
                    } // End while
                %>
                <div class="col-lg-1"></div>
            </div>
            <%
                }
            %>
        </div>
        <div class="parallax " style="background-image: url('Image/paralex1.jpg');"></div>
        <div class="container-fluid">
            <h2 class="text-center mb-4 mt-4 "> Success Stories </h2>
            <div class="row">
                <div class="col-md-2 col-lg-3 col-sm-6 ">
                    <div class="card card-profile">
                        <img src="Image/demo.jpeg" class="img-fluid">
                        <div class="card-body">
                            <h5 class="card-title " style="text-align:center;">Anil & Kavya</h5>
                            <div class="card-text clamp-text">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid bg-light mt-4 p-4">
            <h2 class="text-center mb-5">How It Works</h2>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 col-6 text-center">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class=" fa fa-user-plus fa-3x text-primary"></i>
                    </div>
                    <h5>Create a Profile</h5>
                    <p>Sign up and create your detailed profile to showcase your personality and preferences.</p>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 col-6 text-center">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class="fa fa-search fa-3x text-primary"></i>
                    </div>
                    <h5>Send Matches</h5>
                    <p>Sign up and create your detailed profile to showcase your personality and preferences.</p>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 col-6 text-center">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class=" fa fa-comments-o fa-3x text-primary"></i>
                    </div>
                    <h5>Connect & Chat</h5>
                    <p>Sign up and create your detailed profile to showcase your personality and preferences.</p>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 col-6 text-center">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class=" fa fa-heart-o fa-3x text-primary"></i>
                    </div>
                    <h5>Find Your Soulmate</h5>
                    <p>Sign up and create your detailed profile to showcase your personality and preferences.</p>
                </div>

            </div>
        </div>

        <div class="parallax mt-4" style="background-image: url('Image/paralex.jpg');"></div>
        <section id="blog" class="container my-5">
            <h2 class="text-center mb-4">Relationship Advice & Tips</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="Image/blog.jpg" class="card-img-top" alt="Communication in Relationships">
                        <div class="card-body">
                            <h5 class="card-title">10 Communication Tips for a Strong Relationship</h5>
                            <p class="card-text">Learn how effective communication can strengthen your bond and resolve conflicts.</p>
                            <a href="#" class="btn btn-outline-primary">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="Image/blog.jpg" class="card-img-top" alt="Wedding Planning">
                        <div class="card-body">
                            <h5 class="card-title">The Ultimate Wedding Planning Checklist</h5>
                            <p class="card-text">A comprehensive guide to help you plan your dream wedding without the stress.</p>
                            <a href="#" class="btn btn-outline-primary">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="Image/blog.jpg" class="card-img-top" alt="Date Ideas">
                        <div class="card-body">
                            <h5 class="card-title">50 Creative Date Ideas to Spark Romance</h5>
                            <p class="card-text">Explore unique and fun date ideas to keep your relationship exciting and fresh.</p>
                            <a href="#" class="btn btn-outline-primary">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="#" class="btn btn-primary">View All Articles</a>
            </div>
        </section>
        <!-- Footer -->
        <footer class="bg-dark text-white py-4 mt-4">
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
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
