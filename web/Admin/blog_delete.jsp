<%-- 
    Document   : blog_delete
    Created on : 07-Jul-2025, 2:49:45 PM
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
                Statement st=cn.createStatement();
                PreparedStatement p=cn.prepareStatement("delete from blogs  where code=?");
                p.setString(1,code);
                if(p.executeUpdate()>0 && st.executeUpdate("delete from blog_points where blog_code='"+code+"'")>0){
                    response.sendRedirect("blog.jsp?delete=1");
                }
                else{
                     response.sendRedirect("blog.jsp?again=1");
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }
        } else {
            response.sendRedirect("blog.jsp?empty=1");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>