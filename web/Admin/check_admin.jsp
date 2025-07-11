<%-- 
    Document   : check_admin
    Created on : 27-Jun-2025, 5:07:43 PM
    Author     : balwant
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("email")!=null && request.getParameter("email").trim().length()>0 && request.getParameter("password")!=null && request.getParameter("password").trim().length()>0){
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
            PreparedStatement p=cn.prepareStatement("select * from admin where email=?");
            p.setString(1,email);
            ResultSet r=p.executeQuery();
            if(r.next()){
                if(r.getString(2).equals(password)){
                    Cookie c=new Cookie("admin",email);
                    c.setMaxAge(300);
                    response.addCookie(c);
                    session.setAttribute(email,password);
                    session.setMaxInactiveInterval(3600);
                    out.print("success");
                }
                else{
                    out.print("invalid_password");
                }
            }
            else{
                out.print("invalid email");
            }
        }
        catch(Exception e){
            out.print(e.getMessage());
        }
    }
    else{
        out.print("empty");
    }

%>
