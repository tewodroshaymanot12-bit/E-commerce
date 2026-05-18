<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="SmartElectronics.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Smart Electronics - Premium Tech Store</title>
    
    <!-- Google Fonts + Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            color: #0f172a;
        }
        
        /* Modern Hero Section */
        .hero-modern {
            position: relative;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            min-height: 85vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            isolation: isolate;
        }
        
        .hero-modern::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"><path fill="%233b82f6" fill-opacity="0.05" d="M0 0h200v200H0z"/><circle cx="100" cy="100" r="40" fill="%233b82f6" fill-opacity="0.1"/><circle cx="50" cy="50" r="20" fill="%2360a5fa" fill-opacity="0.08"/><circle cx="150" cy="150" r="30" fill="%2360a5fa" fill-opacity="0.06"/></svg>');
            background-repeat: repeat;
            opacity: 0.4;
            pointer-events: none;
        }
        
        .hero-modern::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 80%;
            height: 150%;
            background: radial-gradient(circle, rgba(59,130,246,0.15) 0%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }
        
        .hero-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 4rem 2rem;
            position: relative;
            z-index: 2;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 3rem;
            flex-wrap: wrap;
        }
        
        .hero-text {
            flex: 1;
            min-width: 280px;
            animation: fadeInUp 0.8s ease-out;
        }
        
        .hero-badge {
            display: inline-block;
            background: rgba(59,130,246,0.2);
            backdrop-filter: blur(10px);
            padding: 0.5rem 1rem;
            border-radius: 60px;
            font-size: 0.8rem;
            font-weight: 600;
            color: #60a5fa;
            margin-bottom: 1.5rem;
            letter-spacing: 0.5px;
        }
        
        .hero-text h1 {
            font-size: 3.5rem;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 1.2rem;
            background: linear-gradient(135deg, #ffffff, #94a3b8);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
        }
        
        .hero-text p {
            font-size: 1.2rem;
            color: #cbd5e6;
            margin-bottom: 2rem;
            line-height: 1.6;
        }
        
        .hero-buttons {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            color: white;
            padding: 0.9rem 2rem;
            border-radius: 60px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 10px 20px -5px rgba(59,130,246,0.4);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 25px -8px rgba(59,130,246,0.5);
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
        }
        
        .btn-outline-light {
            background: transparent;
            border: 2px solid rgba(255,255,255,0.3);
            color: white;
            padding: 0.9rem 2rem;
            border-radius: 60px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-outline-light:hover {
            background: rgba(255,255,255,0.1);
            border-color: white;
            transform: translateY(-3px);
        }
        
        .hero-visual {
            flex: 1;
            min-width: 280px;
            text-align: center;
            animation: fadeInRight 0.8s ease-out;
        }
        
        .hero-visual img {
            max-width: 100%;
            filter: drop-shadow(0 20px 30px rgba(0,0,0,0.3));
            border-radius: 2rem;
        }
        
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @keyframes fadeInRight {
            from { opacity: 0; transform: translateX(30px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        /* Features Section */
        .features-modern {
            max-width: 1280px;
            margin: 4rem auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }
        
        .feature-card-modern {
            background: white;
            border-radius: 1.5rem;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
            border: 1px solid rgba(0,0,0,0.03);
        }
        
        .feature-card-modern:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 30px -12px rgba(0,0,0,0.1);
            border-color: rgba(59,130,246,0.2);
        }
        
        .feature-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #eff6ff, #dbeafe);
            border-radius: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.2rem;
        }
        
        .feature-icon i {
            font-size: 2rem;
            color: #3b82f6;
        }
        
        .feature-card-modern h3 {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .feature-card-modern p {
            color: #475569;
            line-height: 1.5;
        }
        
        /* Products Section */
        .products-header {
            text-align: center;
            margin: 4rem 0 2rem;
        }
        
        .products-header h2 {
            font-size: 2.2rem;
            font-weight: 800;
            background: linear-gradient(135deg, #1e293b, #334155);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
        }
        
        .products-header p {
            color: #64748b;
            margin-top: 0.5rem;
        }
        
        .product-container-modern {
            max-width: 1280px;
            margin: 0 auto 4rem;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 2rem;
        }
        
        .product-card-modern {
            background: white;
            border-radius: 1.5rem;
            overflow: hidden;
            transition: all 0.3s;
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.05);
            border: 1px solid rgba(0,0,0,0.05);
            position: relative;
        }
        
        .product-card-modern:hover {
            transform: translateY(-10px);
            box-shadow: 0 25px 35px -12px rgba(0,0,0,0.15);
        }
        
        .product-image {
            position: relative;
            height: 220px;
            overflow: hidden;
            background: #f8fafc;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s;
        }
        
        .product-card-modern:hover .product-image img {
            transform: scale(1.05);
        }
        
        .product-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            background: #ef4444;
            color: white;
            font-size: 0.7rem;
            font-weight: 700;
            padding: 0.3rem 0.7rem;
            border-radius: 30px;
        }
        
        .product-info {
            padding: 1.2rem;
        }
        
        .product-info h3 {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            color: #0f172a;
        }
        
        .product-price {
            font-size: 1.3rem;
            font-weight: 800;
            color: #3b82f6;
            margin: 0.5rem 0;
        }
        
        .product-price span {
            font-size: 0.8rem;
            font-weight: 400;
            color: #64748b;
        }
        
        .btn-cart-modern {
            width: 100%;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            border: none;
            padding: 0.7rem;
            border-radius: 60px;
            color: white;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            cursor: pointer;
            transition: all 0.2s;
            font-family: 'Inter', sans-serif;
        }
        
        .btn-cart-modern:hover {
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            transform: scale(0.98);
        }
        
        /* Newsletter Section */
        .newsletter-section {
            background: linear-gradient(135deg, #0f172a, #1e293b);
            margin: 2rem auto 0;
            padding: 3rem 2rem;
            text-align: center;
        }
        
        .newsletter-content {
            max-width: 600px;
            margin: 0 auto;
        }
        
        .newsletter-content h3 {
            font-size: 1.8rem;
            color: white;
            margin-bottom: 0.5rem;
        }
        
        .newsletter-content p {
            color: #94a3b8;
            margin-bottom: 1.5rem;
        }
        
        .newsletter-form {
            display: flex;
            gap: 0.8rem;
            flex-wrap: wrap;
            justify-content: center;
        }
        
        .newsletter-form input {
            flex: 1;
            min-width: 200px;
            padding: 0.8rem 1.2rem;
            border: none;
            border-radius: 60px;
            font-family: 'Inter', sans-serif;
            outline: none;
        }
        
        .newsletter-form button {
            background: #3b82f6;
            border: none;
            padding: 0.8rem 1.8rem;
            border-radius: 60px;
            color: white;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }
        
        .newsletter-form button:hover {
            background: #2563eb;
        }
        
        @media (max-width: 768px) {
            .hero-text h1 { font-size: 2.2rem; }
            .hero-container { flex-direction: column; text-align: center; }
            .hero-buttons { justify-content: center; }
            .product-container-modern { grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); }
        }
        
        @media (max-width: 480px) {
            .hero-text h1 { font-size: 1.8rem; }
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<!-- HERO SECTION -->
<section class="hero-modern">
    <div class="hero-container">
        <div class="hero-text">
            <div class="hero-badge">
                <i class="fas fa-bolt"></i> Limited Time Offer
            </div>
            <h1>Upgrade Your <br>Digital Life</h1>
            <p>Discover the latest electronics at unbeatable prices. Premium quality, fast shipping, and secure payments — designed for the modern tech enthusiast.</p>
            <div class="hero-buttons">
                <a href="products.jsp" class="btn-primary">
                    <i class="fas fa-shopping-bag"></i> Shop Now
                </a>
                <a href="about.jsp" class="btn-outline-light">
                    <i class="fas fa-play"></i> Learn More
                </a>
            </div>
        </div>
        <div class="hero-visual">
            <img src="https://images.unsplash.com/photo-1550009158-9ebf69173e03?w=400&h=400&fit=crop" alt="Electronics showcase">
        </div>
    </div>
</section>

<!-- FEATURES SECTION -->
<div class="features-modern">
    <div class="feature-card-modern">
        <div class="feature-icon"><i class="fas fa-truck-fast"></i></div>
        <h3>Express Delivery</h3>
        <p>Free shipping on orders over 50 birr. Get your products in 2-3 business days.</p>
    </div>
    <div class="feature-card-modern">
        <div class="feature-icon"><i class="fas fa-shield-alt"></i></div>
        <h3>Quality Guarantee</h3>
        <p>All products tested and certified. 1-year warranty on every purchase.</p>
    </div>
    <div class="feature-card-modern">
        <div class="feature-icon"><i class="fas fa-credit-card"></i></div>
        <h3>Secure Payments</h3>
        <p>Multiple payment options: Card, Telebirr, Cash on Delivery.</p>
    </div>
</div>

<!-- PRODUCTS SECTION -->
<div class="products-header">
    <h2>🔥 Featured Products</h2>
    <p>Handpicked just for you — premium electronics at best prices</p>
</div>

<div class="product-container-modern">
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int productCount = 0;
    
    try {
        con = DBConnection.getConnection();
        ps = con.prepareStatement("SELECT * FROM products ORDER BY id DESC LIMIT 8");
        rs = ps.executeQuery();
        
        while(rs.next()){
            productCount++;
            String productName = rs.getString("name");
            double productPrice = rs.getDouble("price");
            String productImage = rs.getString("image");
            int productId = rs.getInt("id");
            
            // Fix image path - if it starts with 'images/' add context path
            if(productImage != null && !productImage.isEmpty()) {
                // If it's a local path (starts with images/ and not http), add context path
                if(productImage.startsWith("images/") && !productImage.startsWith("http")) {
                    productImage = request.getContextPath() + "/" + productImage;
                }
            } else {
                // Default placeholder image
                productImage = "https://placehold.co/300x200/e2e8f0/475569?text=Product";
            }
%>
    <div class="product-card-modern">
        <div class="product-image">
            <img src="<%= productImage %>" 
                 alt="<%= productName %>"
                 onerror="this.src='https://placehold.co/300x200/e2e8f0/475569?text=No+Image'">
            <div class="product-badge">HOT</div>
        </div>
        <div class="product-info">
            <h3><%= productName %></h3>
            <div class="product-price">
                <%= String.format("%.2f", productPrice) %> <span>ETB</span>
            </div>
            <form action="AddToCartServlet" method="post">
                <input type="hidden" name="product_id" value="<%= productId %>">
                <input type="hidden" name="quantity" value="1">
                <button type="submit" class="btn-cart-modern">
                    <i class="fas fa-shopping-cart"></i> Add to Cart
                </button>
            </form>
        </div>
    </div>
<%
        }
        
        if(productCount == 0) {
%>
        <div style="grid-column:1/-1; text-align:center; padding:3rem;">
            <i class="fas fa-box-open" style="font-size: 3rem; color: #cbd5e1;"></i>
            <p style="margin-top: 1rem; color: #64748b;">No products available yet.</p>
            <% if(session.getAttribute("admin") != null && (Boolean)session.getAttribute("admin")) { %>
                <a href="add_products.jsp" style="display: inline-block; margin-top: 1rem; color: #3b82f6; text-decoration: none;">
                    <i class="fas fa-plus-circle"></i> Add your first product
                </a>
            <% } %>
        </div>
<%
        }
    } catch(Exception e) {
        e.printStackTrace();
%>
        <div style="grid-column:1/-1; text-align:center; padding:2rem; color:#ef4444;">
            <i class="fas fa-database"></i> Unable to load products. Please check database connection.
            <p style="font-size:0.8rem; margin-top:0.5rem;"><%= e.getMessage() %></p>
        </div>
<%
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(ps != null) try { ps.close(); } catch(Exception e) {}
        if(con != null) try { con.close(); } catch(Exception e) {}
    }
%>
</div>

<!-- NEWSLETTER SECTION -->
<section class="newsletter-section">
    <div class="newsletter-content">
        <h3>Stay in the loop</h3>
        <p>Subscribe to get special offers, free giveaways, and exclusive deals.</p>
        <form class="newsletter-form" action="#" method="post" onsubmit="event.preventDefault(); alert('Thanks for subscribing!');">
            <input type="email" placeholder="Your email address" required>
            <button type="submit"><i class="fas fa-paper-plane"></i> Subscribe</button>
        </form>
    </div>
</section>

<jsp:include page="footer.jsp" />

<script>
    // Check URL params for cart add status
    const urlParams = new URLSearchParams(window.location.search);
    if(urlParams.get('cart') === 'added') {
        const toast = document.createElement('div');
        toast.innerHTML = '<i class="fas fa-check-circle"></i> Item added to cart!';
        toast.style.position = 'fixed';
        toast.style.bottom = '20px';
        toast.style.right = '20px';
        toast.style.background = '#10b981';
        toast.style.color = 'white';
        toast.style.padding = '12px 24px';
        toast.style.borderRadius = '60px';
        toast.style.fontWeight = '500';
        toast.style.zIndex = '1000';
        toast.style.boxShadow = '0 10px 20px rgba(0,0,0,0.1)';
        document.body.appendChild(toast);
        setTimeout(() => toast.remove(), 3000);
        window.history.replaceState({}, document.title, window.location.pathname);
    }
</script>

</body>
</html>