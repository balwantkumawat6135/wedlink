<%-- 
    Document   : update_profile
    Created on : Jan 26, 2025, 1:19:45 PM
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
        if(request.getParameter("fname")!=null && request.getParameter("fname").trim().length()>0 && request.getParameter("lname")!=null && request.getParameter("lname").trim().length()>0 && request.getParameter("gender")!=null && request.getParameter("gender").trim().length()>0 && request.getParameter("caste")!=null && request.getParameter("caste").trim().length()>0 && request.getParameter("religion")!=null && request.getParameter("religion").trim().length()>0 && request.getParameter("occupation")!=null && request.getParameter("occupation").trim().length()>0 && request.getParameter("dob")!=null && request.getParameter("dob").trim().length()>0 && request.getParameter("country")!=null && request.getParameter("country").trim().length()>0 && request.getParameter("state")!=null && request.getParameter("state").trim().length()>0 && request.getParameter("city")!=null && request.getParameter("city").trim().length()>0){
              String fname=request.getParameter("fname");
              String lname=request.getParameter("lname");
              String gender=request.getParameter("gender");
              String caste=request.getParameter("caste");
              String religion=request.getParameter("religion");
              String occupation=request.getParameter("occupation");
              String dob=request.getParameter("dob");
              String country=request.getParameter("country");
              String state=request.getParameter("state");
              String city=request.getParameter("city");
              try{
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink","root","");
                  PreparedStatement p=cn.prepareStatement("update user_details set fname=?,lname=?,gender=?,caste=?,religion=?,occupation=?,dob=?,city=?,state=?,country=? WHERE email=?");
                  p.setString(1,fname);
                  p.setString(2,lname);
                  p.setString(3,gender);
                  p.setString(4,caste);
                  p.setString(5,religion);
                  p.setString(6,occupation);
                  p.setString(7,dob);
                  p.setString(8,city);
                  p.setString(9,state);
                  p.setString(10,country);
                  p.setString(11,email);
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
    
    }
%>
