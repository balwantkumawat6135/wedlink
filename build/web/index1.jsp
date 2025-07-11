
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
        String username = "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
        Statement st = cn.createStatement();
        PreparedStatement p5 = cn.prepareStatement("SELECT username FROM user_details where email=?");
        p5.setString(1, email);
        ResultSet r5 = p5.executeQuery();
        if (r5.next()) {
            username = r5.getString(1);
        }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Matrimonial Website</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="jquery-3.7.1.js"></script>
        <script src="code.js?v=10"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <script>
            // Function to toggle sidebar visibility
            function toggleSidebar() {
                var sidebar = document.getElementById('profileSidebar');
                sidebar.classList.toggle('open');
            }
        </script>

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
                right: -300px; /* Hidden by default */
                height: auto;
                background: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
                backdrop-filter: blur(10px);
                box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
                transition: right 0.3s ease;
                z-index: 1050; /* Above other content */
            }

            #profileSidebar.open {
                right: 0; /* Slide in the sidebar */
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
            /* side bar css */
            @media screen and (max-width: 700px) {
                .sidebar {
                    width: 100%;
                    height: auto;
                    position: relative;
                }
                .sidebar a {float: left;}
                div.content {margin-left: 0;}
            }

            @media screen and (max-width: 400px) {
                .sidebar a {
                    text-align: center;
                    float: none;
                }
            }
            .features{
                margin-top:50px;
            }
            .feature{
                margin-top:50px;
                margin-bottom:50px;
            }
            .nav-span{
                color:black;
                text-align:center;
                cursor: pointer;
                font-size: 15px;
            }
            .nav-span i{
                color:black;
                font-size:20px;
                cursor:pointer;
            }
            /* Sidebar styles */
.sidebar {
    position: fixed; /* Fix the sidebar */
    top: 0; /* Align to the top */
    left: 0; /* Align to the left */
    height: 100vh; /* Full viewport height */
    width: 16.666667%; /* Match Bootstrap's col-lg-2 width */
   
    /* Enable scrolling */
    background-color: #f8f9fa; /* Light background color */
    scrollbar-width: none; /* Hide scrollbar for Firefox */
    -ms-overflow-style: none; /* Hide scrollbar for IE and Edge */
    z-index: 1000; /* Ensure it stays above other content */
}

.sidebar::-webkit-scrollbar {
    display: none; /* Hide scrollbar for Chrome, Safari, and Opera */
}

/* Main content styles */
.main-content {
    margin-left: 16.666667%; /* Match the width of the sidebar */
    width: 83.333333%; /* Match Bootstrap's col-lg-10 width */
    overflow-x: hidden; /* Prevent horizontal scrolling */
}

/* Responsive behavior */
@media (max-width: 992px) {
    .sidebar {
        width: 250px; /* Fixed width for smaller screens */
        left: -250px; /* Hide sidebar by default */
        transition: left 0.3s ease; /* Smooth transition */
    }

    .sidebar.open {
        left: 0; /* Show sidebar when toggled */
    }

    .main-content {
        margin-left: 0; /* Remove margin for smaller screens */
        width: 100%; /* Full width for smaller screens */
    }
}

/* Additional styles for demo content */
.sidebar .nav-span {
    color: black;
    text-align: center;
    cursor: pointer;
    font-size: 15px;
}

.sidebar .nav-span i {
    color: black;
    font-size: 20px;
    cursor: pointer;
}

.feature {
    margin-top: 50px;
    margin-bottom: 50px;
}

.card-profile {
    cursor: pointer;
}

