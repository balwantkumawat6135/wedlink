<%-- 
    Document   : messenger
    Created on : Jan 29, 2025, 6:54:21 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = "";
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
        }
    }
    if (email != null && session.getAttribute(email) != null) {
        // Fetch messages from the database
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
        Statement st=cn.createStatement();
        
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- TOASTER LINK -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="jquery-3.7.1.js"></script>
        <script src="code.js?v=15"></script>
        <style>
            /* Basic styles for chat */
            .chat-box {
                width: 500px;
                height: 550px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                padding: 10px;
            }
            .chat-input {
                width: 660px;
                height: 50px;
            }
            
            .contact:hover{
                box-shadow: 5px 6px 6px 2px #e9ecef;
                background-color:#B6B6B6;
                cursor: pointer;
            }
            .message {
            border-radius: 10px;
            padding: 10px 15px;
            margin-bottom: 10px;
         
            
            max-width: 70%;
        }

        .a{
            padding:10px;
            border-radius:15px;
            float:left;
             width: auto;
            max-width: 45%;
            background-color:#73E88A;
        }
        .b{
            padding:10px;
            border-radius:15px;
            float:right;
            width: auto;
            max-width: 45%;
            background-color:#E1EAE2;
        }
        .nav-item span{
            color:white;
            cursor:pointer;
            font-size:25px;
            margin-left:15px;
            margin-top:-15px;   
        }
        /* for scroll and removes scroll bar*/
                    /* Hide scrollbar but still make the div scrollable */
            .scrollable {
                overflow: hidden; /* Hide the scrollbar */
                -ms-overflow-style: none; /* For Internet Explorer */
                scrollbar-width: none; /* For Firefox */
            }

            .scrollable::-webkit-scrollbar {
                display: none; /* Hide scrollbar in WebKit browsers (Chrome, Safari) */
            }

            .scrollable {
                overflow-y: scroll; /* Enable vertical scroll */
            }
            .contact_name{
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-weight: bold;
                font-size: 20px; /* Similar to WhatsApp header text size */
                margin-left:10px;
            }
            /* profile sidebar css*/
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


            
        </style>
    </head>
    <body>
        <%
            String nav_style="";
            String nav_class="";
            if(email!=null && session.getAttribute(email)!=null){
                nav_style="background-color:black;";
            }else{
                nav_style="background-color:transparent;";
            }
        %>  
        <div class="container-fluid" style="margin-top:70px;">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-12 scrollable" >
                    <div class="row">
                    
                    <%
                        String from_username="";
                        ResultSet rs3=st.executeQuery("select username from user_details where email='"+ email +"'");
                        if(rs3.next()){
                            from_username=rs3.getString(1);
                        }
                        ResultSet rs=st.executeQuery("SELECT * FROM intrested WHERE (email ='"+email+"' AND intrest = 1) OR (to_username='"+from_username+"' AND intrest = 1)");
                        while(rs.next()){
                            String user_e="";
                            if(!(rs.getString(2).equals(from_username))){
                     %>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12"></div>
                   <div class="col-lg-12 col-md-12 col-sm-12 col-12 card contact m-1" to_username="<%=rs.getString(2)%>" from_username="<%=from_username%>">
                       <div class="row">
                           <div class="col-lg-3 col-md-3 col-sm-3 col-3"><img src="profile/<%=rs.getString(2)%>.jpg" class="rounded-circle mx-4 my-2"  onerror="this.onerror=null; this.src='Image/profile.jpg';" style="width:50px;" ></div>
                           <div class="col-lg-9 col-md-9 col-sm-9 col-9"><span class="contact_name"><%=rs.getString(2)%><span></div>
                       </div>
                   </div>
                     <%
                            }
                            else{
                                user_e=rs.getString(1);
                                PreparedStatement ps3=cn.prepareStatement("select username from user_details where email='"+ user_e +"'");
                                ResultSet rs8=ps3.executeQuery();
                                if(rs8.next()){
                       %>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12"></div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12 card contact m-1" to_username="<%=rs8.getString(1)%>" from_username="<%=from_username%>">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-3"><img src="profile/<%=rs8.getString(1)%>.jpg" class="rounded-circle mx-4 my-2"  onerror="this.onerror=null; this.src='Image/profile.jpg';" style="width:50px;" ></div>
                                        <div class="col-lg-9 col-md-9 col-sm-9 col-9"><span  class="contact_name"><%=rs8.getString(1)%><span></div>
                                    </div>
                                </div>
                       <%
                                }
                            }
                        }
                    %>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-12 col-12" >
                    <div class="chat-box w-100 scrollable" id="chatBox" >
                        
                    </div>
                    <div class="row">
                        <div class="col-lg-11 col-md-11 col-sm-11 col-11"><textarea class="form-control w-90" rows="1" style="border-radius:20px;" id="messageInput"></textarea></div>
                        <div class="col-lg-1 col-md-1 col-sm-1 col-1"><i  class="fa fa-send w-100" style="font-size:25px;margin-top:6px;" id="msg-send" ></i></div>
                        <div class="col-sm-12 col-12 mt-4"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script>
                AOS.init();
    </script>
</html>


<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>