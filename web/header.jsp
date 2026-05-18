<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String user = (String) session.getAttribute("user");
    Boolean isAdmin = (Boolean) session.getAttribute("admin");
%>

<!-- Modern Smart Header - Only UI changed, logic preserved -->
<header class="smart-header-modern">
    <div class="header-container">
        <!-- Logo Section -->
        <div class="brand-area">
            <div class="logo-icon-modern">
                <i class="fas fa-microchip"></i>
            </div>
            <div class="logo-text-modern">
                Smart<span>Electronics</span>
            </div>
        </div>

        <!-- Search Bar - Enhanced -->
        <form action="SearchServlet" method="get" class="search-form-modern">
            <div class="search-wrapper">
                <i class="fas fa-search search-icon"></i>
                <input type="text" name="query" placeholder="Search products..." required>
                <button type="submit">Search</button>
            </div>
        </form>

        <!-- Navigation Links -->
        <nav class="nav-links-modern">
            <a href="index.jsp" class="nav-item">
                <i class="fas fa-home"></i>
                <span>Home</span>
            </a>
            <a href="products.jsp" class="nav-item">
                <i class="fas fa-mobile-alt"></i>
                <span>Products</span>
            </a>
            <a href="cart.jsp" class="nav-item cart-nav">
                <i class="fas fa-shopping-cart"></i>
                <span>Cart</span>
                <span class="cart-badge-dynamic" id="cartCountBadge">0</span>
            </a>

            <% if(user == null){ %>
                <a href="login.html" class="nav-item auth-btn">
                    <i class="fas fa-sign-in-alt"></i>
                    <span>Login</span>
                </a>
                <a href="register.html" class="nav-item auth-btn register-btn">
                    <i class="fas fa-user-plus"></i>
                    <span>Register</span>
                </a>
            <% } else { %>
                <a href="orders.jsp" class="nav-item">
                    <i class="fas fa-clipboard-list"></i>
                    <span>My Orders</span>
                </a>
                <% String role = (String) session.getAttribute("role");
                   if(role != null && role.equals("admin")){ %>
                   <a href="admin_products.jsp" class="nav-item admin-nav">
                       <i class="fas fa-user-shield"></i>
                       <span>Admin Panel</span>
                   </a>
                <% } %>
                <div class="user-menu">
                    <div class="user-avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="user-dropdown">
                        <span class="welcome-name">Welcome, <%= user %></span>
                        <a href="LogoutServlet" class="logout-link">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </div>
                </div>
            <% } %>

            <% if(isAdmin != null && isAdmin){ %>
                <a href="admin.jsp" class="nav-item admin-nav">
                    <i class="fas fa-user-cog"></i>
                    <span>Admin</span>
                </a>
            <% } %>
        </nav>

        <!-- Mobile Menu Toggle -->
        <button class="mobile-menu-toggle" id="mobileMenuToggle" aria-label="Menu">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</header>

