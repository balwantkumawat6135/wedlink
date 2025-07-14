<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy - Wedlink</title>
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
        .policy-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            padding: 30px;
            margin-bottom: 30px;
        }
        .policy-card h3 {
            color: #c2185b;
            font-weight: 600;
            margin-bottom: 20px;
            border-bottom: 2px solid #ffe4ec;
            padding-bottom: 10px;
        }
        .policy-card ul {
            padding-left: 20px;
        }
        .policy-card li {
            margin-bottom: 8px;
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
        .last-updated {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2rem;
            }
            .policy-card {
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
            <h1>Privacy Policy</h1>
            <p>Your privacy is important to us. Learn how we protect and handle your information.</p>
        </div>
    </section>

    <!-- Content Section -->
    <section class="content-section">
        <div class="container">
            <div class="last-updated">
                <strong>Last Updated:</strong> January 15, 2025
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-info-circle mr-2"></i>Information We Collect</h3>
                <p>We collect information you provide directly to us, including:</p>
                <ul>
                    <li><strong>Personal Information:</strong> Name, email address, phone number, date of birth, gender</li>
                    <li><strong>Profile Information:</strong> Photos, education, occupation, family details, preferences</li>
                    <li><strong>Communication Data:</strong> Messages, chat history, and interactions with other users</li>
                    <li><strong>Technical Information:</strong> IP address, browser type, device information, usage patterns</li>
                </ul>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-cogs mr-2"></i>How We Use Your Information</h3>
                <p>We use the collected information for the following purposes:</p>
                <ul>
                    <li>Creating and managing your profile</li>
                    <li>Providing matching services and recommendations</li>
                    <li>Facilitating communication between users</li>
                    <li>Improving our services and user experience</li>
                    <li>Sending notifications and updates</li>
                    <li>Ensuring platform security and preventing fraud</li>
                    <li>Complying with legal obligations</li>
                </ul>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-share-alt mr-2"></i>Information Sharing</h3>
                <p>We may share your information in the following circumstances:</p>
                <ul>
                    <li><strong>With Other Users:</strong> Your profile information is visible to other registered users</li>
                    <li><strong>Service Providers:</strong> With trusted third-party service providers who assist in our operations</li>
                    <li><strong>Legal Requirements:</strong> When required by law or to protect our rights and safety</li>
                    <li><strong>Business Transfers:</strong> In case of merger, acquisition, or sale of assets</li>
                </ul>
                <p><strong>We do not sell, rent, or trade your personal information to third parties for marketing purposes.</strong></p>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-shield mr-2"></i>Data Security</h3>
                <p>We implement appropriate security measures to protect your information:</p>
                <ul>
                    <li>Encryption of sensitive data in transit and at rest</li>
                    <li>Regular security assessments and updates</li>
                    <li>Access controls and authentication measures</li>
                    <li>Secure data centers and infrastructure</li>
                    <li>Employee training on data protection</li>
                </ul>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-cookie-bite mr-2"></i>Cookies and Tracking</h3>
                <p>We use cookies and similar technologies to:</p>
                <ul>
                    <li>Remember your preferences and settings</li>
                    <li>Analyze website usage and performance</li>
                    <li>Provide personalized content and recommendations</li>
                    <li>Ensure security and prevent fraud</li>
                </ul>
                <p>You can control cookie settings through your browser preferences.</p>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-user-edit mr-2"></i>Your Rights and Choices</h3>
                <p>You have the following rights regarding your personal information:</p>
                <ul>
                    <li><strong>Access:</strong> Request a copy of your personal data</li>
                    <li><strong>Correction:</strong> Update or correct inaccurate information</li>
                    <li><strong>Deletion:</strong> Request deletion of your account and data</li>
                    <li><strong>Portability:</strong> Request transfer of your data to another service</li>
                    <li><strong>Objection:</strong> Object to certain processing activities</li>
                    <li><strong>Withdrawal:</strong> Withdraw consent for data processing</li>
                </ul>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-globe mr-2"></i>International Data Transfers</h3>
                <p>Your information may be transferred to and processed in countries other than your own. We ensure appropriate safeguards are in place to protect your data in accordance with this Privacy Policy and applicable laws.</p>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-child mr-2"></i>Children's Privacy</h3>
                <p>Our services are not intended for individuals under 18 years of age. We do not knowingly collect personal information from children. If you believe we have collected information from a child, please contact us immediately.</p>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-edit mr-2"></i>Changes to This Policy</h3>
                <p>We may update this Privacy Policy from time to time. We will notify you of any material changes by:</p>
                <ul>
                    <li>Posting the updated policy on our website</li>
                    <li>Sending email notifications to registered users</li>
                    <li>Displaying prominent notices on our platform</li>
                </ul>
                <p>Your continued use of our services after changes become effective constitutes acceptance of the updated policy.</p>
            </div>

            <div class="policy-card">
                <h3><i class="fa fa-envelope mr-2"></i>Contact Us</h3>
                <p>If you have any questions about this Privacy Policy or our data practices, please contact us:</p>
                <ul>
                    <li><strong>Email:</strong> privacy@wedlink.com</li>
                    <li><strong>Phone:</strong> +1 (555) 123-4567</li>
                    <li><strong>Address:</strong> 123 Matrimony Street, Wedding City, WC 12345</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4">
        <div class="container">
            <p>&copy; 2025 Wedlink. All rights reserved. | Protecting Your Privacy</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html> 