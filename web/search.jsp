<%-- 
    Document   : search
    Created on : 29-May-2025, 9:08:16 AM
    Author     : balwant
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = "";
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
        }
    }
    if (email != null && session.getAttribute(email) != null) {
        try {
            String gender = request.getParameter("gender");
            int s_age = Integer.parseInt(request.getParameter("s_age"));
            int e_age = Integer.parseInt(request.getParameter("e_age"));
            String religion = request.getParameter("religion");
            String toungh = request.getParameter("toungh");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
            PreparedStatement p = cn.prepareStatement("SELECT * FROM user_details WHERE gender=? AND religion=? AND dob BETWEEN DATE_SUB(CURDATE(), INTERVAL ? YEAR) AND DATE_SUB(CURDATE(), INTERVAL ? YEAR) AND email<>?");
            p.setString(1, gender);
            p.setString(2, religion);
            p.setInt(3, e_age);
            p.setInt(4, s_age);
            p.setString(5, email);
            ResultSet r = p.executeQuery();
            ArrayList<String> a=new ArrayList<>();
            while (r.next()) {
                a.add(r.getString(1));
            }
            out.print(a);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>