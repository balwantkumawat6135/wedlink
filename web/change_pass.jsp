<%-- 
    Document   : change_pass
    Created on : Jan 25, 2025, 4:01:02 PM
    Author     : BALWANT
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = null;
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
            break;
        }
    }
    if(email!=null && session.getAttribute(email)!=null){
        String cp=request.getParameter("cp");
        String pass=request.getParameter("pass");
        String repass=request.getParameter("repass");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink","root","");
            Statement st=cn.createStatement();
            ResultSet rs1=st.executeQuery("select password from user_details where email='"+ email +"'");
            if(rs1.next()){
                if(cp.equals(rs1.getString(1))){
                    if(!(cp.equals(pass))){
                        if(pass.equals(repass)){
                            PreparedStatement p=cn.prepareStatement("update user_details set password=? where email=?");
                            p.setString(1,pass);
                            p.setString(2,email);
                            if(p.executeUpdate()>0){
                                out.print("success");
                            }
                            else{
                                out.print("failed");
                            }
                        }
                        else{
                            out.print("pass_not_same");
                        }
                    }
                    else{
                        out.print("cp_pass_same");
                    }
              }
                else{
                    out.print("wrong_cp");
                }
          }
        }
        catch(Exception e){
            out.print(e.getMessage());
        }
        
    }
%>