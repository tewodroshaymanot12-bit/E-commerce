<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- ========== MODERN SMART FOOTER - SMART ELECTRONICS ========== -->
<!-- 
    This footer.jsp is designed to be included in all pages.
    It uses modern glassmorphism, flex grid, hover effects, and dynamic year.
    CSS and JS are separated but also includes inline critical styles for robustness.
    Recommended to link style.css (provided below) and include footer.js.
-->

<footer class="smart-footer-v2">
    <div class="footer-wave-separator">
        <svg viewBox="0 0 1200 120" preserveAspectRatio="none" class="wave-svg">
            <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="wave-fill"></path>
        </svg>
    </div>
    <div class="footer-main-container">
        <div class="footer-grid">
            <!-- brand column -->
            <div class="footer-brand">
                <div class="footer-logo">
                    <div class="logo-icon-footer">
                        <i class="fas fa-microchip"></i>
                    </div>
                    <span class="logo-text-footer">SmartElectronics</span>
                </div>
                <p class="brand-description">
                    Modern e-commerce platform for campus innovation. Quality electronics, seamless experience, and student-first approach.
                </p>
                <div class="footer-badge">
                    <span><i class="fas fa-shield-alt"></i> Secure Checkout</span>
                    <span><i class="fas fa-truck-fast"></i> Fast Delivery</span>
                </div>
            </div>

            <!-- quick links column -->
            <div class="footer-links-col">
                <h4 class="footer-title"><i class="fas fa-compass"></i> Quick Links</h4>
                <ul class="footer-links-list">
                    <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="products.jsp"><i class="fas fa-mobile-alt"></i> Products</a></li>
                    <li><a href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                    <li><a href="orders.jsp"><i class="fas fa-clipboard-list"></i> My Orders</a></li>
                    <li><a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
                    <li><a href="contact.jsp"><i class="fas fa-headset"></i> Contact Us</a></li>
                </ul>
            </div>

            <!-- support & account -->
            <div class="footer-links-col">
                <h4 class="footer-title"><i class="fas fa-life-ring"></i> Support</h4>
                <ul class="footer-links-list">
                    <li><a href="#"><i class="fas fa-question-circle"></i> FAQ</a></li>
                    <li><a href="#"><i class="fas fa-exchange-alt"></i> Returns Policy</a></li>
                    <li><a href="#"><i class="fas fa-lock"></i> Privacy Center</a></li>
                    <li><a href="#"><i class="fas fa-truck"></i> Tracking Order</a></li>
                    <li><a href="contact.jsp"><i class="fas fa-envelope"></i> 24/7 Support</a></li>
                </ul>
            </div>

            <!-- contact & social column -->
            <div class="footer-contact-col">
                <h4 class="footer-title"><i class="fas fa-address-card"></i> Connect</h4>
                <div class="contact-details">
                    <p><i class="fas fa-map-marker-alt"></i> Debre Markos University, Ethiopia</p>
                    <p><i class="fas fa-phone-alt"></i> +251 962 541 317</p>
                    <p><i class="fas fa-envelope"></i> sosnaadugna364@gmail.com</p>
                </div>
                <div class="social-icons-modern">
                    <a href="#" class="social-icon-circle" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-icon-circle" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon-circle" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="social-icon-circle" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#" class="social-icon-circle" aria-label="Telegram"><i class="fab fa-telegram-plane"></i></a>
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="payment-methods-footer">
                <span><i class="fab fa-cc-visa"></i> Visa</span>
                <span><i class="fab fa-cc-mastercard"></i> Mastercard</span>
                <span><i class="fas fa-money-bill-wave"></i> Cash on Delivery</span>
                <span><i class="fas fa-mobile-alt"></i> Telebirr</span>
            </div>
            <div class="copyright">
                <p>&copy; <span id="dynamicYear"></span> Sosna's Smart Electronics — All rights reserved. | Built with <i class="fas fa-heart" style="color: #ff4d6d;"></i> for campus project</p>
            </div>
        </div>
    </div>
</footer>

<!-- Font Awesome 6 (free) and required JS for dynamic year -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script>
    // dynamic year update + smooth footer enhancements
    (function() {
        // set current year
        const yearSpan = document.getElementById('dynamicYear');
        if(yearSpan) {
            yearSpan.textContent = new Date().getFullYear();
        }
        // optional: add hover effect console log (just for fun)
        console.log("Smart Electronics Footer v2 loaded - modern glassmorphism");
    })();
</script>

<!-- ========== CSS FOR THIS FOOTER (to be added in style.css) ========== -->
<!-- 
    NOTE: The following CSS block should be merged into your global style.css file.
    It contains all the modern styling for the footer.
    For convenience, I've provided the complete CSS rules. Add them to style.css.
-->

<style>
/* ========== MODERN FOOTER V2 - SMART ELECTRONICS ========== */
/* Use this inside style.css or as embedded style (recommended in external CSS) */

.smart-footer-v2 {
    background: linear-gradient(145deg, #0a1928 0%, #0c1f2f 100%);
    color: #e2e8f0;
    position: relative;
    margin-top: 3rem;
    font-family: 'Inter', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;
    border-top: 1px solid rgba(36, 99, 235, 0.2);
}

.footer-wave-separator {
    position: relative;
    top: -2px;
    line-height: 0;
    overflow: hidden;
}

.wave-svg {
    position: relative;
    display: block;
    width: calc(100% + 1.3px);
    height: 48px;
}

.wave-fill {
    fill: #0c1f2f;
    transition: fill 0.3s ease;
}

.footer-main-container {
    max-width: 1280px;
    margin: 0 auto;
    padding: 2.5rem 2rem 1.5rem;
}

.footer-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 2.2rem;
    margin-bottom: 2.5rem;
}

