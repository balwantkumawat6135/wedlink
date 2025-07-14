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
        Statement st = cn.createStatement();
        
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Messenger</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="jquery-3.7.1.js"></script>
        <script src="code.js?v=69"></script>
        <style>
            body {
                background-color: #f5f5f5;
                height: 100vh;
                overflow: hidden;
            }
            
            .messenger-container {
                height: 100vh;
                background: white;
                border-radius: 0;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                overflow: hidden;
            }
            
            /* Contact List Styles */
            .contact-list {
                height: 100vh;
                background: #f8f9fa;
                border-right: 1px solid #dee2e6;
                overflow-y: auto;
                padding: 0;
            }
            
            .contact-list-header {
                background: #c2185b;
                color: white;
                padding: 15px;
                text-align: center;
                font-weight: bold;
                font-size: 1.2rem;
            }
            
            .contact {
                border: none;
                border-radius: 0;
                background: white;
                transition: all 0.2s ease;
                margin: 0;
                padding: 12px 15px;
                border-bottom: 1px solid #f1f1f1;
                cursor: pointer;
            }
            
            .contact:hover, .contact.active {
                background: #ffe4ec;
                border-left: 4px solid #c2185b;
            }
            
            .contact img {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                object-fit: cover;
                border: 2px solid #e0e0e0;
            }
            
            .contact_name {
                font-weight: 600;
                font-size: 1rem;
                color: #333;
                margin-left: 10px;
            }
            
            /* Chat Area Styles */
            .chat-area {
                height: 100vh;
                display: flex;
                flex-direction: column;
                background: white;
            }
            
            .chat-header {
                background: #c2185b;
                color: white;
                padding: 15px 20px;
                display: flex;
                align-items: center;
                border-bottom: 1px solid #dee2e6;
            }
            
            .chat-header img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
                border: 2px solid white;
                margin-right: 15px;
            }
            
            .chat-header .receiver-name {
                font-weight: 600;
                font-size: 1.1rem;
            }
            
            .chat-box {
                flex: 1;
                overflow-y: auto;
                padding: 20px;
                background: #f8f9fa;
            }
            
            .chat-input-area {
                background: white;
                border-top: 1px solid #dee2e6;
                padding: 15px 20px;
                display: flex;
                align-items: center;
                gap: 10px;
            }
            
            .chat-input-area textarea {
                border-radius: 20px;
                resize: none;
                font-size: 0.95rem;
                padding: 10px 15px;
                border: 1px solid #dee2e6;
                background: #f8f9fa;
                flex: 1;
            }
            
            .chat-input-area textarea:focus {
                outline: none;
                border-color: #c2185b;
                box-shadow: 0 0 0 2px rgba(194, 24, 91, 0.1);
            }
            
            .send-btn {
                background: #c2185b;
                color: white;
                border: none;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: background 0.2s;
            }
            
            .send-btn:hover {
                background: #d81b60;
            }
            
            /* Message Styles */
            .a {
                padding: 10px 15px;
                border-radius: 18px;
                float: left;
                width: auto;
                max-width: 60%;
                background-color: #e1f5fe;
                color: #0277bd;
                margin-bottom: 8px;
                clear: both;
            }
            
            .b {
                padding: 10px 15px;
                border-radius: 18px;
                float: right;
                width: auto;
                max-width: 60%;
                background-color: #ffe4ec;
                color: #c2185b;
                margin-bottom: 8px;
                clear: both;
            }
            
            .msg-row:after {
                content: "";
                display: table;
                clear: both;
            }
            
            /* Scrollbar Styles */
            .scrollable::-webkit-scrollbar {
                width: 6px;
            }
            
            .scrollable::-webkit-scrollbar-track {
                background: #f1f1f1;
            }
            
            .scrollable::-webkit-scrollbar-thumb {
                background: #c1c1c1;
                border-radius: 3px;
            }
            
            .scrollable::-webkit-scrollbar-thumb:hover {
                background: #a8a8a8;
            }
            
            /* Mobile Responsive */
            @media (max-width: 768px) {
                .contact-list {
                    height: 50vh;
                }
                .chat-area {
                    height: 50vh;
                }
                .contact img {
                    width: 35px;
                    height: 35px;
                }
                .chat-header img {
                    width: 35px;
                    height: 35px;
                }
            }
            .display-none{
                display:none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid p-0">
            <div class="row no-gutters">
                <!-- Contact List -->
                <div class="col-lg-4 col-md-5 col-sm-12 contact-list">
                    <div class="contact-list-header">
                        <i class="fa fa-comments mr-2"></i>Messages
                    </div>
                    <div class="scrollable">
                        <%
                            String from_username = "";
                            ResultSet rs3 = st.executeQuery("select username from user_details where email='" + email + "'");
                            if (rs3.next()) {
                                from_username = rs3.getString(1);
                            }
                            ResultSet rs = st.executeQuery("SELECT * FROM intrested WHERE (email ='" + email + "' AND intrest = 1) OR (to_username='" + from_username + "' AND intrest = 1)");
                            while (rs.next()) {
                                String user_e = "";
                                if (!(rs.getString(2).equals(from_username))) {
                        %>
                        <div class="contact d-flex align-items-center" to_username="<%=rs.getString(2)%>" from_username="<%=from_username%>">
                            <img src="profile/<%=rs.getString(2)%>.jpg" onerror="this.onerror=null; this.src='Image/profile.jpg';" alt="img">
                            <span class="contact_name"><%=rs.getString(2)%></span>
                        </div>
                        <%
                                } else {
                                    user_e = rs.getString(1);
                                    PreparedStatement ps3 = cn.prepareStatement("select username from user_details where email='" + user_e + "'");
                                    ResultSet rs8 = ps3.executeQuery();
                                    if (rs8.next()) {
                        %>
                        <div class="contact d-flex align-items-center" to_username="<%=rs8.getString(1)%>" from_username="<%=from_username%>">
                            <img src="profile/<%=rs8.getString(1)%>.jpg" onerror="this.onerror=null; this.src='Image/profile.jpg';" alt="img">
                            <span class="contact_name"><%=rs8.getString(1)%></span>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                    </div>
                </div>
                
                <!-- Chat Area -->
                <div class="col-lg-8 col-md-7 col-sm-12 chat-area">
                    <!-- Chat Header -->
                    <div class="chat-header" id="chatHeader">
                        <img src="" id="receiverImg" onerror="this.onerror=null; this.src='Image/profile.jpg';" alt="img">
                        <span class="receiver-name" id="receiverName">Select a contact to start chatting</span>
                    </div>
                    
                    <!-- Chat Messages -->
                    <div class="chat-box scrollable" id="chatBox">
                        <div class="text-center text-muted mt-5">
                            <i class="fa fa-comments fa-3x mb-3"></i>
                            <p>Select a contact from the list to start chatting</p>
                        </div>
                    </div>
                    
                    <!-- Message Input -->
                    <div class="chat-input-area display-none">
                        <textarea class="form-control" rows="1" id="messageInput" placeholder="Type a message..." ></textarea>
                        <button class="send-btn" id="msg-send">
                            <i class="fa fa-send"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>