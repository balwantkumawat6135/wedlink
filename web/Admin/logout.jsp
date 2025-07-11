<%-- 
    Document   : logout
    Created on : Jan 23, 2025, 9:02:25 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Cookie c=new Cookie("admin",null); 
        c.setMaxAge(0);
        response.addCookie(c);
        response.sendRedirect("index.jsp");
        
%>