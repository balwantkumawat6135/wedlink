<%-- 
    Document   : add_blog
    Created on : 02-Jul-2025, 3:17:18 PM
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
        if (request.getParameter("title") != null && request.getParameter("title").trim().length() > 0 && request.getParameter("des") != null && request.getParameter("des").trim().length() > 0 && request.getParameter("sd") != null && request.getParameter("sd").trim().length() > 0) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                Statement st = cn.createStatement();
                String title = request.getParameter("title");
                String des = request.getParameter("des");
                String sd = request.getParameter("sd");
                ResultSet r = st.executeQuery("select max(sn) from blogs");
                int sn = 0;
                if (r.next()) {
                    sn = r.getInt(1);
                }
                sn++;
                LinkedList l = new LinkedList();
                for (int i = 0; i <= 9; i++) {
                    l.add(i);
                }
                for (char i = 'A'; i < 'Z'; i++) {
                    l.add(i);
                }
                for (char i = 'a'; i < 'z'; i++) {
                    l.add(i);
                }
                Collections.shuffle(l);
                String code = "";
                for (int i = 0; i <= 6; i++) {
                    code += l.get(i);
                }
                code = code + "_" + sn;
                PreparedStatement p = cn.prepareStatement("insert into blogs values(?,?,?,?)");
                p.setInt(1, sn);
                p.setString(2, code);
                p.setString(3, title);
                p.setString(4, sd);
                if (p.executeUpdate() > 0) {
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
                        response.sendRedirect("blog_image.jsp?code="+code);
                    }
                    else{
                        response.sendRedirect("blog.jsp?again=1");
                    }
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
