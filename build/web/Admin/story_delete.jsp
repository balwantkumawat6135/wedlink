<%-- 
    Document   : story_delete
    Created on : 29-Jun-2025, 2:22:05 PM
    Author     : balwant
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = "";
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("admin")) {
            email = c[i].getValue();
        }
    }
    if (email != null && session.getAttribute(email) != null) {
        if (request.getParameter("code") != null && request.getParameter("code").trim().length() > 0) {
            String code=request.getParameter("code").trim();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                
                PreparedStatement p=cn.prepareStatement("delete from success_stories  where code=?");
                p.setString(1,code);
                if(p.executeUpdate()>0){
                    response.sendRedirect("add_story.jsp?delete_sucess=1");
                }
                else{
                     response.sendRedirect("add_story.jsp?again=1");
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }
        } else {
            response.sendRedirect("add_story.jsp?empty=1");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>