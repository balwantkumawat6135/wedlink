<%-- 
    Document   : msg
    Created on : Feb 14, 2025, 4:42:21 PM
    Author     : BALWANT
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
        Statement st = cn.createStatement();
        String t_username = request.getParameter("to_username");
        String f_username = request.getParameter("from_username");
        PreparedStatement p1 = cn.prepareStatement("select * from message where (to_username=? AND from_username=?) OR (to_username=? AND from_username=?)");
        p1.setString(1, t_username);
        p1.setString(2, f_username);
        p1.setString(3, f_username);
        p1.setString(4, t_username);
        ResultSet r = p1.executeQuery();
%>

<div class="messages-container" id="msg_row" t_username="<%=t_username%>" f_username="<%=f_username%>">
    <%
        String style = "";
        while (r.next()) {
            if (r.getString(2).equals(f_username)) {
                style = "a";
            } else {
                style = "b";
            }
    %>
    <div class="msg-row">
        <span class="<%=style%>"><%=r.getString(4)%></span>
    </div>
    <%
        }
    %>
    <div id="new_msg"></div>
</div>

<style>
    .messages-container {
        padding: 10px 0;
        min-height: 200px;
    }
    
    .msg-row {
        margin-bottom: 8px;
        clear: both;
    }
    
    .msg-row:after {
        content: "";
        display: table;
        clear: both;
    }
    
    .a {
        padding: 10px 15px;
        border-radius: 18px;
        float: left;
        width: auto;
        max-width: 60%;
        background-color: #e1f5fe;
        color: #0277bd;
        margin-bottom: 8px;
        word-wrap: break-word;
        box-shadow: 0 1px 2px rgba(0,0,0,0.1);
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
        word-wrap: break-word;
        box-shadow: 0 1px 2px rgba(0,0,0,0.1);
    }
    
    @media (max-width: 768px) {
        .a, .b {
            max-width: 80%;
        }
    }
</style>

<%
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>  