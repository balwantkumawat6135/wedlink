<%-- 
    Document   : add_user
    Created on : Jan 22, 2025, 12:04:45 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("username")!=null && request.getParameter("username").trim().length()>0 && request.getParameter("fname")!=null && request.getParameter("fname").trim().length()>0 && request.getParameter("lname")!=null && request.getParameter("lname").trim().length()>0 && request.getParameter("email")!=null && request.getParameter("email").trim().length()>0 && request.getParameter("pass")!=null && request.getParameter("pass").trim().length()>0 && request.getParameter("gender")!=null && request.getParameter("gender").trim().length()>0 && request.getParameter("caste")!=null && request.getParameter("caste").trim().length()>0 && request.getParameter("religion")!=null && request.getParameter("religion").trim().length()>0 && request.getParameter("occupation")!=null && request.getParameter("occupation").trim().length()>0 && request.getParameter("dob")!=null && request.getParameter("dob").trim().length()>0 && request.getParameter("country")!=null && request.getParameter("country").trim().length()>0 && request.getParameter("state")!=null && request.getParameter("state").trim().length()>0 && request.getParameter("city")!=null && request.getParameter("city").trim().length()>0){
        String username=request.getParameter("username");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        String password=request.getParameter("pass");
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
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
            PreparedStatement ps=cn.prepareStatement("insert into user_details values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,username);
            ps.setString(2,fname);
            ps.setString(3,lname);
            ps.setString(4,email);
            ps.setString(5,password);
            ps.setString(6,gender);
            ps.setString(7,caste);
            ps.setString(8,religion);
            ps.setString(9,occupation);
            ps.setString(10,dob);
            ps.setString(13,country);
            ps.setString(12,state);
            ps.setString(11,city);
            if(ps.executeUpdate()>0){
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
        out.print("All Feilds Required");
    }
%>
