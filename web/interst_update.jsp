<%-- 
    Document   : interst_update
    Created on : Feb 4, 2025, 3:56:09 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    Cookie c[]=request.getCookies();
    String email="";
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("login")){
            email=c[i].getValue();
        }
    }
    if(email!=null && session.getAttribute(email)!=null){
        int res=Integer.parseInt(request.getParameter("response"));
        String username=request.getParameter("username");
        String i_email=request.getParameter("email");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink","root","");
            if(res==1){
                PreparedStatement p=cn.prepareStatement("update intrested set intrest=? where to_username=? AND email=?");
                p.setInt(1,res);
                p.setString(2,username);
                p.setString(3,i_email);
                if(p.executeUpdate()>0){
                    out.print("success");
                }
                else{
                    out.print("again");
                }
            }
            else{
                PreparedStatement p=cn.prepareStatement("delete from  intrested where to_username=? AND email=?");
                p.setString(1,username);
                p.setString(2,i_email);
                if(p.executeUpdate()>0){
                    out.print("success");
                }
                else{
                    out.print("again");
                }
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