.footer-brand {
    max-width: 300px;
}

.footer-logo {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 1rem;
}

.logo-icon-footer {
    background: linear-gradient(145deg, #2463eb, #0a4ac0);
    width: 42px;
    height: 42px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 8px 18px rgba(36, 99, 235, 0.3);
}

.logo-icon-footer i {
    font-size: 1.5rem;
    color: white;
}

.logo-text-footer {
    font-weight: 800;
    font-size: 1.5rem;
    letter-spacing: -0.3px;
    background: linear-gradient(135deg, #ffffff, #aac9ff);
    background-clip: text;
    -webkit-background-clip: text;
    color: transparent;
}

.brand-description {
    font-size: 0.85rem;
    line-height: 1.5;
    color: #b9d0f0;
    margin: 0.75rem 0 1rem;
}

.footer-badge {
    display: flex;
    flex-wrap: wrap;
    gap: 0.8rem;
    margin-top: 0.5rem;
}

.footer-badge span {
    background: rgba(36, 99, 235, 0.2);
    backdrop-filter: blur(4px);
    padding: 0.3rem 0.9rem;
    border-radius: 40px;
    font-size: 0.7rem;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: #c7e0ff;
}

.footer-title {
    font-size: 1.1rem;
    font-weight: 600;
    margin-bottom: 1.2rem;
    letter-spacing: -0.2px;
    position: relative;
    display: inline-block;
    color: #f0f4fc;
}

.footer-title i {
    color: #3b82f6;
    margin-right: 8px;
}

.footer-title:after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 40px;
    height: 2px;
    background: linear-gradient(90deg, #3b82f6, transparent);
    border-radius: 2px;
}

.footer-links-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.footer-links-list li {
    margin-bottom: 0.7rem;
}

.footer-links-list a {
    color: #cbd5e6;
    text-decoration: none;
    transition: all 0.2s;
    font-size: 0.9rem;
    display: inline-flex;
    align-items: center;
    gap: 8px;
}

.footer-links-list a i {
    font-size: 0.8rem;
    width: 20px;
    color: #5e8bc7;
    transition: 0.2s;
}

.footer-links-list a:hover {
    color: white;
    transform: translateX(5px);
}

.footer-links-list a:hover i {
    color: #3b82f6;
}

.contact-details p {
    margin: 0.7rem 0;
    display: flex;
    align-items: center;
    gap: 12px;
    font-size: 0.85rem;
    color: #cbd5e6;
}

.contact-details i {
    width: 24px;
    color: #3b82f6;
}

.social-icons-modern {
    display: flex;
    gap: 12px;
    margin-top: 1rem;
    flex-wrap: wrap;
}

.social-icon-circle {
    background: rgba(255, 255, 255, 0.08);
    width: 38px;
    height: 38px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #e2e8f0;
    font-size: 1.1rem;
    transition: all 0.25s;
    text-decoration: none;
    border: 1px solid rgba(59, 130, 246, 0.3);
}

.social-icon-circle:hover {
    background: #2463eb;
    color: white;
    transform: translateY(-3px);
    border-color: #2463eb;
    box-shadow: 0 8px 16px -6px rgba(36, 99, 235, 0.4);
}

.footer-bottom {
    border-top: 1px solid rgba(59, 130, 246, 0.2);
    padding-top: 1.5rem;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
    gap: 1rem;
    font-size: 0.8rem;
}

.payment-methods-footer {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
}

.payment-methods-footer span {
    background: rgba(0, 0, 0, 0.3);
    padding: 0.3rem 0.9rem;
    border-radius: 40px;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: 0.75rem;
    font-weight: 500;
}

.copyright p {
    margin: 0;
    color: #8aa9cc;
}

.copyright i.fa-heart {
    animation: pulseHeart 1.5s infinite;
}

@keyframes pulseHeart {
    0% { transform: scale(1); }
    50% { transform: scale(1.15); }
    100% { transform: scale(1); }
}

/* responsive adjustments */
@media (max-width: 780px) {
    .footer-grid {
        grid-template-columns: 1fr 1fr;
        gap: 1.8rem;
    }
    .footer-brand {
        grid-column: span 2;
        max-width: 100%;
    }
    .footer-bottom {
        flex-direction: column;
        text-align: center;
    }
    .payment-methods-footer {
        justify-content: center;
    }
}

@media (max-width: 550px) {
    .footer-grid {
        grid-template-columns: 1fr;
    }
    .footer-brand {
        grid-column: span 1;
    }
    .footer-main-container {
        padding: 2rem 1.2rem 1rem;
    }
}
</style>

<!-- For full compatibility, ensure you have the Inter font in style.css or add: -->
<link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- ========== END OF MODERN FOOTER.JSP ========== -->
<!-- 
    INSTRUCTIONS:
    1. Copy the CSS section (inside <style> tags) into your global style.css file (remove the <style> wrapper).
    2. Keep the HTML and JS as is inside footer.jsp.
    3. Ensure font awesome and google fonts are linked in your main pages or header.
    4. The dynamic year updates automatically.
    5. All links are consistent with your project structure (index.jsp, products.jsp, etc.)
-->