<!-- Mobile Navigation Panel -->
<div class="mobile-nav-panel" id="mobileNavPanel">
    <div class="mobile-nav-header">
        <div class="mobile-logo">SmartElectronics</div>
        <button class="close-mobile-menu" id="closeMobileMenu">&times;</button>
    </div>
    <div class="mobile-nav-links">
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="products.jsp"><i class="fas fa-mobile-alt"></i> Products</a>
        <a href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
        <% if(user == null){ %>
            <a href="login.html"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a href="register.html"><i class="fas fa-user-plus"></i> Register</a>
        <% } else { %>
            <a href="orders.jsp"><i class="fas fa-clipboard-list"></i> My Orders</a>
            <% String role = (String) session.getAttribute("role");
               if(role != null && role.equals("admin")){ %>
               <a href="admin_products.jsp"><i class="fas fa-user-shield"></i> Admin Panel</a>
            <% } %>
            <div class="mobile-user-info">
                <i class="fas fa-user-circle"></i> Welcome, <%= user %>
            </div>
            <a href="LogoutServlet" class="mobile-logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        <% } %>
        <% if(isAdmin != null && isAdmin){ %>
            <a href="admin.jsp"><i class="fas fa-user-cog"></i> Admin</a>
        <% } %>
    </div>
</div>

<!-- Font Awesome Icons (required for icons) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    /* ============================================ */
    /* MODERN HEADER CSS - SMART ELECTRONICS        */
    /* Copy this entire style block to style.css    */
    /* ============================================ */
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', sans-serif;
        background: #f5f7fe;
    }

    /* Modern Header Styles */
    .smart-header-modern {
        background: rgba(255, 255, 255, 0.96);
        backdrop-filter: blur(10px);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        position: sticky;
        top: 0;
        z-index: 1000;
        border-bottom: 1px solid rgba(36, 99, 235, 0.1);
    }

    .header-container {
        max-width: 1400px;
        margin: 0 auto;
        padding: 0.8rem 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 1.5rem;
        flex-wrap: wrap;
    }

    /* Brand Area */
    .brand-area {
        display: flex;
        align-items: center;
        gap: 12px;
        cursor: pointer;
        transition: transform 0.2s;
    }

    .brand-area:hover {
        transform: scale(1.02);
    }

    .logo-icon-modern {
        background: linear-gradient(135deg, #2463eb, #0a4ac0);
        width: 45px;
        height: 45px;
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 8px 16px -6px rgba(36, 99, 235, 0.3);
    }

    .logo-icon-modern i {
        font-size: 1.6rem;
        color: white;
    }

    .logo-text-modern {
        font-size: 1.6rem;
        font-weight: 800;
        letter-spacing: -0.5px;
        background: linear-gradient(135deg, #1e2a3e, #0f2b3d);
        background-clip: text;
        -webkit-background-clip: text;
        color: transparent;
    }

    .logo-text-modern span {
        background: linear-gradient(135deg, #2463eb, #3b82f6);
        background-clip: text;
        -webkit-background-clip: text;
        color: transparent;
    }

    /* Search Form */
    .search-form-modern {
        flex: 1;
        max-width: 450px;
        min-width: 200px;
    }

    .search-wrapper {
        position: relative;
        display: flex;
        align-items: center;
        background: white;
        border-radius: 60px;
        border: 1px solid #e2e8f0;
        transition: all 0.3s;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
    }

    .search-wrapper:focus-within {
        border-color: #2463eb;
        box-shadow: 0 0 0 3px rgba(36, 99, 235, 0.1);
        transform: scale(1.01);
    }

    .search-icon {
        position: absolute;
        left: 18px;
        color: #94a3b8;
        font-size: 1rem;
        pointer-events: none;
    }

    .search-wrapper input {
        width: 100%;
        padding: 0.85rem 1rem 0.85rem 3rem;
        border: none;
        border-radius: 60px;
        font-size: 0.95rem;
        font-family: 'Inter', sans-serif;
        outline: none;
        background: transparent;
    }

    .search-wrapper button {
        background: linear-gradient(135deg, #2463eb, #1a4bc4);
        border: none;
        padding: 0.7rem 1.6rem;
        margin: 4px;
        border-radius: 60px;
        color: white;
        font-weight: 600;
        font-size: 0.85rem;
        cursor: pointer;
        transition: all 0.2s;
        font-family: 'Inter', sans-serif;
    }

    .search-wrapper button:hover {
        background: linear-gradient(135deg, #1a4bc4, #0f3da0);
        transform: scale(0.98);
    }

    /* Navigation Links */
    .nav-links-modern {
        display: flex;
        align-items: center;
        gap: 0.6rem;
        flex-wrap: wrap;
    }

    .nav-item {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 0.6rem 1.2rem;
        border-radius: 40px;
        text-decoration: none;
        color: #334155;
        font-weight: 500;
        font-size: 0.9rem;
        transition: all 0.2s;
        position: relative;
    }

    .nav-item i {
        font-size: 1rem;
        color: #64748b;
        transition: 0.2s;
    }

    .nav-item:hover {
        background: #f1f5f9;
        color: #2463eb;
    }

    .nav-item:hover i {
        color: #2463eb;
    }

    .cart-nav {
        position: relative;
    }

    .cart-badge-dynamic {
        position: absolute;
        top: -5px;
        right: -5px;
        background: #ef4444;
        color: white;
        font-size: 0.65rem;
        font-weight: 700;
        padding: 2px 6px;
        border-radius: 30px;
        min-width: 18px;
        text-align: center;
    }

    /* Auth Buttons */
    .auth-btn {
        background: #f8fafc;
        border: 1px solid #e2e8f0;
    }

    .register-btn {
        background: linear-gradient(135deg, #2463eb, #3b82f6);
        color: white;
        border: none;
    }

    .register-btn i {
        color: white;
    }

    .register-btn:hover {
        background: linear-gradient(135deg, #1a4bc4, #2463eb);
        color: white;
    }

    /* User Menu Dropdown */
    .user-menu {
        position: relative;
        cursor: pointer;
    }

    .user-avatar {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 0.5rem 1rem;
        background: #f1f5f9;
        border-radius: 40px;
        transition: 0.2s;
    }

    .user-avatar i {
        font-size: 1.3rem;
        color: #2463eb;
    }

    .user-avatar:hover {
        background: #e2e8f0;
    }

    .user-dropdown {
        position: absolute;
        top: 120%;
        right: 0;
        background: white;
        border-radius: 16px;
        box-shadow: 0 20px 35px -8px rgba(0, 0, 0, 0.15);
        min-width: 180px;
        padding: 0.8rem 0;
        opacity: 0;
        visibility: hidden;
        transition: all 0.2s;
        z-index: 100;
        border: 1px solid #eef2ff;
    }

    .user-menu:hover .user-dropdown {
        opacity: 1;
        visibility: visible;
        top: 100%;
    }

    .welcome-name {
        display: block;
        padding: 0.6rem 1.2rem;
        font-weight: 600;
        color: #1e293b;
        border-bottom: 1px solid #eef2ff;
        font-size: 0.85rem;
    }

    .logout-link {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 0.6rem 1.2rem;
        text-decoration: none;
        color: #ef4444;
        font-size: 0.85rem;
        transition: 0.2s;
    }

    .logout-link:hover {
        background: #fef2f2;
    }

    /* Admin Nav */
    .admin-nav {
        background: #fef3c7;
        color: #d97706;
    }

    .admin-nav i {
        color: #d97706;
    }

    /* Mobile Menu */
    .mobile-menu-toggle {
        display: none;
        background: none;
        border: none;
        font-size: 1.6rem;
        cursor: pointer;
        color: #1e293b;
        padding: 0.5rem;
    }

    .mobile-nav-panel {
        position: fixed;
        top: 0;
        left: -280px;
        width: 280px;
        height: 100%;
        background: white;
        box-shadow: 5px 0 25px rgba(0, 0, 0, 0.1);
        z-index: 1001;
        transition: left 0.3s ease;
        display: flex;
        flex-direction: column;
    }

    .mobile-nav-panel.open {
        left: 0;
    }

    .mobile-nav-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1.5rem;
        border-bottom: 1px solid #e2e8f0;
        font-weight: 700;
        font-size: 1.2rem;
        background: linear-gradient(135deg, #2463eb, #1a4bc4);
        color: white;
    }

    .close-mobile-menu {
        background: none;
        border: none;
        font-size: 1.8rem;
        cursor: pointer;
        color: white;
    }

    .mobile-nav-links {
        display: flex;
        flex-direction: column;
        padding: 1rem;
        gap: 0.5rem;
    }

    .mobile-nav-links a {
        padding: 0.8rem 1rem;
        text-decoration: none;
        color: #334155;
        border-radius: 12px;
        transition: 0.2s;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .mobile-nav-links a:hover {
        background: #f1f5f9;
        color: #2463eb;
    }

    .mobile-user-info {
        padding: 0.8rem 1rem;
        background: #f8fafc;
        border-radius: 12px;
        margin: 0.5rem 0;
        font-weight: 500;
    }

    .mobile-logout {
        color: #ef4444 !important;
    }

    /* Overlay */
    .mobile-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 1000;
        display: none;
    }

    /* Responsive */
    @media (max-width: 1024px) {
        .header-container {
            flex-wrap: wrap;
        }
        .nav-links-modern {
            order: 3;
            width: 100%;
            justify-content: center;
            margin-top: 0.5rem;
        }
        .search-form-modern {
            max-width: 350px;
        }
    }

    @media (max-width: 820px) {
        .nav-links-modern {
            display: none;
        }
        .mobile-menu-toggle {
            display: block;
        }
        .search-form-modern {
            flex: 2;
        }
        .header-container {
            padding: 0.8rem 1.2rem;
        }
    }

    @media (max-width: 580px) {
        .search-wrapper input {
            padding: 0.7rem 1rem 0.7rem 2.5rem;
            font-size: 0.85rem;
        }
        .search-wrapper button {
            padding: 0.5rem 1rem;
            font-size: 0.75rem;
        }
        .logo-text-modern {
            font-size: 1.2rem;
        }
        .logo-icon-modern {
            width: 38px;
            height: 38px;
        }
    }
</style>

<!-- JavaScript for mobile menu and cart badge simulation -->
<script>
    (function() {
        // Mobile menu toggle
        const toggleBtn = document.getElementById('mobileMenuToggle');
        const mobilePanel = document.getElementById('mobileNavPanel');
        const closeBtn = document.getElementById('closeMobileMenu');
        
        function createOverlay() {
            let overlay = document.querySelector('.mobile-overlay');
            if(!overlay) {
                overlay = document.createElement('div');
                overlay.className = 'mobile-overlay';
                document.body.appendChild(overlay);
                overlay.addEventListener('click', closeMobileMenu);
            }
            return overlay;
        }
        
        function openMobileMenu() {
            const overlay = createOverlay();
            mobilePanel.classList.add('open');
            overlay.style.display = 'block';
            document.body.style.overflow = 'hidden';
        }
        
        function closeMobileMenu() {
            mobilePanel.classList.remove('open');
            const overlay = document.querySelector('.mobile-overlay');
            if(overlay) overlay.style.display = 'none';
            document.body.style.overflow = '';
        }
        
        if(toggleBtn) toggleBtn.addEventListener('click', openMobileMenu);
        if(closeBtn) closeBtn.addEventListener('click', closeMobileMenu);
        
        // Optional: Update cart badge dynamically from localStorage or session
        function updateCartBadge() {
            const badge = document.getElementById('cartCountBadge');
            if(badge) {
                let cart = JSON.parse(localStorage.getItem('smartCart')) || [];
                let totalItems = cart.reduce((sum, item) => sum + (item.quantity || 1), 0);
                badge.textContent = totalItems;
                if(totalItems === 0) badge.style.display = 'none';
                else badge.style.display = 'inline-block';
            }
        }
        
        // Example: listen for storage events (if other pages update cart)
        window.addEventListener('storage', function(e) {
            if(e.key === 'smartCart') updateCartBadge();
        });
        updateCartBadge();
        
        // For demo, simulate cart count from any existing logic (optional)
        // You can integrate with your actual cart servlet later.
        console.log("Modern header loaded - UI enhanced, logic unchanged");
    })();
</script>