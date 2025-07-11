<%-- 
    Document   : story
    Created on : 27-Jun-2025, 9:58:26 PM
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
        if (request.getParameter("title") != null && request.getParameter("title").trim().length() > 0 && request.getParameter("des") != null && request.getParameter("des").trim().length() > 0) {
            String title = request.getParameter("title").trim();
            String des = request.getParameter("des").trim();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select MAX(sn) from success_stories");
                int sn = 0;
                if (rs.next()) {
                    sn = rs.getInt(1);
                }
                sn++;
                LinkedList ls = new LinkedList();
                for (int i = 1; i <= 9; i++) {
                    ls.add(i);
                }
                for (int i = 'a'; i <= 'z'; i++) {
                    ls.add(i);
                }
                for (char i = 'A'; i <= 'Z'; i++) {
                    ls.add(i);
                }

                Collections.shuffle(ls);
                String code = "";
                for (int i = 0; i <= 6; i++) {
                    code += ls.get(i);
                }
                code = code + "_" + sn;
                PreparedStatement p=cn.prepareStatement("insert into success_stories values(?,?,?,?)");
                p.setInt(1,sn);
                p.setString(2,code);
                p.setString(3,title);
                p.setString(4,des);
                if(p.executeUpdate()>0){
                    response.sendRedirect("story_image.jsp?code="+code);
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