<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>About Us | Smart Electronics</title>
    <!-- Google Fonts: modern sans-serif -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700&display=swap" rel="stylesheet">
    <!-- Font Awesome 6 (free icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fe 0%, #eef2fa 100%);
            color: #1a2c3e;
            line-height: 1.5;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }



        /* CTA button style */
        .cart-badge {
            background: #f0f2f8;
            padding: 0.4rem 1rem;
            border-radius: 40px;
            font-weight: 600;
            transition: all 0.2s;
        }

        .cart-badge:hover {
            background: #e6e9f2;
        }

        /* ========== MAIN CONTAINER (glassmorphism card) ========== */
        .about-wrapper {
            flex: 1;
            max-width: 1280px;
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            border-radius: 2rem;
            box-shadow: 0 25px 45px -12px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.02);
            border: 1px solid rgba(255, 255, 255, 0.6);
            padding: 2.5rem;
            transition: transform 0.2s ease;
        }

        /* Hero section inside about */
        .about-hero {
            display: flex;
            flex-wrap: wrap;
            gap: 2.5rem;
            align-items: center;
            margin-bottom: 3rem;
        }

        .about-text h2 {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(145deg, #1f2e3f, #0f2b3d);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            letter-spacing: -0.02em;
            margin-bottom: 1rem;
        }

        .about-text .tagline {
            font-size: 1.1rem;
            color: #4a627a;
            border-left: 4px solid #2463eb;
            padding-left: 1rem;
            margin-bottom: 1.4rem;
            font-weight: 500;
        }

        .desc-text {
            color: #2c3e50;
            font-size: 1.05rem;
            line-height: 1.6;
            margin-bottom: 1.2rem;
        }

        .highlight-list {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-top: 1rem;
        }

        .highlight-badge {
            background: rgba(36, 99, 235, 0.1);
            backdrop-filter: blur(4px);
            padding: 0.5rem 1.2rem;
            border-radius: 60px;
            font-size: 0.9rem;
            font-weight: 500;
            color: #2463eb;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .about-illustration {
            flex: 1;
            min-width: 200px;
            text-align: center;
        }

        .about-illustration i {
            font-size: 11rem;
            color: #2463eb;
            opacity: 0.8;
            filter: drop-shadow(0 12px 18px rgba(0,0,0,0.1));
            transition: 0.2s;
        }

        /* mission cards */
        .mission-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            margin: 3rem 0 2rem;
        }

        .mission-card {
            background: white;
            border-radius: 1.5rem;
            padding: 1.6rem;
            flex: 1;
            min-width: 180px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.02);
            border: 1px solid rgba(0, 0, 0, 0.03);
            transition: all 0.25s;
        }

        .mission-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 30px -12px rgba(0, 0, 0, 0.1);
            border-color: rgba(36, 99, 235, 0.2);
        }

        .mission-icon {
            background: #eef3ff;
            width: 52px;
            height: 52px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 20px;
            margin-bottom: 1.2rem;
        }

        .mission-icon i {
            font-size: 1.8rem;
            color: #2463eb;
        }

        .mission-card h3 {
            font-size: 1.35rem;
            font-weight: 600;
            margin-bottom: 0.7rem;
        }

        .mission-card p {
            color: #4a627a;
            font-size: 0.95rem;
            line-height: 1.45;
        }

        /* payment methods section */
        .payment-showcase {
            background: rgba(255, 255, 255, 0.5);
            border-radius: 1.5rem;
            padding: 1.6rem;
            margin-top: 2rem;
            border: 1px solid rgba(255,255,255,0.8);
        }

        .payment-showcase h3 {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .payment-methods {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            align-items: center;
        }

        .method-item {
            background: white;
            border-radius: 60px;
            padding: 0.5rem 1.2rem;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-weight: 500;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            border: 1px solid #eef2f9;
        }

        .method-item i {
            font-size: 1.2rem;
            color: #2463eb;
        }

        /* mission quote */
        .mission-quote {
            margin-top: 2rem;
            background: linear-gradient(115deg, #f0f6ff 0%, #ffffff 100%);
            border-radius: 1.5rem;
            padding: 1.5rem;
            text-align: center;
            font-style: normal;
            border-left: 6px solid #2463eb;
        }

        .mission-quote p {
            font-size: 1.1rem;
            font-weight: 500;
            color: #1f2e3f;
        }

        
        

        /* responsive */
        @media (max-width: 780px) {
            .nav-container {
                flex-direction: column;
                align-items: stretch;
                text-align: center;
            }
            .nav-links {
                justify-content: center;
            }
            .about-hero {
                flex-direction: column;
            }
            .glass-card {
                padding: 1.8rem;
            }
            .about-text h2 {
                font-size: 2rem;
            }
            .about-illustration i {
                font-size: 7rem;
            }
            .mission-grid {
                flex-direction: column;
            }
        }

        @media (max-width: 480px) {
            .payment-methods {
                flex-direction: column;
                align-items: flex-start;
            }
            .footer-content {
                flex-direction: column;
            }
        }

        /* custom button like style */
        .btn-outline-light {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: transparent;
            border: 1px solid #cbd5e1;
            padding: 0.5rem 1.2rem;
            border-radius: 40px;
            font-weight: 500;
            transition: 0.2s;
        }
        .btn-outline-light:hover {
            background: #f8fafc;
            border-color: #2463eb;
        }

        hr {
            margin: 1.5rem 0;
            border: none;
            height: 1px;
            background: linear-gradient(to right, transparent, #cbd5e1, transparent);
        }
    </style>
     <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>

<jsp:include page="header.jsp" />
<!-- ==================== MAIN ABOUT CONTENT ==================== -->
<div class="about-wrapper">
    <div class="glass-card">
        <!-- Hero section: brand story & illustration -->
        <div class="about-hero">
            <div class="about-text">
                <h2>About Smart Electronics</h2>
                <div class="tagline">
                    <i class="fas fa-bolt" style="margin-right: 6px;"></i> Next-gen e-commerce, built for the future
                </div>
                <p class="desc-text">
                    Smart Electronics is a modern e-commerce platform crafted for campus project excellence. 
                    We deliver high-quality electronic products — from cutting-edge gadgets to essential devices — 
                    all at student-friendly prices, without compromising on quality or innovation.
                </p>
                <p class="desc-text">
                    Our system is fully equipped with <strong>product management</strong>, <strong>intelligent cart</strong>, 
                    <strong>order tracking</strong>, and a seamless checkout flow. We’re redefining how campus communities 
                    access tech, blending reliability with a sleek digital experience.
                </p>
                <div class="highlight-list">
                    <span class="highlight-badge"><i class="fas fa-check-circle"></i> Fast Delivery</span>
                    <span class="highlight-badge"><i class="fas fa-shield-alt"></i> Secure Payments</span>
                    <span class="highlight-badge"><i class="fas fa-exchange-alt"></i> Easy Returns</span>
                </div>
            </div>
            <div class="about-illustration">
                <i class="fas fa-laptop-code"></i>
            </div>
        </div>

        <!-- core mission & features grid (modern) -->
        <div class="mission-grid">
            <div class="mission-card">
                <div class="mission-icon">
                    <i class="fas fa-bullseye"></i>
                </div>
                <h3>Our Mission</h3>
                <p>To empower students and tech lovers with a simple, powerful, and enjoyable online shopping journey — bridging quality electronics and affordability.</p>
            </div>
            <div class="mission-card">
                <div class="mission-icon">
                    <i class="fas fa-cubes"></i>
                </div>
                <h3>Product Ecosystem</h3>
                <p>Smart inventory, real-time stock updates, and advanced product filtering. From laptops to accessories, we’ve got everything under one digital roof.</p>
            </div>
            <div class="mission-card">
                <div class="mission-icon">
                    <i class="fas fa-hand-holding-usd"></i>
                </div>
                <h3>Student First</h3>
                <p>Exclusive campus discounts, easy installment options, and 24/7 support. Because we believe tech should be accessible to every learner.</p>
            </div>
        </div>

        <!-- Payment methods + additional system details (cash on delivery & Telebirr simulation) -->
        <div class="payment-showcase">
            <h3><i class="fas fa-credit-card"></i> Flexible & Modern Payments</h3>
            <div class="payment-methods">
                <div class="method-item"><i class="fas fa-money-bill-wave"></i> Cash on Delivery</div>
                <div class="method-item"><i class="fas fa-mobile-alt"></i> Telebirr Simulation</div>
                <div class="method-item"><i class="fab fa-cc-visa"></i> Credit / Debit Card</div>
                <div class="method-item"><i class="fas fa-qrcode"></i> QR Code (Test)</div>
            </div>
            <p style="margin-top: 16px; font-size: 0.9rem; color: #3a5a78;">
                <i class="fas fa-flask"></i> Campus project integration: Telebirr sandbox simulation and Cash on Delivery fully supported. 
                Order processing, invoice generation, and real-time cart sync included.
            </p>
        </div>

        <!-- Additional system highlight: cart, order processing -->
        <hr>
        <div style="display: flex; flex-wrap: wrap; justify-content: space-between; gap: 1rem; align-items: center;">
            <div>
                <i class="fas fa-shopping-basket" style="color: #2463eb; font-size: 1.8rem; margin-right: 12px; vertical-align: middle;"></i>
                <span style="font-weight: 600;">Complete order lifecycle</span> 
                <span style="color: #4a627a;">— from cart to doorstep, with live updates.</span>
            </div>
            <div class="btn-outline-light">
                <i class="fas fa-rocket"></i> Explore Demo
            </div>
        </div>

        <!-- Mission quote / vision statement -->
        <div class="mission-quote">
            <p><i class="fas fa-quote-left" style="margin-right: 8px; color: #2463eb;"></i> 
                🎯 Our mission is to build a simple but powerful online shopping experience, 
                blending modern design with robust e-commerce logic — exclusively for the campus community and beyond.
            </p>
        </div>

        <!-- Additional context about system capabilities (optional) -->
        <div style="margin-top: 1rem; display: flex; flex-wrap: wrap; gap: 1rem; justify-content: space-between; font-size: 0.85rem; color: #5f7f9e;">
            <span><i class="fas fa-database"></i> Product Management Suite</span>
            <span><i class="fas fa-chart-line"></i> Order Analytics Dashboard</span>
            <span><i class="fas fa-robot"></i> AI Recommendations (demo)</span>
            <span><i class="fas fa-tachometer-alt"></i> Admin Panel Ready</span>
        </div>
    </div>
</div>

<!-- ==================== SMART FOOTER (replaces footer.jsp) ==================== -->
<footer class="smart-footer">
    <div class="footer-content">
        <div>© 2025 Smart Electronics — Campus Innovation Project</div>
        <div class="footer-links">
            <a href="#"><i class="fab fa-twitter"></i> Twitter</a>
            <a href="#"><i class="fab fa-github"></i> GitHub</a>
            <a href="#"><i class="fas fa-envelope"></i> Contact</a>
            <a href="#"><i class="fas fa-shield-alt"></i> Privacy</a>
        </div>
        <div>
            <i class="fas fa-map-marker-alt"></i> Addis Ababa, Ethiopia
        </div>
    </div>
</footer>

<!-- (optional) simple interactive script to simulate modern UI behavior: just console greeting, no backend required -->
<script>
    (function() {
        console.log("Smart Electronics About Page — Modern UI Loaded");
        // highlight cart badge maybe, just for fun but no backend needed
        const cartBtn = document.querySelector('.cart-badge');
        if(cartBtn) {
            cartBtn.addEventListener('click', (e) => {
                e.preventDefault();
                alert('🛒 Cart system simulation: 0 items. Add products from product page!');
            });
        }
        // demo button alert
        const demoBtn = document.querySelector('.btn-outline-light');
        if(demoBtn) {
            demoBtn.addEventListener('click', () => {
                alert('✨ Explore demo: full product management & Telebirr simulation ready. (Campus Project)');
            });
        }
    })();
</script>
<jsp:include page="footer.jsp" />
</body>
</html>