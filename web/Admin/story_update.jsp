<%-- 
    Document   : story_update
    Created on : 29-Jun-2025, 2:08:49 PM
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
        if (request.getParameter("title") != null && request.getParameter("title").trim().length() > 0 && request.getParameter("des") != null && request.getParameter("des").trim().length() > 0 && request.getParameter("code") != null && request.getParameter("code").trim().length() > 0) {
            String title = request.getParameter("title").trim();
            String des = request.getParameter("des").trim();
            String code=request.getParameter("code").trim();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                
                PreparedStatement p=cn.prepareStatement("update  success_stories set title=?,des=? where code=?");
                p.setString(1,title);
                p.setString(2,des);
                p.setString(3,code);
                if(p.executeUpdate()>0){
                    response.sendRedirect("add_story.jsp?update_sucess=1");
                }
                else{
                     response.sendRedirect("add_story.jsp?again=1");
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }
        } else {
            response.sendRedirect("story_edit.jsp?empty=1");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>