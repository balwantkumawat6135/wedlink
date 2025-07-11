<%-- 
    Document   : nav
    Created on : Jan 15, 2025, 12:28:02 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md navbar-dark " style="<%=nav_style%>" id="nav-bar">
    <%
        if(email!=null && session.getAttribute(email)!=null){
            out.print("<span class='nav-link' onclick='toggleSidebar()' style='color:white;cursor:pointer;'><i class='fa fa-navicon' id='sidebar_btn'></i></span>");
        }
   %>           
    <a class="navbar-brand" href="index.jsp"><img src="Image/logo.png" style="width:164px;height:30px;"></a>
    <button class="navbar-toggler cover-img"  type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse mx-auto" id="collapsibleNavbar">
        <ul class="navbar-nav ml-auto ">
            <div id="toastBox"></div>
            <li class="nav-item active">
                <a class="nav-link px-3" href="index.jsp"><i class="fa fa-home" style="color:white;font-size:25px;" title="Home"></i></a>
            </li>
            <!-- Dropdown -->

            <%
                if (email != null && session.getAttribute(email) != null) {
            %>
            <li class="nav-item" >
                <span class="nav-link"  style="cursor:pointer;color:white;"><a  href="notification.jsp"><i class="fa fa-bell px-3 info" title="Notification" style="color:white;font-size:25px;"></i></a></span>
            </li>
            <li class="nav-item">
                <span class="nav-link"  style="cursor:pointer;color:white;"><i class="fa fa-plus px-3 upload_img"  title="Post Iamges" style="color:white;font-size:25px;"></i></span>
            </li>
            <li class="nav-item">
                <span class="nav-link" style="cursor:pointer;color:white;"><i class="fa fa-image px-3 p_gallery" title="Post Iamges"  style="color:white;font-size:25px;"></i></span>
            </li>
            <li class="nav-item">
                <a class="nav-link px-3" href="messenger.jsp"><i class="fa fa-send" style="color:white;font-size:21px;" title="Messages"></i></a>
            </li>
            
           <li class="nav-item dropdown">
            <div class="d-inline-block">
                       <img  src="profile/<%=username%>.jpg" onerror="this.onerror=null; this.src='Image/profile.jpg';" class="mt-1 mx-2 dropdown-toggle rounded-circle" id="gearDropdown"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 30px; height: 30px; object-fit: cover; cursor: pointer;">
                        <!-- Dropdown menu -->
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gearDropdown">
                            <a class="dropdown-item" href="profile.jsp"><img  src="profile/<%=username%>.jpg" class="rounded-circle mr-2"  onerror="this.onerror=null; this.src='Image/profile.jpg';" style="width: 25px; height: 25px; object-fit: cover;">Profile</a>
                            <a class="dropdown-item logout" style="cursor:pointer" ><i class="fa fa-sign-out mr-2 "></i> Logout</a>
                        </div>
            </div>
        </li>


            <%                    } else {
            %>
            <li class="nav-item">
                <span class="nav-link login-btn"  style="cursor:pointer;color:white;">Login</span>
            </li>
            <%                        }
            %>
        </ul>

    </div>  
</nav>