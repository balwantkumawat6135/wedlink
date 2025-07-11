<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%
    String email = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("login")) {
                email = c.getValue();
                break;
            }
        }
    }

    if (email != null && session != null && session.getAttribute(email) != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedlink", "root", "");
            PreparedStatement ps = cn.prepareStatement("SELECT username FROM user_details WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            String username = "";
            if (rs.next()) {
                username = rs.getString("username");
            }

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
                    String uploadPath = application.getRealPath("") + File.separator + "profile";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    String fileName = username + ".jpg";
                    File uploadedFile = new File(uploadPath + File.separator + fileName);
                    item.write(uploadedFile);

                    response.sendRedirect("profile.jsp?success=1");
                    return;
                }
            }

            out.print("Upload failed. File field not found.");
        } catch (Exception e) {
            
        }
    } else {
        response.sendRedirect("index.jsp?no_cookie=1");
    }
%>
