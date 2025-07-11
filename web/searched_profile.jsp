<%-- 
    Document   : searched_profile
    Created on : 10-Jul-2025, 10:53:41 AM
    Author     : balwant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Searched Profiles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-card {
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }
        .profile-card:hover {
            transform: scale(1.02);
        }
        .profile-img {
            height: 180px;
            object-fit: cover;
            border-radius: 12px 12px 0 0;
        }
        .card-body {
            padding: 1rem;
        }
    </style>
</head>
<body>

<div class="container py-4">
    <h2 class="text-center mb-4">Recently Searched Profiles</h2>
    <div class="row g-4">

        <!-- Profile Card 1 -->
        <div class="col-md-4">
            <div class="card profile-card">
                <img src="Admin/Story/511198K99T109_3.jpg" class="card-img-top profile-img" alt="Profile Image">
                <div class="card-body">
                    <h5 class="card-title">Aarti Sharma, 26</h5>
                    <p class="card-text"><strong>Location:</strong> Delhi, India</p>
                    <p class="card-text">Software engineer who loves books and long walks. Family-oriented and modern thinker.</p>
                </div>
            </div>
        </div>

        <!-- Profile Card 2 -->
        <div class="col-md-4">
            <div class="card profile-card">
                <img src="Admin/Story/511198K99T109_3.jpg" class="card-img-top profile-img" alt="Profile Image">
                <div class="card-body">
                    <h5 class="card-title">Ravi Kumar, 28</h5>
                    <p class="card-text"><strong>Location:</strong> Pune, India</p>
                    <p class="card-text">Loves travel and photography. Works in fintech, looking for someone with traditional values.</p>
                </div>
            </div>
        </div>

        <!-- Profile Card 3 -->
        <div class="col-md-4">
            <div class="card profile-card">
                <img src="Admin/Story/511198K99T109_3.jpg" class="card-img-top profile-img" alt="Profile Image">
                <div class="card-body">
                    <h5 class="card-title">Neha Desai, 25</h5>
                    <p class="card-text"><strong>Location:</strong> Ahmedabad, India</p>
                    <p class="card-text">Fashion designer with a love for creativity, music, and cultural traditions.</p>
                </div>
            </div>
        </div>

        <!-- Add more profile cards dynamically here -->

    </div>
</div>

</body>
</html>

