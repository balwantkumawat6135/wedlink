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

<div class="row" id="msg_row" t_username="<%=t_username%>" style="margin-top:-10px;" f_username="<%=f_username%>">
    <div class="col-lg-3 col-md-3 col-sm-3 col-3">
            <img src="profile/<%=t_username%>.jpg" class="rounded-circle" onerror="this.onerror=null; this.src='Image/profile.jpg';" alt="img" style="width:50px;">
    </div>
    <div class="col-lg-9 col-md-9 col-sm-9 col-9">
        <%
                ResultSet rs13=st.executeQuery("select fname,lname from user_details where username='"+ t_username +"'");
                if(rs13.next()){
                    out.print("<span class='nav-link' >"+rs13.getString(1)+" "+rs13.getString(2)+"</span>");
                }
         %>
    </div> 
    <%
        String style = "";
        while (r.next()) {
            if (r.getString(2).equals(f_username)) {
                style = "a";
            } else {
                style = "b";
            }
    %>
    <div class="col-lg-12 mt-2 msg">
        <span class="<%=style%>"><%=r.getString(4)%></span>
    </div>
    <%
        }
    %>
    <div id="new_msg" class="col-lg-12 mt-2"></div>
</div>


<%
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>  