<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Wedlink</title>
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
            padding: 60px 0;
            text-align: center;
        }
        .hero-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 15px;
        }
        .content-section {
            padding: 50px 0;
        }
        .contact-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            padding: 30px;
            margin-bottom: 30px;
            height: 100%;
        }
        .contact-card h3 {
            color: #c2185b;
            font-weight: 600;
            margin-bottom: 20px;
            border-bottom: 2px solid #ffe4ec;
            padding-bottom: 10px;
        }
        .contact-info {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .contact-icon {
            background: #ffe4ec;
            color: #c2185b;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-size: 1.2rem;
        }
        .form-control {
            border-radius: 10px;
            border: 1px solid #dee2e6;
            padding: 12px 15px;
        }
        .form-control:focus {
            border-color: #c2185b;
            box-shadow: 0 0 0 0.2rem rgba(194, 24, 91, 0.25);
        }
        .btn-primary {
            background: #c2185b;
            border: none;
            border-radius: 25px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-primary:hover {
            background: #d81b60;
            transform: translateY(-2px);
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
        .office-hours {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
        }
        .office-hours h5 {
            color: #c2185b;
            margin-bottom: 15px;
        }
        .office-hours .day {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            padding: 5px 0;
            border-bottom: 1px solid #eee;
        }
        .office-hours .day:last-child {
            border-bottom: none;
        }
        .map-container {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            margin-top: 20px;
        }
        .map-placeholder {
            background: #dee2e6;
            height: 200px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            font-size: 1.1rem;
        }
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2rem;
            }
            .contact-card {
                padding: 20px;
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
            <h1>Contact Us</h1>
            <p>We're here to help! Get in touch with our team.</p>
        </div>
    </section>

    <!-- Content Section -->
    <section class="content-section">
        <div class="container">
            <div class="row">
                <!-- Contact Form -->
                <div class="col-lg-8 mb-4">
                    <div class="contact-card">
                        <h3><i class="fa fa-envelope mr-2"></i>Send us a Message</h3>
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">First Name *</label>
                                    <input type="text" class="form-control" id="firstName" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Last Name *</label>
                                    <input type="text" class="form-control" id="lastName" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="email">Email Address *</label>
                                    <input type="email" class="form-control" id="email" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="phone">Phone Number</label>
                                    <input type="tel" class="form-control" id="phone">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="subject">Subject *</label>
                                <select class="form-control" id="subject" required>
                                    <option value="">Select a subject</option>
                                    <option value="general">General Inquiry</option>
                                    <option value="technical">Technical Support</option>
                                    <option value="billing">Billing & Payments</option>
                                    <option value="safety">Safety & Security</option>
                                    <option value="feedback">Feedback & Suggestions</option>
                                    <option value="partnership">Partnership Opportunities</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="message">Message *</label>
                                <textarea class="form-control" id="message" rows="5" placeholder="Please describe your inquiry in detail..." required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-paper-plane mr-2"></i>Send Message
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Contact Information -->
                <div class="col-lg-4 mb-4">
                    <div class="contact-card">
                        <h3><i class="fa fa-info-circle mr-2"></i>Contact Information</h3>
                        
                        <div class="contact-info">
                            <div class="contact-icon">
                                <i class="fa fa-map-marker"></i>
                            </div>
                            <div>
                                <strong>Address</strong><br>
                                123 Matrimony Street<br>
                                Wedding City, WC 12345<br>
                                United States
                            </div>
                        </div>

                        <div class="contact-info">
                            <div class="contact-icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div>
                                <strong>Phone</strong><br>
                                +1 (555) 123-4567<br>
                                +1 (555) 987-6543
                            </div>
                        </div>

                        <div class="contact-info">
                            <div class="contact-icon">
                                <i class="fa fa-envelope"></i>
                            </div>
                            <div>
                                <strong>Email</strong><br>
                                info@wedlink.com<br>
                                support@wedlink.com
                            </div>
                        </div>

                        <div class="contact-info">
                            <div class="contact-icon">
                                <i class="fa fa-globe"></i>
                            </div>
                            <div>
                                <strong>Website</strong><br>
                                www.wedlink.com
                            </div>
                        </div>

                        <div class="office-hours">
                            <h5><i class="fa fa-clock-o mr-2"></i>Office Hours</h5>
                            <div class="day">
                                <span>Monday - Friday</span>
                                <span>9:00 AM - 6:00 PM</span>
                            </div>
                            <div class="day">
                                <span>Saturday</span>
                                <span>10:00 AM - 4:00 PM</span>
                            </div>
                            <div class="day">
                                <span>Sunday</span>
                                <span>Closed</span>
                            </div>
                            <div class="day">
                                <span>Emergency Support</span>
                                <span>24/7 Available</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Additional Information -->
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="contact-card">
                        <h3><i class="fa fa-question-circle mr-2"></i>Frequently Asked Questions</h3>
                        <div class="accordion" id="faqAccordion">
                            <div class="card">
                                <div class="card-header" id="faq1">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse1">
                                            How do I create an account?
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapse1" class="collapse" data-parent="#faqAccordion">
                                    <div class="card-body">
                                        Click on the "Sign Up" button on our homepage and fill in your details to create your account.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="faq2">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse2">
                                            How can I contact other members?
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapse2" class="collapse" data-parent="#faqAccordion">
                                    <div class="card-body">
                                        You can send messages to other members through our messaging system once you have a premium account.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="faq3">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse3">
                                            Is my information secure?
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapse3" class="collapse" data-parent="#faqAccordion">
                                    <div class="card-body">
                                        Yes, we use industry-standard security measures to protect your personal information.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 mb-4">
                    <div class="contact-card">
                        <h3><i class="fa fa-map-marker mr-2"></i>Our Location</h3>
                        <div class="map-container">
                            <div class="map-placeholder">
                                <div>
                                    <i class="fa fa-map fa-3x mb-3"></i><br>
                                    Interactive Map Coming Soon<br>
                                    <small>123 Matrimony Street, Wedding City</small>
                                </div>
                            </div>
                            <p class="mt-3 mb-0">
                                <strong>Getting Here:</strong><br>
                                • 10 minutes from City Center<br>
                                • Free parking available<br>
                                • Accessible by public transport
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Social Media -->
            <div class="row">
                <div class="col-12">
                    <div class="contact-card text-center">
                        <h3><i class="fa fa-share-alt mr-2"></i>Follow Us</h3>
                        <p>Stay connected with us on social media for updates and success stories.</p>
                        <div class="d-flex justify-content-center">
                            <a href="#" class="btn btn-outline-primary mx-2">
                                <i class="fa fa-facebook"></i> Facebook
                            </a>
                            <a href="#" class="btn btn-outline-info mx-2">
                                <i class="fa fa-twitter"></i> Twitter
                            </a>
                            <a href="#" class="btn btn-outline-danger mx-2">
                                <i class="fa fa-instagram"></i> Instagram
                            </a>
                            <a href="#" class="btn btn-outline-primary mx-2">
                                <i class="fa fa-linkedin"></i> LinkedIn
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4">
        <div class="container">
            <p>&copy; 2025 Wedlink. All rights reserved. | Contact Us</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html> 