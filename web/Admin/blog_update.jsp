<%-- 
    Document   : blog_update
    Created on : 07-Jul-2025, 9:05:11 AM
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
        if (request.getParameter("title") != null && request.getParameter("title").trim().length() > 0 && request.getParameter("des") != null && request.getParameter("des").trim().length() > 0 && request.getParameter("code") != null && request.getParameter("code").trim().length() > 0 && request.getParameter("sd") != null && request.getParameter("sd").trim().length() > 0) {
            String title = request.getParameter("title").trim();
            String sd = request.getParameter("sd").trim();
            String des = request.getParameter("des").trim();
            String code=request.getParameter("code").trim();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");  
                Statement st=cn.createStatement();
                PreparedStatement p=cn.prepareStatement("update  blogs set title=?,sdes=? where code=?");
                p.setString(1,title);
                p.setString(2,sd);
                p.setString(3,code);
                if(p.executeUpdate()>0){
                    st.executeUpdate("delete from blog_points where blog_code='"+code+"'");
                    PreparedStatement ps = cn.prepareStatement("insert into blog_points values(?,?)");
                    String[] points = des.split("\n");
                    int flag=0;
                    for (String point : points) {
                        if (!point.trim().isEmpty()) {
                            ps.setString(1, code);
                            ps.setString(2, point);
                            out.println(point);
                            if (ps.executeUpdate() > 0) {
                                flag=1;
                            }
                        }
                    }
                    if(flag==1){
                        response.sendRedirect("blog.jsp?update=1");
                    }
                    else{
                        response.sendRedirect("blog.jsp?again=1");
                    }
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
