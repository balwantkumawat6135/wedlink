<%-- 
    Document   : send_msg
    Created on : Feb 14, 2025, 8:02:47 PM
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
        String t_username=request.getParameter("t_username");
        String f_username=request.getParameter("f_username");
        String msg=request.getParameter("msg");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink","root","");
            Statement st=cn.createStatement();
            int sn=0;
            ResultSet rs=st.executeQuery("select MAX(sn) from message");
            if(rs.next()){
                sn=rs.getInt(1);
            }
            sn++;
            
            PreparedStatement p=cn.prepareStatement("insert into message values(?,?,?,?,NOW())");
            p.setInt(1,sn);
            p.setString(2,t_username);
            p.setString(3,f_username);
            p.setString(4,msg);
            if(p.executeUpdate()>0){
                out.print("success");
            }
            else{
                out.print("again");
            }
        }catch(Exception e){
            out.print(e.getMessage());
        }
    }
%>