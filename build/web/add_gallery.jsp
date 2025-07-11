<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = "";
    if (c == null) {
        response.sendRedirect("index.jsp");
    } else {
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("login")) {
                email = c[i].getValue();
            }
        }

        if (email != null && session.getAttribute(email) != null) {
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select MAX(sn) from gallery");
                int sn = 0;
                if (rs.next()) {
                    sn = rs.getInt(1);
                }
                sn++;
                if (st.executeUpdate("insert into gallery values(" + sn + ",'" + email + "',NOW())") > 0) {
                    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                    if (!isMultipart) {
                        out.print("No file uploaded.");
                        return;
                    }

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setSizeThreshold(1024 * 1024); // 1 MB
                    File tempDir = (File) application.getAttribute("javax.servlet.context.tempdir");
                    factory.setRepository(tempDir);

                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(5 * 1024 * 1024); // 5 MB

                    List<FileItem> items = upload.parseRequest(request);

                    for (FileItem item : items) {
                        if (!item.isFormField() && item.getFieldName().equals("croppedImage")) {
                            String uploadPath = application.getRealPath("") + File.separator + "Gallery";
                            File uploadDir = new File(uploadPath);
                            if (!uploadDir.exists()) {
                                uploadDir.mkdirs();
                            }

                            String fileName = sn + ".jpg";
                            File uploadedFile = new File(uploadPath + File.separator + fileName);
                            item.write(uploadedFile);

                            response.sendRedirect("index.jsp?success=1");
                            return;
                        }
                    }

                    out.print("Upload failed. File field not found.");
                }
            } catch (Exception ex) {
                out.println("<p style='color:red'>Error: " + ex.getMessage() + "</p>");
            }
        } else {
            response.sendRedirect("index.jsp?no_cookie=1");
        }

    }

%>


