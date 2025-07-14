<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Wedlink</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fefefe;
            color: #333;
            line-height: 1.6;
        }
        .hero-section {
            background: linear-gradient(135deg, #c2185b 0%, #d81b60 100%);
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        .hero-section h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .hero-section p {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        .section {
            padding: 60px 0;
        }
        .section h2 {
            color: #c2185b;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
        }
        .feature-card {
            text-align: center;
            padding: 30px 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            margin-bottom: 30px;
            transition: transform 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .feature-icon {
            font-size: 3rem;
            color: #c2185b;
            margin-bottom: 20px;
        }
        .stats-section {
            background: #f8f9fa;
        }
        .stat-item {
            text-align: center;
            padding: 30px 20px;
        }
        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: #c2185b;
            display: block;
        }
        .stat-label {
            color: #666;
            font-size: 1.1rem;
            margin-top: 10px;
        }
        .team-member {
            text-align: center;
            margin-bottom: 30px;
        }
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #c2185b;
            margin-bottom: 15px;
        }
        .back-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            background: #c2185b;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 1.2rem;
            z-index: 1000;
            transition: background 0.3s;
        }
        .back-btn:hover {
            background: #d81b60;
            color: white;
        }
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2rem;
            }
            .hero-section p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <a href="index.jsp" class="btn back-btn">
        <i class="fa fa-arrow-left"></i>
    </a>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1>About Wedlink</h1>
            <p>Connecting hearts, building relationships, and creating happy marriages since 2020</p>
        </div>
    </section>

    <!-- Mission & Vision Section -->
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fa fa-heart"></i>
                        </div>
                        <h3>Our Mission</h3>
                        <p>To provide a trusted platform where individuals can find their perfect life partner, fostering meaningful relationships based on compatibility, shared values, and mutual understanding.</p>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fa fa-eye"></i>
                        </div>
                        <h3>Our Vision</h3>
                        <p>To become the most trusted matrimonial platform, helping millions of people find their soulmates and build happy, successful marriages across the globe.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="section stats-section">
        <div class="container">
            <h2>Wedlink in Numbers</h2>
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stat-item">
                        <span class="stat-number">10K+</span>
                        <div class="stat-label">Happy Couples</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stat-item">
                        <span class="stat-number">50K+</span>
                        <div class="stat-label">Active Users</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stat-item">
                        <span class="stat-number">100+</span>
                        <div class="stat-label">Cities Covered</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stat-item">
                        <span class="stat-number">99%</span>
                        <div class="stat-label">Success Rate</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="section">
        <div class="container">
            <h2>Why Choose Wedlink?</h2>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fa fa-shield"></i>
                        </div>
                        <h4>Verified Profiles</h4>
                        <p>All profiles are manually verified to ensure authenticity and trustworthiness of our members.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fa fa-search"></i>
                        </div>
                        <h4>Smart Matching</h4>
                        <p>Advanced algorithms help you find compatible matches based on your preferences and values.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fa fa-lock"></i>
                        </div>
                        <h4>Privacy Protection</h4>
                        <p>Your personal information is protected with industry-standard security measures.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fa fa-mobile"></i>
                        </div>
                        <h4>Mobile Friendly</h4>
                        <p>Access Wedlink from anywhere with our responsive mobile-friendly platform.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fa fa-headphones"></i>
                        </div>
                        <h4>24/7 Support</h4>
                        <p>Our dedicated support team is available round the clock to assist you.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fa fa-users"></i>
                        </div>
                        <h4>Community</h4>
                        <p>Join our growing community of individuals looking for meaningful relationships.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="section stats-section">
        <div class="container">
            <h2>Our Team</h2>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="team-member">
                        <img src="Image/profile.jpg" alt="CEO">
                        <h4>Balwant Singh</h4>
                        <p class="text-muted">Founder & CEO</p>
                        <p>Passionate about connecting people and building meaningful relationships.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="team-member">
                        <img src="Image/profile.jpg" alt="CTO">
                        <h4>Development Team</h4>
                        <p class="text-muted">Technology & Innovation</p>
                        <p>Dedicated to creating the best user experience with cutting-edge technology.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="team-member">
                        <img src="Image/profile.jpg" alt="Support">
                        <h4>Support Team</h4>
                        <p class="text-muted">Customer Success</p>
                        <p>Committed to providing excellent service and support to our users.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4">
        <div class="container">
            <p>&copy; 2025 Wedlink. All rights reserved. | Connecting Hearts Worldwide</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html> 