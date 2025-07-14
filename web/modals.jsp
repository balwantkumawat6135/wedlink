
<!-- The Modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content">

            <!-- Modal Header 
            <div class="modal-header bg-light">
                <h4 class="modal-title" style="text-align:center">Login</h4>
                
            </div>  
            -->
            <!-- Modal body -->
            <div class="modal-body" id="form" style="background-color:#f6f6f6;">
                <div class="card-body">
                    <button type="button" style="color:red" class="close" id="close" data-dismiss="modal">×</button>
                    <label>Email:</label>
                    <div id="email-msg" style="color:red;"></div>
                    <input type="email" class=" form-control" id="email" name="email" placeholder="Email">
                    <label>Password:</label>
                    <div id="password-msg" style="color:red;"></div>
                    <input type="password" class=" form-control " id="pass" name="pass" placeholder="Password"><br>
                    <button  class="btn btn-dark  form-control"   id="login-btn">Login</button><br><br>
                    <h6>Don't have any account <span style='color:blue;cursor:pointer;' id="Create-Account">Signup</span></h6><br>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Notification modal -->
<!-- The Modal -->
<div class="modal fade" id="notification">
    <div class="modal-dialog modal-dialog-centered modal-lg">
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
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <%
                                String username = "";
                                try {
                                    PreparedStatement p5 = cn.prepareStatement("SELECT username FROM user_details where email=?");
                                    p5.setString(1, email);
                                    ResultSet r5 = p5.executeQuery();
                                    if (r5.next()) {
                                        username = r5.getString(1);
                                        out.print(username);
                                    }
                                    PreparedStatement p6 = cn.prepareStatement("SELECT * FROM intrested WHERE to_username=? AND intrest=0");
                                    p6.setString(1, username);
                                    ResultSet r6 = p6.executeQuery();
                                    int count = 0;
                                    while (r6.next()) {
                                        out.print("4");
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

<!-- photo upload modal -->
<!-- The Modal -->
<div class="modal fade" id="post_image">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">

            <!-- Modal Header 
            <div class="modal-header bg-light">
                <h4 class="modal-title" style="text-align:center">Login</h4>
                
            </div>  
            -->
            <!-- Modal body -->
            <div class="modal-body" id="form" style="background-color:#f6f6f6;">
                <button type="button" style="color:red" class="close"  data-dismiss="modal">×</button>
                <div class="container mt-4">
                    <h2>Crop & Post Your Image</h2>
                    <input type="file" id="inputImage" accept="image/*" class="form-control">
                    <div>
                        <img id="imagePreview">
                    </div>
                    <div class="preview-box">
                        <div class="preview"></div>
                    </div>
                    <button id="cropButton" class="btn btn-primary mt-2">Crop & Upload</button>
                    <div id="croppedImageResult"></div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- Gallery -->
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
                                          <img src="Gallery/<%=r107.getInt(1)%>.jpg" alt="Image 1" />
                                <%
                                    }
                                    if (count11 == 0) {
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
</div>
