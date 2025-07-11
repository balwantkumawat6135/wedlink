<%-- 
    Document   : blog_image
    Created on : 02-Jul-2025, 5:32:25 PM
    Author     : balwant
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = "";
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("admin")) {
            email = c[i].getValue();
        }
    }
    if (email != null && session.getAttribute(email) != null) {
        if(request.getParameter("code")!=null && request.getParameter("code").trim().length()>0){
            String code=request.getParameter("code").trim();
        
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Wedlink</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Cropper CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css" rel="stylesheet"/>
        <script src="jquery-3.7.1.js"></script>
        <!-- Bootstrap JS -->
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f4f6f9;
            }
            .sidebar {
                height: 100vh;
                background-color: #343a40;
                padding-top: 20px;
                color: #fff;
            }
            .sidebar a {
                color: #adb5bd;
                padding: 10px 20px;
                display: block;
            }
            .sidebar a:hover, .sidebar .active {
                color: #fff;
                background-color: #495057;
                text-decoration: none;
            }
            .card {
                border-radius: 10px;
            }
            .navbar-brand {
                font-weight: bold;
            }
            /* Crop Image Css */
            #imagePreview {
                max-width: 100%;
                display: none;
                margin-top: 10px;
            }
            .preview-box {
                margin-top: 10px;
                width: 100px;
                height: 100px;
                overflow: hidden;
                border: 1px solid #ccc;
            }
            .preview {
                width: 100%;
                height: 100%;
            }
            #croppedImageResult {
                margin-top: 20px;
            }
            /*END*/

        </style>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="sidebar.jsp"%>

                <!-- Main Content -->
                <main role="main" class="col-md-10 ml-sm-auto px-4">
                    <!-- Top Navbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white mt-3 mb-4 shadow-sm rounded">
                        <a class="navbar-brand" href="#">Dashboard</a>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <span class="nav-link">Welcome, Admin</span>
                            </li>
                        </ul>
                    </nav>

                    <div class="container mt-4">
                        <h2>Upload Blog Thumbnail</h2>
                        <input type="file" id="inputImage" accept="image/*" class="form-control">
                        <div>
                            <img id="imagePreview">
                        </div>
                        <div class="preview-box">
                            <div class="preview"></div>
                        </div>
                        <button id="cropButton" class="btn btn-primary mt-2">Crop & Upload</button>
                        <div id="croppedImageResult"></div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.js"></script>
        <script>
            let cropper;
            const inputImage = document.getElementById('inputImage');
            const imagePreview = document.getElementById('imagePreview');
            const result = document.getElementById('croppedImageResult');

            inputImage.addEventListener('change', (e) => {
                const file = e.target.files[0];
                if (!file)
                    return;

                const reader = new FileReader();
                reader.onload = () => {
                    imagePreview.src = reader.result;
                    imagePreview.style.display = 'block';
                    if (cropper)
                        cropper.destroy();
                    cropper = new Cropper(imagePreview, {
                        aspectRatio: 16/9,
                        viewMode: 1,
                        preview: '.preview'
                    });
                };
                reader.readAsDataURL(file);
            });

            document.getElementById('cropButton').addEventListener('click', () => {
                if (cropper) {
                    const canvas = cropper.getCroppedCanvas({
                        width: 400,
                        height: 200
                    });

                    result.innerHTML = "<h4>Cropped Preview:</h4>";
                    result.appendChild(canvas);

                    canvas.toBlob((blob) => {
                        const formData = new FormData();
                        formData.append('croppedImage', blob, 'profile.jpg');
                        // Add your string parameter
                        const code = '<%= code%>'; 
                        formData.append('code', code);

                        fetch('blog_image_upload.jsp', {
                            method: 'POST',
                            body: formData
                        }).then(response => {
                            if (response.ok) {
                                alert('Upload successful');
                                window.open("http://localhost:8080/Admin/blog.jsp?success=1", "_self");
                            } else {
                                throw new Error('Upload failed');
                            }
                        }).catch(() => {
                            alert('Upload failed');
                        });
                    }, 'image/jpeg');
                }
            });
        </script>
    </body>
</html>

<%
        }
        else{
            response.sendRedirect("add_story.jsp?empty=1");
        }
    } else {
        response.sendRedirect("index.jsp");
    }

%>

