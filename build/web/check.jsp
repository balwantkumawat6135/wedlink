<%-- 
    Document   : check
    Created on : Jan 22, 2025, 3:00:02 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("email") != null && request.getParameter("email").trim().length() > 0 && request.getParameter("pass") != null && request.getParameter("pass").trim().length() > 0) {
        String email = request.getParameter("email").trim();
        String password = request.getParameter("pass").trim();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
            PreparedStatement ps = cn.prepareStatement("select * from user_details where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getString(5).equals(password)) {
                    Cookie c = new Cookie("login", email);
                    session.setAttribute(email, password);
                    session.setMaxInactiveInterval(3600);
                    c.setMaxAge(3600 * 24 * 365);
                    response.addCookie(c);
                    out.print("success");
                } else {
                    out.print("invalid_password");
                }
            }else{
                out.print("invalid_email");
            }
        } catch (Exception e) {
            out.print(e.getMessage());
        }
    } else {
    }
%>