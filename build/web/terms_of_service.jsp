<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms of Service - Wedlink</title>
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
        .terms-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            padding: 30px;
            margin-bottom: 30px;
        }
        .terms-card h3 {
            color: #c2185b;
            font-weight: 600;
            margin-bottom: 20px;
            border-bottom: 2px solid #ffe4ec;
            padding-bottom: 10px;
        }
        .terms-card ul {
            padding-left: 20px;
        }
        .terms-card li {
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
        .important-note {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
        }
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2rem;
            }
            .terms-card {
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
            <h1>Terms of Service</h1>
            <p>Please read these terms carefully before using our services.</p>
        </div>
    </section>

    <!-- Content Section -->
    <section class="content-section">
        <div class="container">
            <div class="last-updated">
                <strong>Last Updated:</strong> January 15, 2025
            </div>

            <div class="important-note">
                <h4><i class="fa fa-exclamation-triangle mr-2"></i>Important Notice</h4>
                <p>By accessing or using Wedlink's services, you agree to be bound by these Terms of Service. If you do not agree to these terms, please do not use our services.</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-user mr-2"></i>1. Acceptance of Terms</h3>
                <p>By creating an account or using Wedlink's matrimonial services, you acknowledge that you have read, understood, and agree to be bound by these Terms of Service. These terms constitute a legally binding agreement between you and Wedlink.</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-users mr-2"></i>2. Eligibility</h3>
                <p>To use our services, you must:</p>
                <ul>
                    <li>Be at least 18 years of age</li>
                    <li>Be legally single, divorced, or widowed</li>
                    <li>Provide accurate and truthful information</li>
                    <li>Have the legal capacity to enter into a binding agreement</li>
                    <li>Comply with all applicable laws and regulations</li>
                </ul>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-user-plus mr-2"></i>3. Account Registration</h3>
                <p>When creating an account, you agree to:</p>
                <ul>
                    <li>Provide accurate, current, and complete information</li>
                    <li>Maintain and update your profile information</li>
                    <li>Keep your login credentials secure and confidential</li>
                    <li>Notify us immediately of any unauthorized use</li>
                    <li>Not share your account with others</li>
                    <li>Not create multiple accounts for the same person</li>
                </ul>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-shield mr-2"></i>4. User Conduct</h3>
                <p>You agree not to:</p>
                <ul>
                    <li>Post false, misleading, or fraudulent information</li>
                    <li>Harass, abuse, or harm other users</li>
                    <li>Use the service for commercial purposes without permission</li>
                    <li>Attempt to gain unauthorized access to our systems</li>
                    <li>Upload malicious content or viruses</li>
                    <li>Violate any applicable laws or regulations</li>
                    <li>Impersonate another person or entity</li>
                    <li>Use automated tools to access or interact with the service</li>
                </ul>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-camera mr-2"></i>5. Content Guidelines</h3>
                <p>When posting content, you must ensure it:</p>
                <ul>
                    <li>Is accurate and truthful</li>
                    <li>Does not contain offensive, inappropriate, or illegal material</li>
                    <li>Respects the privacy and rights of others</li>
                    <li>Does not infringe on intellectual property rights</li>
                    <li>Complies with our community standards</li>
                </ul>
                <p>We reserve the right to remove any content that violates these guidelines.</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-lock mr-2"></i>6. Privacy and Data Protection</h3>
                <p>Your privacy is important to us. Our collection and use of your personal information is governed by our Privacy Policy, which is incorporated into these Terms of Service by reference.</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-credit-card mr-2"></i>7. Premium Services and Payments</h3>
                <p>Some features may require payment. By purchasing premium services, you agree to:</p>
                <ul>
                    <li>Pay all applicable fees and taxes</li>
                    <li>Provide accurate billing information</li>
                    <li>Authorize recurring payments if applicable</li>
                    <li>Not dispute charges for services you have used</li>
                </ul>
                <p>All fees are non-refundable unless otherwise stated or required by law.</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-ban mr-2"></i>8. Prohibited Activities</h3>
                <p>The following activities are strictly prohibited:</p>
                <ul>
                    <li>Creating fake profiles or impersonating others</li>
                    <li>Using the service for prostitution or illegal activities</li>
                    <li>Attempting to scam or defraud other users</li>
                    <li>Sharing personal information of other users without consent</li>
                    <li>Using the service to promote hate speech or discrimination</li>
                    <li>Attempting to reverse engineer or hack our systems</li>
                </ul>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-gavel mr-2"></i>9. Termination</h3>
                <p>We may terminate or suspend your account at any time for:</p>
                <ul>
                    <li>Violation of these Terms of Service</li>
                    <li>Fraudulent or illegal activities</li>
                    <li>Harassment or abuse of other users</li>
                    <li>Non-payment of fees (for premium services)</li>
                    <li>Any other reason at our sole discretion</li>
                </ul>
                <p>You may terminate your account at any time by contacting us or using the account deletion feature.</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-exclamation-triangle mr-2"></i>10. Disclaimers and Limitations</h3>
                <p>Wedlink provides its services "as is" without warranties of any kind. We are not responsible for:</p>
                <ul>
                    <li>The accuracy of user-provided information</li>
                    <li>The success or failure of relationships formed through our service</li>
                    <li>Any damages arising from the use of our service</li>
                    <li>Interruptions or technical issues</li>
                    <li>The actions or behavior of other users</li>
                </ul>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-balance-scale mr-2"></i>11. Limitation of Liability</h3>
                <p>To the maximum extent permitted by law, Wedlink shall not be liable for any indirect, incidental, special, consequential, or punitive damages, including but not limited to loss of profits, data, or use.</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-edit mr-2"></i>12. Changes to Terms</h3>
                <p>We reserve the right to modify these Terms of Service at any time. We will notify users of significant changes by:</p>
                <ul>
                    <li>Posting the updated terms on our website</li>
                    <li>Sending email notifications</li>
                    <li>Displaying prominent notices on our platform</li>
                </ul>
                <p>Continued use of our services after changes constitutes acceptance of the new terms.</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-globe mr-2"></i>13. Governing Law</h3>
                <p>These Terms of Service are governed by and construed in accordance with the laws of [Your Jurisdiction]. Any disputes arising from these terms shall be resolved in the courts of [Your Jurisdiction].</p>
            </div>

            <div class="terms-card">
                <h3><i class="fa fa-envelope mr-2"></i>14. Contact Information</h3>
                <p>If you have any questions about these Terms of Service, please contact us:</p>
                <ul>
                    <li><strong>Email:</strong> legal@wedlink.com</li>
                    <li><strong>Phone:</strong> +1 (555) 123-4567</li>
                    <li><strong>Address:</strong> 123 Matrimony Street, Wedding City, WC 12345</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4">
        <div class="container">
            <p>&copy; 2025 Wedlink. All rights reserved. | Terms of Service</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html> 