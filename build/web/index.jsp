<%-- 
    Document   : index
    Created on : Jan 15, 2025, 11:54:49 AM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*,java.util.Date, java.text.SimpleDateFormat, java.util.Calendar" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = null;
    if (c != null) {
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("login")) {
                email = c[i].getValue();
                break;
            }
        }
    }
    Random r = new Random();
    int v = Math.abs(r.nextInt() % 100);

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
        <script src="code.js?v=<%=v%>"></script>
        <link rel="stylesheet" href="f_profile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css" rel="stylesheet">

        <style>
            h1,h2,h3,h4,h5,h6{
                font-weight:900;
            }
            td{
                font-size:20px;
            }
            .n_icon{
                font-size:24px;
                margin-top:6px;
                color:white;
            }
            .n_icon:hover{
                color:blue;
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
                background-attachment: fixed;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                overflow: hidden;
            }

            .parallax::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.4);
            }

            .parallax-content {
                position: relative;
                z-index: 2;
                text-align: center;
                color: white;
                padding: 0 20px;
                max-width: 800px;
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
            .htitle{
                font-weight:900;
                font-size: xxx-large;
            }
            @media (max-width: 767.98px) {
                #nav-bar{
                    display:none;
                }
                #nav_buttom{
                    display:inline;
                }
                .bg-light p{
                    font-size: 25px;
                }
                .bg-light h5{
                    font-size: 30px;
                    font-weight:900;
                }
                .label {
                    font-weight: bold;
                    padding-left: 8px;
                    padding-right: 8px;
                    font-size: 25px;
                }
                .l-text{
                    padding-left: 8px;
                    padding-right: 8px;
                    font-size: 25px;
                }
            }
            @media (min-width: 767.98px) {
                .nav_buttom{
                    display:none;
                    font-size:50px;
                }
                .bg-light p{
                    font-size: 30px;
                }
                .bg-light h5{
                    font-size: 35px;
                    font-weight:900;
                }
                .label {
                    font-weight: bold;
                    padding-left: 8px;
                    padding-right: 8px;
                    font-size: 30px;
                }
                .l-text{
                    padding-left: 8px;
                    padding-right: 8px;
                    font-size: 30px;
                }
            }
            .overlay-text {
                background: transparent;
                backdrop-filter: blur(8px);
                padding: 20px 40px;
                border-radius: 15px;
                color:white;
                font-size:55px;
                font-weight:900;
            }
            h1, h2, h3 {
                font-family: 'Playfair Display', serif;
            }
            .badge-icon {
                font-size: 1.5rem;
            }
            .tb{
                padding: 20px;
                font-size: 40px;
            }
            a{
                color:black;
            }
            a:hover{
                color:black;
                text-decoration:none;
            }
            /* Crop Image Css */
            #imagePreview {
                max-width: 100%;
                display: none;
                margin-top: 10px;
            }
            .preview-box {
                margin-top: 10px;
                width: 100px;
                height: 100px;
                overflow: hidden;
                border: 1px solid #ccc;
            }
            #croppedImageResult {
                margin-top: 20px;
            }

            /*END*/

            /*Gallery Grid Css*/
            .gallery {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 15px;
            }

            .gallery img {
                width: 100%;
                height: auto;
                display: block;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }

            .gallery img:hover {
                transform: scale(1.05);
            }
            /*END*/
            /* for success story title */
            .s_name{
                font-weight:900;
                font-size: 30px;
            }
        </style>
        <script>

            $(document).ready(function () {
                function adjustProfileLayout() {
                    if ($(window).width() < 800) {
                        // For small screens
                        $("#row").addClass("align-items-center");
                        $("#col-12").addClass("d-flex justify-content-center mt-2");
                    } else {
                        $("#row").removeClass("align-items-center");
                        $("#col-12").removeClass("d-flex justify-content-center mt-2");
                    }
                }

                // Initial call
                adjustProfileLayout();

                // Call on resize
                $(window).resize(function () {
                    adjustProfileLayout();
                });
            });
        </script>



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
        <%            if (request.getParameter("img_posted") != null && Integer.parseInt(request.getParameter("img_posted")) == 1) {
        %>
        <script>
            toastr.success("Image Posted");
        </script>
        <%            }
            if (email != null && session.getAttribute(email) != null) {
        %>
        <div class="container-fluid" style="margin-top:70px;">
            <div class="row mt-4">
                <div class="col-lg-1 col-md-1 d-none d-md-block">

                </div>
                <div class="col-lg-7 col-md-7 col-sm-12 col-12">
                    <div class="bg-light">
                        <div class="row " id="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12"><h1 style="text-align:center;"><%=username%></h1><br></div>
                            <div class="col-lg-3 col-md-3 col-sm-12 col-12 " id="col-12">
                                <img src="profile/<%=username%>.jpg" class="img-fluid rounded-circle mx-auto text-center" onerror="this.onerror=null; this.src='Image/profile.jpg';" >
                            </div>
                            <div class="col-lg-9 col-md-9 col-sm-12 col-12">
                                <%
                                    PreparedStatement u = cn.prepareStatement("select * from user_details where username=?");
                                    u.setString(1, username);
                                    ResultSet ur = u.executeQuery();
                                    if (ur.next()) {
                                %>
                                <div class="p-3 shadow-sm">
                                    <div class="row mb-2">
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-5 font-weight-bold text-right label">Name:</div>
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-7 text-left l-text"><%=ur.getString(2)%> <%=ur.getString(3)%></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-5 font-weight-bold text-right label">Gender:</div>
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-7 text-left l-text"><%=ur.getString(6)%></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-5 font-weight-bold text-right label">Caste:</div>
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-7 text-left l-text"><%=ur.getString(7)%></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-5 font-weight-bold text-right label">Religion:</div>
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-7 text-left l-text"><%=ur.getString(8)%></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-5 font-weight-bold text-right label">Occupation:</div>
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-7 text-left l-text"><%=ur.getString(9)%></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-5 font-weight-bold text-right label">City:</div>
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-7 text-left l-text"><%=ur.getString(13)%></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-5 font-weight-bold text-right label">Country:</div>
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-7 text-left l-text"><%=ur.getString(11)%></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-5 font-weight-bold text-right label">Email:</div>
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-7 text-left l-text"><%=ur.getString(4)%></div>
                                    </div>
                                </div>

                                <%
                                    }
                                %>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="form-row">
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12 ">
                            <h2 style="text-align:center;">Search Your Partner</h2>            
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <label for="gender">Looking For a</label>
                            <select id="gender" name="gender" class="form-control">
                                <option value="Male">Man</option>
                                <option value="Female">Woman</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <label for="agefrom">Aged</label>
                            <select id="agefrom" name="agefrom" class="form-control">
                                <% for (int i = 21; i <= 75; i++) {%>
                                <option value="<%= i%>"><%= i%></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <label for="ageto">To</label>
                            <select id="ageto" name="ageto" class="form-control">
                                <% for (int i = 21; i <= 75; i++) {%>
                                <option value="<%= i%>"><%= i%></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <label for="religion">of Religion</label>
                            <select id="religion" name="religion" class="form-control">
                                <option value="Hindu">Hindu</option>
                                <option value="Muslim">Muslim</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
                            <label for="tongue">and Mother Tongue</label>
                            <select id="tongue" name="tongue" class="form-control">
                                <option value="Hindi">Hindi</option>
                                <option value="Urdu">Urdu</option>
                                <option value="Marathi">Marathi</option>
                                <option value="Bagri">Bagri</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-12 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary btn-block" email="<%=email%>" id="search-btn">Let's Begin</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%        } else {
        %>
        <div class="overlay d-flex align-items-center justify-content-center" id="img" style="margin-top:-70px;">
            <div class="container content"  >
                <div class="text-center mb-5">
                    <h1 class="tagline">Find Your Perfect Match</h1>
                    <p class="lead tagline">Begin your journey to lasting love</p>
                </div>
                <div class="form-container">
                    <div class="form-row">
                        <div class="form-group col-md-4 col-lg-2">
                            <label for="gender">Looking For a</label>
                            <select id="gender" name="gender" class="form-control">
                                <option value="Male">Man</option>
                                <option value="Female">Woman</option>
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
                            <button type="submit" class="btn btn-primary btn-block" email="<%=email%>" id="search-btn">Let's Begin</button>
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
                <div class="col-md-2 col-6 col-sm-6" id="profile-<%=pcount%>" >
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
                            <li><a data-tip="Intrested"  id="interst-btn" sn="<%=pcount%>" pid="<%=rs2.getString(1)%>" email="<%=email%>"><i class="fa fa-plus"></i></a></li>
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
        <div class="parallax  mt-4 " style="background-image: url('Image/paralex1.jpg');">
            <div class="parallax-content">
                <h1 class="overlay-text" > Distinction in Every Scroll </h1>
            </div>

        </div>
        <div class="container-fluid">
            <h2 class="text-center mb-4 mt-4 "> Success Stories </h2>
            <div class="row">
                <%
                    PreparedStatement psa = cn.prepareStatement("select * from success_stories order by RAND() limit 0,4");
                    ResultSet rsa = psa.executeQuery();
                    String i_code = "";
                    while (rsa.next()) {
                        i_code = rsa.getString(2);
                %>
                <div class="col-md-2 col-lg-3 col-sm-6 d-flex mt-4">
                    <div class="card card-profile w-100 h-100">
                        <a href="success_story.jsp?code=<%=i_code%>"><img src="Admin/Story/<%=i_code%>.jpg" class="img-fluid" alt="Profile of Anil & Kavya"></a>
                        <div class="card-body">
                            <a href="success_story.jsp?code=<%=i_code%>"><h5 class="card-title s_name text-center"><%=rsa.getString(3)%></h5></a>
                            <div class="card-text clamp-text">
                                <%=rsa.getString(4)%>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div><br>
        <div class="text-center my-4" data-aos="fade-up">
                <a href="all_success_stories.jsp" class="btn btn-primary">View All Stories</a>
            </div>
        <div class="container-fluid bg-light mt-4 p-4">
            <h2 class="text-center mb-5">How It Works</h2>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-12 text-center" data-aos="fade-up-left">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class=" fa fa-user-plus fa-3x text-primary"></i>
                    </div>
                    <h5>Create a Profile</h5>
                    <p>Sign up and create your detailed profile to showcase your personality and preferences.</p>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-12 col-12 text-center" data-aos="fade-up-left">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class="fa fa-search fa-3x text-primary"></i>
                    </div>
                    <h5>Send Matches</h5>
                    <p>Sign up and create your detailed profile to showcase your personality and preferences.</p>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-12 col-12 text-center" data-aos="fade-up-right">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class=" fa fa-comments-o fa-3x text-primary"></i>
                    </div>
                    <h5>Connect & Chat</h5>
                    <p>Sign up and create your detailed profile to showcase your personality and preferences.</p>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-12 col-12 text-center" data-aos="fade-up-right">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class=" fa fa-heart-o fa-3x text-primary"></i>
                    </div>
                    <h5>Find Your Soulmate</h5>
                    <p>Sign up and create your detailed profile to showcase your personality and preferences.</p>
                </div>

            </div>
        </div>

        <div class="parallax " style="background-image: url('Image/paralex.jpg');">
            <div class="parallax-content">
                <h1> <i class="fa fa-heart" style="color:red;"></i></h1>
                <h1 class="overlay-text" > let each scroll unfold your regal legacy.</h1>

            </div>

        </div>
        <div class="container-fluid  mt-4 p-4">
            <h2 class="text-center mb-5">Built on Trust</h2>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-12 text-center" data-aos="fade-up-left">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class="fa-3x text-primary">✅</i>
                    </div>
                    <h5>All profiles manually verified</h5>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 col-12 text-center" data-aos="fade-up-left">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class=" fa-3x text-primary">🔐</i>
                    </div>
                    <h5>Encrypted Chats</h5>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 col-12 text-center" data-aos="fade-up-right">
                    <div class="bg-white rounded-circle p-4 d-inline-block mb-3">
                        <i class="fa-3x text-primary">🌈</i>
                    </div>
                    <h5>Inclusive of all traditions</h5>
                </div>
            </div>
        </div>

        <section id="blog" class="container-fluid my-5">
            <h2 class="text-center mb-4">Relationship Advice & Tips</h2>
            <div class="row">
                <%
                PreparedStatement pt=cn.prepareStatement("select * from blogs");
                ResultSet rt=pt.executeQuery();
                while(rt.next()){
                %>
                <div class="col-md-3 mb-4" data-aos="fade-up">
                    <div class="card">
                        <img src="Admin/Blog/<%=rt.getString(2)%>.jpg" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title"><%=rt.getString(3)%></h5>
                            <p class="card-text"><%=rt.getString(4)%></p>
                            <a href="blog.jsp?code=<%=rt.getString(2)%>" class="btn btn-outline-primary">Read More</a>
                        </div>
                    </div>
                </div>
              <%
                  }
              %>
            </div>
            <div class="text-center mt-4" data-aos="fade-up">
                <a href="blogs.jsp" class="btn btn-primary">View All Articles</a>
            </div>
        </section>
        <!-- Footer -->
        <footer class="bg-dark text-white py-4 mt-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>About Wedlink</h5>
                        <p>Connecting hearts, one match at a time.</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Quick Links</h5>
                        <ul class="list-unstyled">
                            <li><a href="about_us.jsp" class="text-white">About Us</a></li>
                            <li><a href="privacy_policy.jsp" class="text-white">Privacy Policy</a></li>
                            <li><a href="terms_of_service.jsp" class="text-white">Terms of Service</a></li>
                            <li><a href="contact_us.jsp" class="text-white">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Follow Us</h5>
                        <a href="https://facebook.com/wedlink" target="_blank" class="text-white mr-3" title="Follow us on Facebook">
                            <i class="fa fa-facebook-f fa-lg"></i>
                        </a>
                        <a href="https://twitter.com/wedlink" target="_blank" class="text-white mr-3" title="Follow us on Twitter">
                            <i class="fa fa-twitter fa-lg"></i>
                        </a>
                        <a href="https://instagram.com/wedlink" target="_blank" class="text-white mr-3" title="Follow us on Instagram">
                            <i class="fa fa-instagram fa-lg"></i>
                        </a>
                        <a href="https://linkedin.com/company/wedlink" target="_blank" class="text-white" title="Follow us on LinkedIn">
                            <i class="fa fa-linkedin fa-lg"></i>
                        </a>
                    </div>
                </div>
                <hr class="bg-light">
                <div class="text-center">
                    <p>&copy; 2025 Wedlink. All rights reserved.</p>
                </div>
            </div>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.js"></script>
        <script>
            let cropper;
            const inputImage = document.getElementById('inputImage');
            const imagePreview = document.getElementById('imagePreview');
            const result = document.getElementById('croppedImageResult');

            inputImage.addEventListener('change', (e) => {
                const file = e.target.files[0];
                if (!file)
                    return;

                const reader = new FileReader();
                reader.onload = () => {
                    imagePreview.src = reader.result;
                    imagePreview.style.display = 'block';
                    if (cropper)
                        cropper.destroy();
                    cropper = new Cropper(imagePreview, {
                        aspectRatio: 1,
                        viewMode: 1,
                        preview: '.preview'
                    });
                };
                reader.readAsDataURL(file);
            });

            document.getElementById('cropButton').addEventListener('click', () => {
                if (cropper) {
                    const canvas = cropper.getCroppedCanvas({
                        width: 200,
                        height: 200
                    });

                    result.innerHTML = "<h4>Cropped Preview:</h4>";
                    result.appendChild(canvas);

                    canvas.toBlob((blob) => {
                        const formData = new FormData();
                        formData.append('croppedImage', blob, 'profile.jpg');

                        fetch('add_gallery.jsp', {
                            method: 'POST',
                            body: formData
                        }).then(response => {
                            if (response.ok) {
                                alert('Upload successful');
                                location.reload();
                            } else {
                                throw new Error('Upload failed');
                            }
                        }).catch(() => {
                            alert('Upload failed');
                        });
                    }, 'image/jpeg');
                }
            });
        </script>

    </body>

</html>
<%
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