.card-profile:hover {
    box-shadow: 5px 6px 6px 2px #e9ecef;
}

        </style>


    </head>
    <body>        
        <div class="sidebar">
                        <div class="row" style="margin-top:50px;">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-8">
                                <img src="profile/<%=username%>.jpg" class="img-fluid card-img-top rounded-circle"><br>
                            </div>
                            <div class="col-lg-2"></div>
                            <div class="col-lg-12" style="text-align:center;"><span style="font-size:20px;"><%=username%></span></div>
                        </div>
                        <div class="features">
                            <div class="feature">
                                <span  class="nav-span" data-toggle="modal"  data-target="#notification" style="cursor:pointer;color:black;"><i class="fa fa-bell px-4" title="Notification" style="color:black;font-size:20px;"></i>Notifacations</span>
                                <div class="modal fade" id="notification">
                                    <div class="modal-dialog modal-dialog-centered modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-body" id="form" style="background-color:#f6f6f6;">
                                                <button type="button" style="color:red" class="close" id="close" data-dismiss="modal">×</button>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-lg-2"></div>
                                                        <div class="col-lg-8">
                                                            <%
                                                                try {


                                                                    PreparedStatement p6 = cn.prepareStatement("SELECT * FROM intrested WHERE to_username=(SELECT username FROM user_details WHERE email=?) AND intrest=0");
                                                                    p6.setString(1, email);
                                                                    ResultSet r6 = p6.executeQuery();
                                                                    int count = 0;
                                                                    while (r6.next()) {
                                                                        count++;
                                                                        String i_email = r6.getString(1);
                                                                        PreparedStatement p7 = cn.prepareStatement("select * from user_details where email=?");
                                                                        p7.setString(1, i_email);
                                                                        ResultSet r7 = p7.executeQuery();
                                                                        if (r7.next()) {
                                                            %>
                                                            <div class="row  my-4">
                                                                <div class="col-lg-4 pid-<%=count%>">
                                                                    <img src="profile/<%=r7.getString(1)%>.jpg" onerror="this.onerror=null; this.src='Image/profile.jpg';" style="width:70px;height:70px;" class="img-fluid float-right">
                                                                </div>
                                                                <div class="col-lg-8 pid-<%=count%>">
                                                                    <h5><%=r7.getString(1)%></h5>
                                                                    <button class="btn btn-outline-warning mt-2 mx-1 w-33" res="0" id="delete" user="<%=username%>" email="<%=i_email%>" pid="<%=count%>"><i class="fa fa-close"></i></button>
                                                                    <button class="btn btn-outline-danger mt-2 mx-1 w-33" id="block" block_email="<%=email%>" user="<%=username%>" email="<%=i_email%>" pid="<%=count%>"><i class="fa fa-ban"></i></button>
                                                                    <button class="btn btn-outline-success mt-2 mx-1 w-33" res="1"  id="conform" user="<%=username%>" email="<%=i_email%>" pid="<%=count%>"><i class="fa fa-check"></i></button>
                                                                </div>
                                                            </div>
                                                            <%
                                                                    }
                                                                }
                                                                if (count == 0) {
                                                            %>
                                                            <div class="text-center">No Notification</div>
                                                            <%                                                }
                                                                } catch (Exception e) {
                                                                    out.print(e.getMessage());
                                                                }
                                                            %>
                                                        </div>
                                                        <div class="col-lg-2"></div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="feature">
                                <span class="nav-span" data-toggle="modal"  data-target="#post_image" ><i class="fa fa-plus px-4" title="Post Iamges" ></i>Upload Image</span>
                                <!-- The Modal -->
                                <div class="modal fade" id="post_image">
                                    <div class="modal-dialog modal-dialog-centered modal-md">
                                        <div class="modal-content">

                                            <!-- Modal Header 
                                            <div class="modal-header bg-light">
                                                <h4 class="modal-title" style="text-align:center">Login</h4>
                                                
                                            </div>  
                                            -->
                                            <!-- Modal body -->
                                            <div class="modal-body" id="form" style="background-color:#f6f6f6;">
                                                <button type="button" style="color:red" class="close" id="close" data-dismiss="modal">×</button>
                                                <div class="card-body">
                                                    <form method="post" enctype="multipart/form-data" action="add_gallery.jsp">
                                                        <input type="file" name="saveFile" class="from-control" required><br><br>
                                                        <button type="submit" class="btn btn-success  px-4">+Add</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="feature">
                                <span class="nav-span" data-toggle="modal"  data-target="#gallery" ><i class="fa fa-image px-4" title="Postd Iamges" ></i>Posted Images</span>
                                <!-- The Modal -->
                                <div class="modal fade" id="gallery">
                                    <div class="modal-dialog modal-dialog-centered modal-lg">
                                        <div class="modal-content">

                                            <!-- Modal Header --> 
                                            <div class="modal-header bg-light">

                                                <h4 class="modal-title" style="text-align:center">Gallery (Posted Images)</h4>
                                                <button type="button" style="color:red" class="close" id="close" data-dismiss="modal">×</button>
                                            </div>  

                                            <!-- Modal body -->
                                            <div class="modal-body" id="form" style="background-color:#f6f6f6;">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <%
                                                            PreparedStatement p17 = cn.prepareStatement("select * from gallery where email=?");
                                                            p17.setString(1, email);
                                                            ResultSet r17 = p17.executeQuery();
                                                            int count1 = 0;
                                                            while (r17.next()) {
                                                                count1++;
                                                        %>
                                                        <div class="col-lg-2 col-md-3 col-sm-6 col-6">
                                                            <img src="Gallery/<%=r17.getInt(1)%>.jpg" class="img-fluid">
                                                        </div>
                                                        <%
                                                            }
                                                            if (count1 == 0) {
                                                                out.print("<h6 class='text-center'>No Images Found</h6>");
                                                            }
                                                        %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                           <div class="feature">
                                <span class="nav-span" onclick="toggleSidebar()" ><i class="fa fa-user px-4" title="Profile" ></i>User Profile</span>
                           </div>
                           <div class="feature">
                                <span class="nav-span " ><i class="fa fa-send px-4" style="color:black;font-size:21px;" title="Messages"></i>   Messages</span>
                           </div>

                        </div>

                    </div>
        <div class="container-fluid" style="width:85%;float:right">
            <div class="row">
                <div class="col-lg-12">
                    <%
                        if (request.getParameter("img_posted") != null && Integer.parseInt(request.getParameter("img_posted")) == 1) {
                    %>
                    <script>
                        toastr.success("Photo Posted");
                    </script>
                    <%          } else if (request.getParameter("success") != null && Integer.parseInt(request.getParameter("success")) == 1) {
                    %>
                    <script>
                        toastr.success("Profie Photo Changed");
                    </script>
                    <%            }

                        if (email != null && session.getAttribute(email) != null) {
                    %>
                    <div class="container-fluid mb-4">
                        <div class="row mt-4">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-2">

                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">
                                <div class="card ">
                                    <div class="card-header bg-light">
                                        <h5 style="text-align:center;">Upload your Movement</h5>
                                    </div>
                                    <input type="file" class="form-control mb-4" style="border:none;">
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-2">

                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mb-4">
                        <div class="row mt-4">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-2 card">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">



                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-8">

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
                    <div class="container-fluid p-4 bg-light">
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
                            <div class="col-md-3 col-lg-2 col-sm-6 col-6 my-4">
                                <div class="card card-profile" id="card">
                                    <img src="profile/<%=rs2.getString(1)%>.jpg" class="card-img-top" alt="Profile Image" data-toggle="modal"  data-target="#view__profile-<%=pcount%>"  onerror="this.onerror=null; this.src='Image/profile.jpg';">
                                    <div class="card-body" id="card-body">
                                        <h5 class="card-title text-center cursor" data-toggle="modal"  data-target="#view__profile-<%=pcount%>">
                                            <%= rs2.getString("fname")%> , <%= age%>
                                        </h5>
                                        <div class="card-text text-center cursor" data-toggle="modal"  data-target="#view__profile-<%=pcount%>">
                                            <%=rs2.getString(9)%>, <%=rs2.getString(11)%>
                                        </div>
                                        <button class="btn btn-outline-dark  float-left form-control my-2" id="interst-btn" pid="<%=rs2.getString(1)%>" email="<%=email%>" >Intersted</button>
                                        <button class="btn btn-outline-dark float-left form-control" data-toggle="modal"  data-target="#view__profile-<%=pcount%>" id="view_profile" >View Profile</button>  
                                        <div class="modal fade" id="view__profile-<%=pcount%>">
                                            <div class="modal-dialog modal-dialog-centered modal-lg">
                                                <div class="modal-content">
                                                    <!-- Modal Header 
                                                    <div class="modal-header bg-light">
                                                        <h4 class="modal-title" style="text-align:center">Login</h4>
                            
                                                    </div> --> 

                                                    <!-- Modal body -->
                                                    <div class="modal-body" id="form" style="background-color:#f6f6f6;">
                                                        <button type="button" style="color:red" class="close" id="close" data-dismiss="modal">×</button>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-lg-1"></div>
                                                                <div class="col-lg-10">
                                                                    <div class="row">
                                                                        <div class="col-lg-4"><img src="profile/<%=rs2.getString(1)%>.jpg" class="card-img-top rounded-circle" alt="Profile Image"  onerror="this.onerror=null; this.src='Image/profile.jpg';"></div>
                                                                        <div class="col-lg-8">
                                                                            <h2><%=rs2.getString(1)%></h2>
                                                                            <table class="table">
                                                                                <tr>
                                                                                    <td><b>Name:</b></td>
                                                                                    <td><%=rs2.getString(2)%> <%=rs2.getString(3)%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><b>Age:</b></td>
                                                                                    <td><%=age%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><b>Gender:</b></td>
                                                                                    <td><%=rs2.getString(6)%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><b>Caste:</b></td>
                                                                                    <td><%=rs2.getString(7)%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><b>Religion:</b></td>
                                                                                    <td><%=rs2.getString(8)%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><b>Occupation:</b></td>
                                                                                    <td><%=rs2.getString(9)%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><b>Address:</b></td>
                                                                                    <td><%=rs2.getString(11)%>, <%=rs2.getString(12)%></td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                        <div class="justify-content-center"><h3><i>Posted Images</i></h3></div>
                                                                        <div class="col-lg-12">
                                                                            <div class="row">
                                                                                <%
                                                                                    ResultSet rs12 = p90.executeQuery();
                                                                                    int flag = 0;
                                                                                    if (rs12.next()) {
                                                                                        flag = rs12.getInt(1);
                                                                                    }
                                                                                    if (flag == 1) {
                                                                                        PreparedStatement ps17 = cn.prepareStatement("select * from gallery where email=?");
                                                                                        ps17.setString(1, rs2.getString(4));
                                                                                        ResultSet rs17 = ps17.executeQuery();
                                                                                        int count17 = 0;
                                                                                        while (r17.next()) {
                                                                                            count17++;
                                                                                %>
                                                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6">
                                                                                    <img src="Gallery/<%=r17.getInt(1)%>.jpg" class="img-fluid">
                                                                                </div>
                                                                                <%
                                                                                        }
                                                                                        if (count17 == 0) {
                                                                                            out.print("<div class='col-lg-12 col-md-12'><h6 class='text-center'>No Images Found</h6></div>");
                                                                                        }
                                                                                    } else {
                                                                                        out.print("<div class='col-lg-12 mt-4' style='text-align:center;'><img src='Image/lock.png' class='img-fluid'></div><div class='col-lg-12 col-md-12 p-4'><h6 class='text-center'>You are Not Connected With Each-other</h6></div>");
                                                                                    }
                                                                                %>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-1"></div>    
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
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


                </div>
            </div>
        </div>



    </body>
</html>
<%
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
