<%-- 
    Document   : image_upload
    Created on : 28-Jun-2025, 2:31:44 PM
    Author     : balwant
--%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>

<%
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (isMultipart) {
    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    
    List items = upload.parseRequest(request);
    Iterator iterator = items.iterator();
    
    String code = null;
    FileItem imageFile = null;
    
    while (iterator.hasNext()) {
        FileItem item = (FileItem)iterator.next();
        
        if (item.isFormField()) {
            // Handle regular form field (your string)
            if (item.getFieldName().equals("code")) {
                code = item.getString();
            }
        } else {
            // Handle file upload (image)
            if (item.getFieldName().equals("croppedImage")) {
                imageFile = item;
            }
        }
    }
    
    // Process the data
    if (imageFile != null) {
        String fileName = code+".jpg";
        String filePath = getServletContext().getRealPath("/") + "/Admin/Story/" + fileName;
        
        // Save the image
        File uploadedFile = new File(filePath);
        imageFile.write(uploadedFile);
          response.sendRedirect("add_story.jsp");
    }
}
%>