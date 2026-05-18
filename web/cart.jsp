<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Shopping Cart | Smart Electronics</title>
    
    <!-- Google Fonts + Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
    
    <style>
        /* ============================================ */
        /* MODERN CART PAGE STYLES                      */
        /* ============================================ */
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            color: #0f172a;
        }
        
        /* Cart Banner */
        .cart-banner {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            padding: 2.5rem 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .cart-banner::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 60%;
            height: 200%;
            background: radial-gradient(circle, rgba(59,130,246,0.1) 0%, transparent 70%);
            pointer-events: none;
        }
        
        .cart-banner h1 {
            font-size: 2.2rem;
            font-weight: 800;
            color: white;
            margin-bottom: 0.5rem;
        }
        
        .cart-banner p {
            color: #94a3b8;
            font-size: 1rem;
        }
        
        /* Cart Container */
        .cart-container {
            max-width: 1280px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        /* Empty Cart State */
        .empty-cart {
            background: white;
            border-radius: 1.5rem;
            padding: 4rem 2rem;
            text-align: center;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
        }
        
        .empty-cart i {
            font-size: 5rem;
            color: #cbd5e1;
            margin-bottom: 1rem;
        }
        
        .empty-cart h3 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: #334155;
        }
        
        .empty-cart p {
            color: #64748b;
            margin-bottom: 1.5rem;
        }
        
        .btn-shop-now {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 60px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-shop-now:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px rgba(59,130,246,0.4);
        }
        
        /* Cart Table Styles */
        .cart-card {
            background: white;
            border-radius: 1.5rem;
            overflow: hidden;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
            border: 1px solid rgba(0,0,0,0.03);
        }
        
        .cart-table-modern {
            width: 100%;
            border-collapse: collapse;
        }
        
        .cart-table-modern thead {
            background: #f8fafc;
            border-bottom: 2px solid #e2e8f0;
        }
        
        .cart-table-modern th {
            padding: 1.2rem 1rem;
            text-align: left;
            font-weight: 600;
            color: #475569;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .cart-table-modern td {
            padding: 1.2rem 1rem;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
        }
        
        .product-name-cell {
            font-weight: 600;
            color: #0f172a;
        }
        
        .quantity-controls-modern {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            flex-wrap: wrap;
        }
        
        .btn-qty-modern {
            background: #f1f5f9;
            border: none;
            width: 32px;
            height: 32px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s;
            color: #3b82f6;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-qty-modern:hover {
            background: #e2e8f0;
            transform: scale(1.05);
        }
        
        .quantity-value {
            font-weight: 600;
            min-width: 30px;
            text-align: center;
        }
        
        .btn-remove-modern {
            background: none;
            border: none;
            color: #ef4444;
            cursor: pointer;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 0.4rem 0.8rem;
            border-radius: 30px;
            transition: all 0.2s;
        }
        
        .btn-remove-modern:hover {
            background: #fef2f2;
        }
        
        .price-cell, .subtotal-cell {
            font-weight: 600;
            color: #0f172a;
        }
        
        .total-row-modern {
            background: #f8fafc;
            font-weight: 700;
        }
        
        .total-row-modern td {
            border-bottom: none;
            padding: 1.2rem 1rem;
        }
        
        .total-label {
            text-align: right;
            font-size: 1rem;
        }
        
        .total-amount {
            font-size: 1.3rem;
            color: #3b82f6;
        }
        
        /* Cart Actions */
        .cart-actions-modern {
            margin-top: 2rem;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .btn-checkout-modern {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 60px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-family: 'Inter', sans-serif;
        }
        
        .btn-checkout-modern:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px rgba(16,185,129,0.4);
        }
        
        .btn-clear-modern {
            background: white;
            border: 2px solid #e2e8f0;
            color: #ef4444;
            padding: 1rem 2rem;
            border-radius: 60px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-family: 'Inter', sans-serif;
        }
        
        .btn-clear-modern:hover {
            background: #fef2f2;
            border-color: #ef4444;
        }
        
        .continue-shopping {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #3b82f6;
            text-decoration: none;
            font-weight: 500;
            transition: 0.2s;
        }
        
        .continue-shopping:hover {
            gap: 12px;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .cart-table-modern, .cart-table-modern thead, .cart-table-modern tbody, .cart-table-modern tr, .cart-table-modern td {
                display: block;
            }
            
            .cart-table-modern thead {
                display: none;
            }
            
            .cart-table-modern tr {
                margin-bottom: 1rem;
                border: 1px solid #e2e8f0;
                border-radius: 1rem;
                padding: 1rem;
            }
            
            .cart-table-modern td {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0.6rem 0;
                border-bottom: 1px solid #f1f5f9;
            }
            
            .cart-table-modern td:last-child {
                border-bottom: none;
            }
            
            .cart-table-modern td::before {
                content: attr(data-label);
                font-weight: 600;
                color: #64748b;
            }
            
            .total-row-modern td {
                display: flex;
                justify-content: space-between;
            }
            
            .cart-actions-modern {
                flex-direction: column-reverse;
            }
            
            .btn-checkout-modern, .btn-clear-modern {
                width: 100%;
                justify-content: center;
            }
        }
        
        /* Loading & Toast */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        
        .loading-spinner-cart {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            text-align: center;
        }
        
        .cart-toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #10b981;
            color: white;
            padding: 12px 24px;
            border-radius: 60px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
            z-index: 1000;
            transform: translateX(400px);
            transition: transform 0.3s ease;
        }
        
        .cart-toast.show {
            transform: translateX(0);
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<%
    if(session.getAttribute("user_id") == null){
        response.sendRedirect("login.html");
        return;
    }
    
    int user_id = (int) session.getAttribute("user_id");
    Connection con = null;
    PreparedStatement ps2 = null;
    ResultSet rs2 = null;
    double total = 0;
    boolean hasItems = false;
    
    try {
        con = SmartElectronics.DBConnection.getConnection();
        ps2 = con.prepareStatement(
            "SELECT c.product_id, c.quantity, p.name, p.price, p.image " +
            "FROM cart c JOIN products p ON c.product_id = p.id " +
            "WHERE c.user_id=?"
        );
        ps2.setInt(1, user_id);
        rs2 = ps2.executeQuery();
%>

<!-- Cart Banner -->
<section class="cart-banner">
    <h1><i class="fas fa-shopping-bag"></i> Your Shopping Cart</h1>
    <p>Review your items and proceed to checkout</p>
</section>

<div class="cart-container">
    <%
        if(!rs2.isBeforeFirst()) {
            // Empty cart
    %>
            <div class="empty-cart">
                <i class="fas fa-shopping-cart"></i>
                <h3>Your cart is empty</h3>
                <p>Looks like you haven't added any items to your cart yet.</p>
                <a href="products.jsp" class="btn-shop-now">
                    <i class="fas fa-store"></i> Start Shopping
                </a>
            </div>
    <%
        } else {
            hasItems = true;
    %>
            <div class="cart-card">
                <table class="cart-table-modern">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Subtotal</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        while(rs2.next()){
                            int productId = rs2.getInt("product_id");
                            String pname = rs2.getString("name");
                            int qty = rs2.getInt("quantity");
                            double price = rs2.getDouble("price");
                            double subtotal = qty * price;
                            total += subtotal;
                            String productImage = rs2.getString("image");
                            if(productImage == null || productImage.isEmpty()) {
                                productImage = "https://placehold.co/80x80/e2e8f0/475569?text=Product";
                            }
                        %>
                        <tr data-product-id="<%= productId %>">
                            <td data-label="Product" class="product-name-cell">
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src="<%= productImage %>" alt="<%= pname %>" 
                                         style="width: 50px; height: 50px; object-fit: cover; border-radius: 10px;"
                                         onerror="this.src='https://placehold.co/80x80/e2e8f0/475569?text=Product'">
                                    <span><%= pname %></span>
                                </div>
                            </td>
                            <td data-label="Quantity">
                                <div class="quantity-controls-modern">
                                    <form action="UpdateCartServlet" method="post" style="display: inline;">
                                        <input type="hidden" name="product_id" value="<%= productId %>">
                                        <input type="hidden" name="action" value="dec">
                                        <button type="submit" class="btn-qty-modern">−</button>
                                    </form>
                                    <span class="quantity-value"><%= qty %></span>
                                    <form action="UpdateCartServlet" method="post" style="display: inline;">
                                        <input type="hidden" name="product_id" value="<%= productId %>">
                                        <input type="hidden" name="action" value="inc">
                                        <button type="submit" class="btn-qty-modern">+</button>
                                    </form>
                                </div>
                            </td>
                            <td data-label="Price" class="price-cell">
                                <%= String.format("%.2f", price) %> ETB
                            </td>
                            <td data-label="Subtotal" class="subtotal-cell">
                                <%= String.format("%.2f", subtotal) %> ETB
                            </td>
                            <td data-label="Actions">
                                <form action="UpdateCartServlet" method="post" style="display: inline;">
                                    <input type="hidden" name="product_id" value="<%= productId %>">
                                    <input type="hidden" name="action" value="remove">
                                    <button type="submit" class="btn-remove-modern">
                                        <i class="fas fa-trash-alt"></i> Remove
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                        <tr class="total-row-modern">
                            <td colspan="3" class="total-label"><strong>Total Amount</strong></td>
                            <td colspan="2" class="total-amount"><strong><%= String.format("%.2f", total) %> ETB</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="cart-actions-modern">
                <div>
                    <a href="products.jsp" class="continue-shopping">
                        <i class="fas fa-arrow-left"></i> Continue Shopping
                    </a>
                </div>
                <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                    <form action="UpdateCartServlet" method="post" id="clearCartForm">
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" class="btn-clear-modern" onclick="return confirmClearCart()">
                            <i class="fas fa-trash-alt"></i> Clear Cart
                        </button>
                    </form>
                    <form action="checkout.jsp" method="post">
                        <button type="submit" class="btn-checkout-modern">
                            <i class="fas fa-credit-card"></i> Proceed to Payment
                        </button>
                    </form>
                </div>
            </div>
    <%
        }
    } catch(Exception e) {
        e.printStackTrace();
    %>
        <div class="empty-cart">
            <i class="fas fa-exclamation-triangle"></i>
            <h3>Error Loading Cart</h3>
            <p>There was an issue loading your cart. Please try again later.</p>
            <a href="products.jsp" class="btn-shop-now">Continue Shopping</a>
        </div>
    <%
    } finally {
        if(rs2 != null) try { rs2.close(); } catch(Exception e) {}
        if(ps2 != null) try { ps2.close(); } catch(Exception e) {}
        if(con != null) try { con.close(); } catch(Exception e) {}
    }
    %>
</div>

<!-- Toast Notification -->
<div id="cartToast" class="cart-toast">
    <i class="fas fa-check-circle"></i>
    <span>Cart updated successfully!</span>
</div>

<!-- Loading Overlay -->
<div id="loadingOverlay" class="loading-overlay">
    <div class="loading-spinner-cart">
        <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: #3b82f6;"></i>
        <p>Updating cart...</p>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
    // Show toast notification
    function showToast(message, type) {
        const toast = document.getElementById('cartToast');
        const icon = toast.querySelector('i');
        const span = toast.querySelector('span');
        span.textContent = message;
        if(type === 'error') {
            icon.className = 'fas fa-exclamation-circle';
            toast.style.background = '#ef4444';
        } else {
            icon.className = 'fas fa-check-circle';
            toast.style.background = '#10b981';
        }
        toast.classList.add('show');
        setTimeout(function() {
            toast.classList.remove('show');
        }, 3000);
    }
    
    // Show/hide loading overlay
    function showLoading(show) {
        const overlay = document.getElementById('loadingOverlay');
        if(overlay) {
            overlay.style.display = show ? 'flex' : 'none';
        }
    }
    
    // Confirm clear cart
    function confirmClearCart() {
        return confirm('⚠️ Are you sure you want to clear your entire cart? This action cannot be undone.');
    }
    
    // Handle form submissions with AJAX for better UX
    document.querySelectorAll('.btn-qty-modern, .btn-remove-modern, .btn-clear-modern').forEach(function(btn) {
        if(btn.closest('form')) {
            const form = btn.closest('form');
            form.addEventListener('submit', function(e) {
                // Don't prevent default for clear cart with confirm
                if(btn.classList.contains('btn-clear-modern')) {
                    if(!confirmClearCart()) {
                        e.preventDefault();
                        return false;
                    }
                }
                showLoading(true);
                // Let the form submit normally, but we'll show loading
                setTimeout(function() {
                    // The page will refresh, but we keep loading indicator
                }, 100);
            });
        }
    });
    
    // Check URL parameters for cart update status
    const urlParams = new URLSearchParams(window.location.search);
    const status = urlParams.get('status');
    if(status === 'updated') {
        showToast('Cart updated successfully!', 'success');
        // Clean URL without reloading page content (but page already refreshed)
        const newUrl = window.location.pathname;
        window.history.replaceState({}, document.title, newUrl);
    } else if(status === 'cleared') {
        showToast('Cart has been cleared', 'success');
        const newUrl = window.location.pathname;
        window.history.replaceState({}, document.title, newUrl);
    } else if(status === 'error') {
        showToast('Error updating cart. Please try again.', 'error');
        const newUrl = window.location.pathname;
        window.history.replaceState({}, document.title, newUrl);
    }
    
    // Update cart badge count from localStorage or server
    function updateCartBadge() {
        const badge = document.getElementById('cartCountBadge');
        if(badge) {
            // You can fetch cart count from server or use localStorage
            // For now, let's calculate from page if available
            let totalItems = 0;
            const quantitySpans = document.querySelectorAll('.quantity-value');
            quantitySpans.forEach(function(span) {
                totalItems += parseInt(span.textContent) || 0;
            });
            if(totalItems > 0) {
                badge.textContent = totalItems;
                badge.style.display = 'inline-block';
            } else {
                badge.style.display = 'none';
            }
        }
    }
    
    // Update badge on load
    updateCartBadge();
    
    // Optional: Add animation to cart items on hover
    const cartRows = document.querySelectorAll('.cart-table-modern tbody tr');
    cartRows.forEach(function(row) {
        if(!row.classList.contains('total-row-modern')) {
            row.addEventListener('mouseenter', function() {
                this.style.backgroundColor = '#fafcff';
            });
            row.addEventListener('mouseleave', function() {
                this.style.backgroundColor = '';
            });
        }
    });
</script>

</body>
</html>