<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Contact Us | Smart Electronics</title>
    <!-- Google Fonts: modern sans-serif (Inter) -->
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


        /* ========== CONTACT WRAPPER ========== */
        .contact-wrapper {
            flex: 1;
            max-width: 1280px;
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        /* glass card container */
        .glass-card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            border-radius: 2rem;
            box-shadow: 0 25px 45px -12px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.02);
            border: 1px solid rgba(255, 255, 255, 0.6);
            padding: 2.5rem;
            transition: transform 0.2s ease;
        }

        /* two column layout: contact info + form */
        .contact-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 2.5rem;
        }

        .contact-info {
            flex: 1.2;
            min-width: 240px;
        }

        .contact-form-area {
            flex: 1.8;
            min-width: 280px;
        }

        .section-title {
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(145deg, #1f2e3f, #0f2b3d);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            margin-bottom: 1.5rem;
            letter-spacing: -0.02em;
        }

        .info-card {
            background: rgba(255, 255, 255, 0.7);
            border-radius: 1.5rem;
            padding: 1.2rem 1.5rem;
            margin-bottom: 1.5rem;
            transition: all 0.2s;
            border: 1px solid rgba(255,255,255,0.5);
        }

        .info-card:hover {
            background: white;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
            transform: translateY(-3px);
        }

        .info-icon {
            width: 48px;
            height: 48px;
            background: #eef3ff;
            border-radius: 1.2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }

        .info-icon i {
            font-size: 1.6rem;
            color: #2463eb;
        }

        .info-card h3 {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .info-card p, .info-card a {
            color: #3a5a78;
            text-decoration: none;
            font-weight: 500;
            transition: 0.2s;
            line-height: 1.4;
        }

        .info-card a:hover {
            color: #2463eb;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-icon {
            background: white;
            width: 42px;
            height: 42px;
            border-radius: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2463eb;
            font-size: 1.3rem;
            transition: 0.2s;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            text-decoration: none;
        }

        .social-icon:hover {
            background: #2463eb;
            color: white;
            transform: scale(1.05);
        }

        /* modern form styling */
        .modern-form {
            display: flex;
            flex-direction: column;
            gap: 1.2rem;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .input-group label {
            font-weight: 600;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .input-group label i {
            color: #2463eb;
            font-size: 0.8rem;
        }

        .modern-input, .modern-textarea {
            width: 100%;
            padding: 0.9rem 1.2rem;
            font-family: 'Inter', sans-serif;
            font-size: 1rem;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 1rem;
            transition: all 0.2s;
            outline: none;
            color: #1e293b;
        }

        .modern-input:focus, .modern-textarea:focus {
            border-color: #2463eb;
            box-shadow: 0 0 0 3px rgba(36, 99, 235, 0.2);
        }

        .modern-textarea {
            resize: vertical;
            min-height: 120px;
        }

        .btn-submit {
            background: linear-gradient(105deg, #2463eb, #1a4bc4);
            border: none;
            padding: 0.9rem 1.8rem;
            border-radius: 2rem;
            font-weight: 600;
            font-size: 1rem;
            color: white;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            cursor: pointer;
            transition: 0.2s;
            box-shadow: 0 6px 14px rgba(36, 99, 235, 0.25);
            width: fit-content;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            background: linear-gradient(105deg, #1f58d4, #0f42aa);
            box-shadow: 0 12px 20px -8px rgba(36, 99, 235, 0.4);
        }

        hr {
            margin: 1.5rem 0;
            border: none;
            height: 1px;
            background: linear-gradient(to right, transparent, #cbd5e1, transparent);
        }

        .map-placeholder {
            background: #eef2fa;
            border-radius: 1rem;
            padding: 0.8rem;
            text-align: center;
            margin-top: 1rem;
            font-size: 0.85rem;
            color: #4a627a;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            border: 1px dashed #b9d0f0;
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
            .glass-card {
                padding: 1.8rem;
            }
            .section-title {
                font-size: 1.7rem;
            }
            .btn-submit {
                width: 100%;
                justify-content: center;
            }
        }

        @media (max-width: 680px) {
            .contact-grid {
                flex-direction: column;
            }
        }

        /* success toast (JS simulation) */
        .toast-notify {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #1e293b;
            color: white;
            padding: 12px 24px;
            border-radius: 60px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 12px;
            box-shadow: 0 12px 20px rgba(0,0,0,0.2);
            backdrop-filter: blur(8px);
            z-index: 1000;
            transform: translateY(100px);
            opacity: 0;
            transition: 0.25s ease;
            pointer-events: none;
        }
        .toast-notify.show {
            transform: translateY(0);
            opacity: 1;
        }
        .toast-notify i {
            font-size: 1.2rem;
            color: #4ade80;
        }
    </style>
     <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>

<jsp:include page="header.jsp" />
<!-- MAIN CONTACT SECTION -->
<div class="contact-wrapper">
    <div class="glass-card">
        <div class="contact-grid">
            <!-- LEFT COLUMN: contact info + address + social -->
            <div class="contact-info">
                <h2 class="section-title">Let's talk</h2>
                <p style="margin-bottom: 1.8rem; color: #4a627a;">Have questions, feedback, or partnership ideas? We’d love to hear from you. Reach out anytime.</p>
                
                <div class="info-card">
                    <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                    <h3>Visit Campus Hub</h3>
                    <p>Debre Markos University,<br>Engineering & Technology Faculty, Ethiopia</p>
                </div>
                
                <div class="info-card">
                    <div class="info-icon"><i class="fas fa-envelope"></i></div>
                    <h3>Email us</h3>
                    <a href="mailto:smartelectronics@gmail.com">smart electronics@gmail.com</a>
                    <p style="margin-top: 6px; font-size: 0.85rem;">Response within 24h</p>
                </div>
                
                <div class="info-card">
                    <div class="info-icon"><i class="fas fa-phone-alt"></i></div>
                    <h3>Call / Support</h3>
                    <p><a href="tel:+251911000000">+251 911 000 000</a><br>Mon–Fri, 9:00 – 18:00 EAT</p>
                </div>

                <div class="info-card">
                    <h3><i class="fab fa-telegram"></i> Connect socially</h3>
                    <div class="social-links">
                        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-github"></i></a>
                    </div>
                </div>

                <!-- map simulation (clean design) -->
                <div class="map-placeholder">
                    <i class="fas fa-map-pin" style="color:#2463eb;"></i> Debre Markos University, Ethiopia — Innovation Lab
                </div>
            </div>

            <!-- RIGHT COLUMN: dynamic form -->
            <div class="contact-form-area">
                <h2 class="section-title" style="margin-top: 0;">Send message</h2>
                <form id="smartContactForm" class="modern-form" action="#" method="post">
                    <div class="input-group">
                        <label><i class="fas fa-user-astronaut"></i> Full name</label>
                        <input type="text" name="name" id="name" class="modern-input" placeholder="e.g. Alex Bekele" required>
                    </div>
                    <div class="input-group">
                        <label><i class="fas fa-envelope-open-text"></i> Email address</label>
                        <input type="email" name="email" id="email" class="modern-input" placeholder="hello@example.com" required>
                    </div>
                    <div class="input-group">
                        <label><i class="fas fa-edit"></i> Your message</label>
                        <textarea name="message" id="message" class="modern-textarea" placeholder="Tell us about your inquiry, feedback, or collaboration idea..." rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn-submit"><i class="fas fa-paper-plane"></i> Send message</button>
                    <p style="font-size: 0.75rem; color: #6c8eae; margin-top: 0.5rem;"><i class="fas fa-lock"></i> We'll never share your details. Demo simulation — your feedback matters.</p>
                </form>
            </div>
        </div>
        
        <!-- additional modern touch: team note -->
        <hr>
        <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
            <div><i class="fas fa-headset" style="color: #2463eb;"></i> <strong>24/7 live support</strong> — campus representatives ready to assist.</div>
            <div><i class="fas fa-clock"></i> Avg. response time: 2 hours</div>
        </div>
    </div>
</div>

<!-- MODERN FOOTER (matching about page) -->
<footer class="smart-footer" style="background: rgba(255, 255, 255, 0.92); backdrop-filter: blur(8px); border-top: 1px solid rgba(0, 0, 0, 0.05); margin-top: 2rem; padding: 1.8rem 2rem; text-align: center; font-size: 0.9rem; color: #4a627a;">
    <div style="max-width: 1280px; margin: 0 auto; display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; gap: 1rem;">
        <div>© 2025 Smart Electronics — Campus Innovation Project</div>
        <div style="display: flex; gap: 1.5rem;">
            <a href="#" style="text-decoration: none; color: #4a627a;"><i class="fab fa-twitter"></i> Twitter</a>
            <a href="#" style="text-decoration: none; color: #4a627a;"><i class="fab fa-github"></i> GitHub</a>
            <a href="#" style="text-decoration: none; color: #4a627a;"><i class="fas fa-envelope"></i> Contact</a>
            <a href="#" style="text-decoration: none; color: #4a627a;"><i class="fas fa-shield-alt"></i> Privacy</a>
        </div>
        <div><i class="fas fa-map-marker-alt"></i> Addis Ababa, Ethiopia</div>
    </div>
</footer>

<!-- Toast notification for demo submission -->
<div id="formToast" class="toast-notify">
    <i class="fas fa-check-circle"></i> <span>Message sent! (Demo) We'll get back soon.</span>
</div>

<script>
    (function() {
        // modern contact form handler with smooth UX
        const contactForm = document.getElementById('smartContactForm');
        const toastEl = document.getElementById('formToast');
        
        function showToastMessage(message) {
            const toastSpan = toastEl.querySelector('span');
            if(toastSpan) toastSpan.textContent = message || "Message sent! (Demo) We'll get back soon.";
            toastEl.classList.add('show');
            setTimeout(() => {
                toastEl.classList.remove('show');
            }, 3800);
        }

        if(contactForm) {
            contactForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // get values for validation feedback (simple)
                const nameInput = document.getElementById('name');
                const emailInput = document.getElementById('email');
                const messageInput = document.getElementById('message');
                
                let isValid = true;
                if(!nameInput.value.trim()) {
                    nameInput.style.borderColor = "#e53e3e";
                    isValid = false;
                } else {
                    nameInput.style.borderColor = "#e2e8f0";
                }
                if(!emailInput.value.trim() || !emailInput.value.includes('@')) {
                    emailInput.style.borderColor = "#e53e3e";
                    isValid = false;
                } else {
                    emailInput.style.borderColor = "#e2e8f0";
                }
                if(!messageInput.value.trim()) {
                    messageInput.style.borderColor = "#e53e3e";
                    isValid = false;
                } else {
                    messageInput.style.borderColor = "#e2e8f0";
                }
                
                if(isValid) {
                    // simulate form submission (demo environment)
                    console.log(`📨 Contact form submitted: Name=${nameInput.value}, Email=${emailInput.value}, Message=${messageInput.value}`);
                    showToastMessage(`✨ Thanks ${nameInput.value.split(' ')[0]}! Your message has been received.`);
                    contactForm.reset();
                    // reset borders after reset
                    nameInput.style.borderColor = "#e2e8f0";
                    emailInput.style.borderColor = "#e2e8f0";
                    messageInput.style.borderColor = "#e2e8f0";
                } else {
                    showToastMessage("⚠️ Please fill all fields correctly.");
                }
            });
            
            // remove red border on typing
            const fields = ['name', 'email', 'message'];
            fields.forEach(fieldId => {
                const field = document.getElementById(fieldId);
                if(field) {
                    field.addEventListener('input', function() {
                        this.style.borderColor = "#e2e8f0";
                    });
                }
            });
        }
        
        // cart badge interaction (demo)
        const cartBtn = document.querySelector('.cart-badge');
        if(cartBtn) {
            cartBtn.addEventListener('click', (e) => {
                e.preventDefault();
                alert('🛒 Cart system: 0 items. Add products from product catalog!');
            });
        }
        
        // simple demo of dynamic year in footer (optional)
        const footerYearSpan = document.querySelector('.smart-footer div:first-child');
        if(footerYearSpan) {
            // already static, but nice to keep.
        }
    })();
</script>

<style>
    /* additional footer style fix */
    .smart-footer {
        background: rgba(255, 255, 255, 0.92);
        backdrop-filter: blur(8px);
        border-top: 1px solid rgba(0, 0, 0, 0.05);
        margin-top: 2rem;
        padding: 1.8rem 2rem;
        text-align: center;
        font-size: 0.9rem;
        color: #4a627a;
    }
    .smart-footer a {
        text-decoration: none;
        transition: color 0.2s;
    }
    .smart-footer a:hover {
        color: #2463eb;
    }
</style>
<jsp:include page="footer.jsp" />
</body>
</html>