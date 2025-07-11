<%-- 
    Document   : instrested
    Created on : Feb 2, 2025, 2:18:19 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    Cookie c[]=request.getCookies();
    String email="";
    for(int i=0; i<c.length; i++){
        if(c[i].getName().equals("login")){
            email=c[i].getValue();
        }
    }
    if(email!=null && session.getAttribute(email)!=null){
        try{
            String username=request.getParameter("username");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink","root","");
            PreparedStatement p=cn.prepareStatement("insert into intrested values(?,?,?,?)");
            p.setString(1,email);
            p.setString(2,username);
            p.setInt(3,0);
            p.setString(4,"");
            if(p.executeUpdate()>0){
                out.print("success");
            }
            else{
                out.print("again");
            }
        }
        catch(Exception e){
            out.print(e.getMessage());
        }
    }
    else{
        out.print("no_email");
    }
    
%>
