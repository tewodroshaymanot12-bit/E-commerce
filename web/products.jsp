<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Products | Smart Electronics</title>
    
    <!-- Google Fonts + Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
    
    <style>
        /* ============================================ */
        /* MODERN PRODUCTS PAGE STYLES                  */
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
        
        /* Page Banner */
        .products-banner {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            padding: 3rem 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .products-banner::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 60%;
            height: 200%;
            background: radial-gradient(circle, rgba(59,130,246,0.1) 0%, transparent 70%);
            pointer-events: none;
        }
        
        .products-banner h1 {
            font-size: 2.5rem;
            font-weight: 800;
            color: white;
            margin-bottom: 0.5rem;
        }
        
        .products-banner p {
            color: #94a3b8;
            font-size: 1rem;
        }
        
        /* Main Layout */
        .products-main {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 2rem;
            display: flex;
            gap: 2rem;
            flex-wrap: wrap;
        }
        
        /* Sidebar Filters */
        .filters-sidebar {
            width: 280px;
            background: white;
            border-radius: 1.5rem;
            padding: 1.5rem;
            height: fit-content;
            position: sticky;
            top: 100px;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
            border: 1px solid rgba(0,0,0,0.03);
        }
        
        .filter-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 0.8rem;
            border-bottom: 2px solid #e2e8f0;
        }
        
        .filter-header h3 {
            font-size: 1.1rem;
            font-weight: 700;
        }
        
        .filter-reset {
            background: none;
            border: none;
            color: #3b82f6;
            font-size: 0.8rem;
            cursor: pointer;
            font-weight: 500;
        }
        
        .filter-group {
            margin-bottom: 1.5rem;
        }
        
        .filter-group label {
            font-weight: 600;
            font-size: 0.85rem;
            display: block;
            margin-bottom: 0.8rem;
            color: #334155;
        }
        
        .filter-select {
            width: 100%;
            padding: 0.7rem 1rem;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            font-family: 'Inter', sans-serif;
            background: white;
            cursor: pointer;
            transition: 0.2s;
        }
        
        .filter-select:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.1);
        }
        
        .price-range {
            display: flex;
            gap: 0.8rem;
        }
        
        .price-range input {
            width: 100%;
            padding: 0.7rem;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            font-family: 'Inter', sans-serif;
        }
        
        .category-list {
            display: flex;
            flex-direction: column;
            gap: 0.6rem;
        }
        
        .category-item {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            padding: 0.4rem 0;
            transition: 0.2s;
        }
        
        .category-item input {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #3b82f6;
        }
        
        .category-item span {
            font-size: 0.9rem;
            color: #475569;
        }
        
        .category-item:hover span {
            color: #3b82f6;
        }
        
        /* Products Grid */
        .products-content {
            flex: 1;
            min-width: 280px;
        }
        
        .products-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1.5rem;
            background: white;
            padding: 1rem 1.5rem;
            border-radius: 1rem;
            box-shadow: 0 1px 2px rgba(0,0,0,0.03);
        }
        
        .results-count {
            font-size: 0.9rem;
            color: #64748b;
        }
        
        .results-count strong {
            color: #0f172a;
            font-weight: 700;
        }
        
        .sort-select {
            padding: 0.5rem 1rem;
            border: 1px solid #e2e8f0;
            border-radius: 40px;
            font-family: 'Inter', sans-serif;
            background: white;
            cursor: pointer;
        }
        
        .products-grid-modern {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.8rem;
        }
        
        .product-card-modern {
            background: white;
            border-radius: 1.2rem;
            overflow: hidden;
            transition: all 0.3s;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
            border: 1px solid rgba(0,0,0,0.03);
            position: relative;
        }
        
        .product-card-modern:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 30px -12px rgba(0,0,0,0.15);
        }
        
        .product-image-modern {
            position: relative;
            height: 220px;
            overflow: hidden;
            background: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .product-image-modern img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s;
        }
        
        .product-card-modern:hover .product-image-modern img {
            transform: scale(1.05);
        }
        
        .product-category-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: rgba(0,0,0,0.7);
            backdrop-filter: blur(8px);
            color: white;
            font-size: 0.7rem;
            font-weight: 600;
            padding: 0.3rem 0.8rem;
            border-radius: 30px;
            letter-spacing: 0.3px;
        }
        
        .product-info-modern {
            padding: 1.2rem;
        }
        
        .product-info-modern h3 {
            font-size: 1rem;
            font-weight: 700;
            margin-bottom: 0.3rem;
            color: #0f172a;
        }
        
        .product-desc {
            font-size: 0.8rem;
            color: #64748b;
            margin-bottom: 0.8rem;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .product-price-modern {
            font-size: 1.3rem;
            font-weight: 800;
            color: #3b82f6;
            margin-bottom: 0.8rem;
        }
        
        .product-price-modern small {
            font-size: 0.7rem;
            font-weight: 400;
            color: #64748b;
        }
        
        .quantity-control {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }
        
        .quantity-control label {
            font-size: 0.8rem;
            font-weight: 500;
            color: #475569;
        }
        
        .quantity-control input {
            width: 60px;
            padding: 0.4rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            text-align: center;
            font-family: 'Inter', sans-serif;
        }
        
        .btn-add-modern {
            width: 100%;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            border: none;
            padding: 0.7rem;
            border-radius: 40px;
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
        
        .btn-add-modern:hover {
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            transform: scale(0.98);
        }
        
        .no-products {
            grid-column: 1/-1;
            text-align: center;
            padding: 3rem;
            background: white;
            border-radius: 1.5rem;
            color: #64748b;
        }
        
        /* Toast Notification */
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
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
            transform: translateX(400px);
            transition: transform 0.3s ease;
        }
        
        .cart-toast.show {
            transform: translateX(0);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .filters-sidebar {
                width: 100%;
                position: static;
                margin-bottom: 1rem;
            }
            .products-main {
                flex-direction: column;
            }
            .products-banner h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>

<%
    if(session.getAttribute("user_id") == null){
        response.sendRedirect("login.html");
        return;
    }
%>

<jsp:include page="header.jsp" />

<!-- Page Banner -->
<section class="products-banner">
    <h1><i class="fas fa-microchip"></i> Explore Our Collection</h1>
    <p>Discover cutting-edge electronics at competitive prices</p>
</section>

<div class="products-main">
    <!-- Filters Sidebar -->
    <aside class="filters-sidebar">
        <div class="filter-header">
            <h3><i class="fas fa-sliders-h"></i> Filters</h3>
            <button class="filter-reset" id="resetFiltersBtn">Reset All</button>
        </div>
        
        <div class="filter-group">
            <label>Category</label>
            <div class="category-list" id="categoryFilterList">
                <!-- Categories will be populated dynamically -->
            </div>
        </div>
        
        <div class="filter-group">
            <label>Price Range (ETB)</label>
            <div class="price-range">
                <input type="number" id="minPrice" placeholder="Min" value="0">
                <input type="number" id="maxPrice" placeholder="Max" value="100000">
            </div>
        </div>
        
        <div class="filter-group">
            <label>Sort By</label>
            <select id="sortBy" class="filter-select">
                <option value="default">Default</option>
                <option value="price_asc">Price: Low to High</option>
                <option value="price_desc">Price: High to Low</option>
                <option value="name_asc">Name: A to Z</option>
            </select>
        </div>
    </aside>
    
    <!-- Products Content -->
    <div class="products-content">
        <div class="products-toolbar">
            <div class="results-count" id="resultsCount">Loading products...</div>
        </div>
        
        <div class="products-grid-modern" id="productsGrid">
            <div class="loading-spinner" style="text-align:center; padding:3rem;">
                <i class="fas fa-spinner fa-spin" style="font-size:2rem; color:#3b82f6;"></i>
                <p>Loading amazing products...</p>
            </div>
        </div>
    </div>
</div>

<!-- Toast Notification -->
<div id="cartToast" class="cart-toast">
    <i class="fas fa-check-circle"></i>
    <span>Added to cart successfully!</span>
</div>

<jsp:include page="footer.jsp" />

<script>
    // Store all products data
    let allProducts = [];
    let categoriesSet = new Set();
    
    // DOM Elements
    const productsGrid = document.getElementById('productsGrid');
    const resultsCount = document.getElementById('resultsCount');
    const categoryFilterList = document.getElementById('categoryFilterList');
    const minPriceInput = document.getElementById('minPrice');
    const maxPriceInput = document.getElementById('maxPrice');
    const sortBySelect = document.getElementById('sortBy');
    const resetBtn = document.getElementById('resetFiltersBtn');
    
    // Escape HTML helper
    function escapeHtml(str) {
        if(!str) return '';
        return str.replace(/[&<>]/g, function(m) {
            if(m === '&') return '&amp;';
            if(m === '<') return '&lt;';
            if(m === '>') return '&gt;';
            return m;
        });
    }
    
    // Render filter categories
    function renderCategories() {
        let html = '<label class="category-item"><input type="checkbox" value="all" checked id="catAll"> <span>All Categories</span></label>';
        const sortedCategories = Array.from(categoriesSet).sort();
        for(let i = 0; i < sortedCategories.length; i++) {
            let cat = sortedCategories[i];
            html += '<label class="category-item">' +
                        '<input type="checkbox" value="' + escapeHtml(cat) + '"> ' +
                        '<span>' + escapeHtml(cat) + '</span>' +
                    '</label>';
        }
        categoryFilterList.innerHTML = html;
        
        // Add event listeners to category checkboxes
        const checkboxes = document.querySelectorAll('#categoryFilterList input[type="checkbox"]');
        for(let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].addEventListener('change', function() {
                const allCheckbox = document.getElementById('catAll');
                if(this.value === 'all' && this.checked) {
                    for(let j = 0; j < checkboxes.length; j++) {
                        if(checkboxes[j].value !== 'all') checkboxes[j].checked = false;
                    }
                } else if(this.value !== 'all' && this.checked) {
                    if(allCheckbox) allCheckbox.checked = false;
                }
                applyFiltersAndRender();
            });
        }
    }
    
    // Get selected categories
    function getSelectedCategories() {
        const selected = [];
        const allCheckbox = document.getElementById('catAll');
        if(allCheckbox && allCheckbox.checked) return ['all'];
        
        const checkboxes = document.querySelectorAll('#categoryFilterList input[type="checkbox"]:checked');
        for(let i = 0; i < checkboxes.length; i++) {
            if(checkboxes[i].value !== 'all') selected.push(checkboxes[i].value);
        }
        return selected.length ? selected : ['all'];
    }
    
    // Apply filters and render products
    function applyFiltersAndRender() {
        let filtered = [...allProducts];
        const selectedCats = getSelectedCategories();
        const minPrice = parseFloat(minPriceInput.value) || 0;
        const maxPrice = parseFloat(maxPriceInput.value) || Infinity;
        const sortBy = sortBySelect.value;
        
        // Category filter
        if(selectedCats[0] !== 'all') {
            filtered = filtered.filter(function(p) {
                return selectedCats.indexOf(p.category) !== -1;
            });
        }
        
        // Price filter
        filtered = filtered.filter(function(p) {
            return p.price >= minPrice && p.price <= maxPrice;
        });
        
        // Sorting
        if(sortBy === 'price_asc') {
            filtered.sort(function(a,b) { return a.price - b.price; });
        } else if(sortBy === 'price_desc') {
            filtered.sort(function(a,b) { return b.price - a.price; });
        } else if(sortBy === 'name_asc') {
            filtered.sort(function(a,b) { return a.name.localeCompare(b.name); });
        }
        
        // Update results count
        resultsCount.innerHTML = '<strong>' + filtered.length + '</strong> product' + (filtered.length !== 1 ? 's' : '') + ' found';
        
        // Render products
        renderProducts(filtered);
    }
    
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
    
    // Render products grid
    function renderProducts(products) {
        if(products.length === 0) {
            productsGrid.innerHTML = '<div class="no-products"><i class="fas fa-search"></i> No products found. Try adjusting filters.</div>';
            return;
        }
        
        let html = '';
        for(let i = 0; i < products.length; i++) {
            let product = products[i];
            html += '<div class="product-card-modern" data-product-id="' + product.id + '">' +
                        '<div class="product-image-modern">' +
                            '<img src="' + (product.image || 'https://placehold.co/300x200/e2e8f0/475569?text=Product') + '" ' +
                                 'alt="' + escapeHtml(product.name) + '" ' +
                                 'onerror="this.src=\'https://placehold.co/300x200/e2e8f0/475569?text=No+Image\'">' +
                            '<span class="product-category-badge">' + escapeHtml(product.category) + '</span>' +
                        '</div>' +
                        '<div class="product-info-modern">' +
                            '<h3>' + escapeHtml(product.name) + '</h3>' +
                            '<div class="product-desc">' + escapeHtml(product.description || 'Premium quality electronic device') + '</div>' +
                            '<div class="product-price-modern">' + product.price.toFixed(2) + ' <small>ETB</small></div>' +
                            '<form action="AddToCartServlet" method="post" class="add-to-cart-form" data-product-id="' + product.id + '">' +
                                '<input type="hidden" name="product_id" value="' + product.id + '">' +
                                '<div class="quantity-control">' +
                                    '<label>Qty:</label>' +
                                    '<input type="number" name="quantity" value="1" min="1">' +
                                '</div>' +
                                '<button type="submit" class="btn-add-modern">' +
                                    '<i class="fas fa-shopping-cart"></i> Add to Cart' +
                                '</button>' +
                            '</form>' +
                        '</div>' +
                    '</div>';
        }
        productsGrid.innerHTML = html;
        
        // Attach form submit handlers
        const forms = document.querySelectorAll('.add-to-cart-form');
        for(let i = 0; i < forms.length; i++) {
            forms[i].addEventListener('submit', function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                fetch('AddToCartServlet', {
                    method: 'POST',
                    body: formData
                }).then(function(response) {
                    if(response.ok) {
                        showToast('Item added to cart!', 'success');
                        // Update cart badge if exists
                        const badge = document.getElementById('cartCountBadge');
                        if(badge) {
                            let count = parseInt(badge.textContent) || 0;
                            badge.textContent = count + 1;
                            badge.style.display = 'inline-block';
                        }
                    } else {
                        showToast('Error adding to cart', 'error');
                    }
                }).catch(function() {
                    showToast('Error adding to cart', 'error');
                });
            });
        }
    }
    
    // Reset filters
    function resetFilters() {
        minPriceInput.value = 0;
        maxPriceInput.value = 100000;
        sortBySelect.value = 'default';
        const allCheckbox = document.getElementById('catAll');
        if(allCheckbox) {
            allCheckbox.checked = true;
            const checkboxes = document.querySelectorAll('#categoryFilterList input[type="checkbox"]');
            for(let i = 0; i < checkboxes.length; i++) {
                if(checkboxes[i].value !== 'all') checkboxes[i].checked = false;
            }
        }
        applyFiltersAndRender();
    }
    
    // Event listeners
    minPriceInput.addEventListener('input', applyFiltersAndRender);
    maxPriceInput.addEventListener('input', applyFiltersAndRender);
    sortBySelect.addEventListener('change', applyFiltersAndRender);
    if(resetBtn) resetBtn.addEventListener('click', resetFilters);
    
    // Load products from database via JSP
    <%
        // Build products array from database
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            con = SmartElectronics.DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM products");
            while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                String image = rs.getString("image");
                
                if(category == null || category.trim().isEmpty()) category = "Uncategorized";
                if(description == null) description = "";
                if(image == null) image = "";
                
                // Escape for JavaScript
                name = name.replace("\\", "\\\\").replace("'", "\\'").replace("\"", "\\\"");
                category = category.replace("\\", "\\\\").replace("'", "\\'").replace("\"", "\\\"");
                description = description.replace("\\", "\\\\").replace("'", "\\'").replace("\"", "\\\"").replace("\n", " ");
                image = image.replace("\\", "\\\\").replace("'", "\\'").replace("\"", "\\\"");
    %>
                allProducts.push({
                    id: <%= id %>,
                    name: "<%= name %>",
                    category: "<%= category %>",
                    price: <%= price %>,
                    description: "<%= description %>",
                    image: "<%= image %>"
                });
                categoriesSet.add("<%= category %>");
    <%
            }
        } catch(Exception e) {
            e.printStackTrace();
    %>
            console.error("Database error: <%= e.getMessage() %>");
    <%
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception e) {}
            if(st != null) try { st.close(); } catch(Exception e) {}
            if(con != null) try { con.close(); } catch(Exception e) {}
        }
    %>
    
    // Initialize page
    if(allProducts.length === 0) {
        productsGrid.innerHTML = '<div class="no-products"><i class="fas fa-database"></i> No products available. Please check database connection.</div>';
        resultsCount.innerHTML = '<strong>0</strong> products found';
    } else {
        renderCategories();
        applyFiltersAndRender();
    }
</script>

</body>
</html>