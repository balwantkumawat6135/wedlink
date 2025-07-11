<%-- 
    Document   : profile
    Created on : Mar 25, 2025, 12:19:54 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
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
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
        PreparedStatement p = cn.prepareStatement("select * from user_details where email=?");
        p.setString(1, email);
        String username = "";
        String name = "";
        ResultSet r = p.executeQuery();
        if (r.next()) {
            username = r.getString(1);
            name = r.getString(2) + " " + r.getString(3);
        }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Profile</title>
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
        <script src="code.js?v=0"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css" rel="stylesheet">
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
        </style>
    </head>
    <body>
        <%
            if (request.getParameter("success") != null && Integer.parseInt(request.getParameter("success")) == 1) {
        %>
        <script>
            toastr.success("Profie Photo Changed");
        </script>
        <%            }
        %>

        <%@include file="profile_modals.jsp" %>
        <div class="container-fluid">
            <h1 style="text-align:center;">Profile</h1>
            <div class="row" style="margin-top:50px;">
                <div class="col-lg-1 col-md-2 "></div>
                <div class="col-lg-10 col-md-8 col-sm-12 col-12 card bg-light">
                    <div class="row  mt-4 mx-3">
                        <div class="col-lg-12">
                            <a href="index.jsp"><span style="float:left"><i class="fa fa-arrow-left mt-2 button"></i></span></a>
                            <div style="float:right">
                                <div class="dropdown d-inline">
                                    <i class="fa fa-gear dropdown-toggle mt-2 gear-icon button" id="gearDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>

                                    <!-- Dropdown menu -->
                                    <div class="dropdown-menu" aria-labelledby="gearDropdown">
                                        <span class="dropdown-item" data-toggle="modal"  data-target="#p_upload" >Change Profile Picture</span>
                                        <span class="dropdown-item" data-toggle="modal"  data-target="#edit_profile" >Edit Profile</span>
                                        <span class="dropdown-item" data-toggle="modal"  data-target="#change_pass" >Change Password</span>
                                        <span class="dropdown-item">Blocked Persons</span>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                            <h4 style="text-align:center;"><%=username%></h4>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-3">
                            <img src="profile/<%=username%>.jpg"  onerror="this.onerror=null; this.src='Image/profile.jpg';" style="width:120px;" class=" rounded-circle">
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-9">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-6">
                                    <p>Posted Images</p>
                                    <%
                                        PreparedStatement pi = cn.prepareStatement("select count(*) from gallery where email=?");
                                        pi.setString(1, email);
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
                                        p6.setString(1, username);
                                        p6.setString(2, email);
                                        ResultSet r6 = p6.executeQuery();
                                        int c_count = 0;
                                        if (r6.next()) {
                                            c_count = r6.getInt(1);
                                        }
                                    %>
                                    <sapn><%=c_count%></sapn>   
                                </div>
                                <div class="col-lg-6 mt-4 col-md-6 col-sm-6 col-6">
                                    <h6><%=name%></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12 mt-4"><h3 style="text-align:center;"><i>Posted Images</i></h3></div>
                        <div class="row ">
                            <div class="col-lg-12">
                                <div class="gallery">
                                    <%
                                PreparedStatement p107 = cn.prepareStatement("select * from gallery where email=?");
                                p107.setString(1, email);
                                ResultSet r107 = p107.executeQuery();
                                int count11 = 0;
                                while (r107.next()) {
                                    count11++;
                            %>
                                    <img src="Gallery/<%=r107.getInt(1)%>.jpg" >
                            <%
                                }
                            %>
                                </div>
                            </div>
                    </div>
                        <%
                            if (count11 == 0) {
                                out.print("<div class='col-lg-12'><h6 class='py-4 my-4' style='text-align:center;'>No Images Found</h6></div>");
                            }
                        %>
                    </div>
                </div>
                <div class="col-lg-1 col-md-2"></div>
            </div>
        </div>
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

                        fetch('upload.jsp', {
                            method: 'POST',
                            body: formData
                        }).then(response => {
                            alert('Upload successful');
                            location.reload();
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
    } else {
        response.sendRedirect("index.jsp?no_cookie=1");
    }
%>


