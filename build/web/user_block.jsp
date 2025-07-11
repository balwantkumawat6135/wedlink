<%-- 
    Document   : user_block
    Created on : Feb 5, 2025, 4:13:04 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    Cookie c[]=request.getCookies();
    String email=null;
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("login")){
            email=c[i].getValue();
        }
    }
    if(email!=null && session.getAttribute(email)!=null){
        int res=Integer.parseInt(request.getParameter("response"));
        String username=request.getParameter("username");
        String i_email=request.getParameter("email");
        String block_by=request.getParameter("block_by");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink","root","");
            if(res==2){
                PreparedStatement p=cn.prepareStatement("update intrested set intrest=?,block_by=? where email=? AND to_username=?");
                p.setInt(1,res);
                p.setString(2,block_by);
                p.setString(3,i_email);
                p.setString(4,username);
                if(p.executeUpdate()>0){
                    out.print("success");
                }
                else{
                    out.print("again");
                }
            }
            else{
                PreparedStatement p=cn.prepareStatement("update intrested set intrest=?,block_by=? where email=? AND to_username=?");
                p.setInt(1,res);
                p.setString(2,"");
                p.setString(3,i_email);
                p.setString(4,username);
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
        out.print("no_cookie");
    }
%>