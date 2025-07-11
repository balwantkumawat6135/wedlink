<%-- 
    Document   : sidebar
    Created on : Jan 25, 2025, 11:11:53 AM
    Author     : BALWANT
--%>
<div id="profileSidebar">
    <div class="close-btn" onclick="toggleSidebar()">&#10006; Close</div>
    <div class="p-3">
        <h4 style='color:white;text-align:center;' class="mb-4" >Profile </h4>
        <ul class="list-unstyled" style="text-align:center;">
            <%
                PreparedStatement p = cn.prepareStatement("select * from user_details where email=?");
                p.setString(1, email);
                ResultSet r = p.executeQuery();
                if (r.next()) {
            %>
                <img src="profile/<%=r.getString(1)%>.jpg" style="width:100px;height:100px;" onerror="this.onerror=null; this.src='Image/profile.jpg';" class="rounded-circle">
                   <br><b style="color:white;"> <%=r.getString(2)%>  <%=r.getString(3)%></b>
            <% 
                    }
            %>

            <li style='color:white;' class="nav-link" data-toggle="modal"  data-target="#p_upload" ><button class="btn btn-info w-100">Upload Picture</button></li>
            <li style='color:white;cursor:pointer;'  class="mt-4 nav-link"><button class="logout" class="btn btn-primary form-control">Logout<i class="fa fa-sign-out"></i></button> </li>
            <li style='color:white;' class="nav-link" data-toggle="modal"  data-target="#myModal1"><button id="change_pass" class="btn btn-primary w-100">Change Password</button></li>
            <li style='color:white;' class="nav-link" data-toggle="modal"  data-target="#edit_profile"><button id="edit_user" class="btn btn-primary w-100">Edit Profile</button></li>


        </ul>
    </div>
</div>
<!-- The Modal -->


<!-- Edit Profile -->



