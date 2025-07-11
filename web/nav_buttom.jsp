
<div class="container-fluid fixed-top bg-dark nav_buttom" style="color: white;" >
    <div class="row w-100 font">
        <div class="col-sm-3 col-3 text-center "><a class="navbar-brand" href="index.jsp"><img src="Image/logo.png" style="width:164px;height:30px;"></a></div>
        <div class="col-sm-6 col-6 text-center "></div>
        <%
            if (email != null && session.getAttribute(email) != null) {
        %>
        <div class="col-sm-1 col-1 text-center mx-2 "><a href="notification.jsp"><i class="fa fa-bell info n_icon" ></i></a></div>
        <div class="col-sm-1 col-1 text-center mx-2"><a href="messenger.jsp"><i class="fa fa-send n_icon"></i></a></div>
            <%          
            } else {
            %>
                <span class="nav-link login-btn"  style="cursor:pointer;color:white;">Login</span>
        <%                 
                }
        %>
</div>
</div>
<%
    if (email != null && session.getAttribute(email) != null) {
%>
<div class="container-fluid fixed-bottom bg-dark nav_buttom" style="color:white;">
   <div class="row w-100 font">
        <div class="col-sm-1 col-1 text-center "></div>
        <div class="col-sm-2 col-2 text-center "><a href="index.jsp"><i class="fa fa-home n_icon" style="color:white;" title="Home"></i></a></div>
        <div class="col-sm-2 col-2 text-center "><i class="fa fa-search n_icon"></i></div>
        <div class="col-sm-2 col-2 text-center "><i class="fa fa-plus upload_img n_icon" ></i></div>
        <div class="col-sm-2 col-2 text-center "><i class="fa fa-image p_gallery n_icon" ></i></div>
        <div class="col-sm-2 col-2 text-center ">
                <div class="d-inline-block dropdown">
                           <img  src="profile/<%=username%>.jpg" onerror="this.onerror=null; this.src='Image/profile.jpg';" class="mt-1 mx-2 dropdown-toggle rounded-circle " id="gearDropdown"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 30px; height: 30px; object-fit: cover; cursor: pointer;">
                            <!-- Dropdown menu -->
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gearDropdown">
                                <a class="dropdown-item" href="profile.jsp"><img  src="profile/<%=username%>.jpg" class="rounded-circle mr-2"  onerror="this.onerror=null; this.src='Image/profile.jpg';" style="width: 25px; height: 25px; object-fit: cover;">Profile</a>
                                <a class="dropdown-item logout" style="cursor:pointer" ><i class="fa fa-sign-out mr-2 "></i> Logout</a>
                            </div>
                </div>
        </div>
   </div>
</div>
<%
    }
%>