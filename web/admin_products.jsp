<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Admin Dashboard | Product Management - Smart Electronics</title>
    
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
            background: #f1f5f9;
            color: #0f172a;
        }
        
        /* Admin Banner */
        .admin-banner {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            padding: 2.5rem 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .admin-banner::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 60%;
            height: 200%;
            background: radial-gradient(circle, rgba(59,130,246,0.15) 0%, transparent 70%);
            pointer-events: none;
        }
        
        .admin-banner h1 {
            font-size: 2.2rem;
            font-weight: 800;
            color: white;
            margin-bottom: 0.5rem;
        }
        
        .admin-banner h1 i {
            color: #3b82f6;
            margin-right: 10px;
        }
        
        .admin-banner p {
            color: #94a3b8;
            font-size: 1rem;
        }
        
        /* Stats Cards */
        .admin-stats {
            max-width: 1400px;
            margin: -1.5rem auto 0;
            padding: 0 2rem;
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            position: relative;
            z-index: 2;
        }
        
        .stat-card {
            background: white;
            border-radius: 1rem;
            padding: 1rem 1.5rem;
            flex: 1;
            min-width: 180px;
            display: flex;
            align-items: center;
            gap: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
            transition: all 0.2s;
        }
        
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px -5px rgba(0,0,0,0.15);
        }
        
        .stat-icon {
            width: 52px;
            height: 52px;
            background: linear-gradient(135deg, #eff6ff, #dbeafe);
            border-radius: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .stat-icon i {
            font-size: 1.6rem;
            color: #3b82f6;
        }
        
        .stat-info h3 {
            font-size: 1.8rem;
            font-weight: 800;
            color: #0f172a;
        }
        
        .stat-info p {
            font-size: 0.85rem;
            color: #64748b;
            font-weight: 500;
        }
        
        /* Main Container */
        .admin-main {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        /* Admin Actions Bar */
        .admin-actions {
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
            border: 1px solid rgba(0,0,0,0.03);
        }
        
        .btn-add-new-modern {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            padding: 0.8rem 1.8rem;
            border-radius: 40px;
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.2s;
            border: none;
            cursor: pointer;
            font-size: 0.9rem;
        }
        
        .btn-add-new-modern:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px -6px rgba(16,185,129,0.4);
        }
        
        .search-admin {
            display: flex;
            gap: 0.5rem;
        }
        
        .search-admin input {
            padding: 0.7rem 1.2rem;
            border: 1px solid #e2e8f0;
            border-radius: 40px;
            font-family: 'Inter', sans-serif;
            width: 280px;
            transition: 0.2s;
            font-size: 0.9rem;
        }
        
        .search-admin input:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.1);
        }
        
        .search-admin button {
            background: #f1f5f9;
            border: none;
            padding: 0.7rem 1.5rem;
            border-radius: 40px;
            cursor: pointer;
            transition: 0.2s;
            font-weight: 500;
        }
        
        .search-admin button:hover {
            background: #e2e8f0;
        }
        
        /* Products Table */
        .admin-table-container {
            background: white;
            border-radius: 1.5rem;
            overflow-x: auto;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
            border: 1px solid rgba(0,0,0,0.03);
        }
        
        .admin-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 700px;
        }
        
        .admin-table thead {
            background: #f8fafc;
            border-bottom: 2px solid #e2e8f0;
        }
        
        .admin-table th {
            padding: 1.2rem 1rem;
            text-align: left;
            font-weight: 600;
            color: #475569;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .admin-table td {
            padding: 1rem 1rem;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
        }
        
        .admin-table tr:hover {
            background: #fafcff;
        }
        
        .admin-product-img {
            width: 55px;
            height: 55px;
            object-fit: cover;
            border-radius: 12px;
            background: #f1f5f9;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        
        .product-name-cell {
            font-weight: 600;
            color: #0f172a;
            font-size: 1rem;
        }
        
        .price-cell-admin {
            font-weight: 700;
            color: #3b82f6;
            font-size: 1rem;
        }
        
        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 0.6rem;
            flex-wrap: wrap;
        }
        
        .btn-edit {
            background: #fef3c7;
            color: #d97706;
            border: none;
            padding: 0.45rem 1rem;
            border-radius: 30px;
            text-decoration: none;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .btn-edit:hover {
            background: #fde68a;
            transform: translateY(-1px);
        }
        
        .btn-delete {
            background: #fef2f2;
            color: #ef4444;
            border: none;
            padding: 0.45rem 1rem;
            border-radius: 30px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .btn-delete:hover {
            background: #fee2e2;
            transform: translateY(-1px);
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #64748b;
        }
        
        .empty-state i {
            font-size: 3.5rem;
            color: #cbd5e1;
            margin-bottom: 1rem;
        }
        
        .empty-state p {
            font-size: 1rem;
        }
        
        /* Toast Notification */
        .admin-toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #10b981;
            color: white;
            padding: 14px 28px;
            border-radius: 60px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 12px;
            z-index: 1000;
            transform: translateX(400px);
            transition: transform 0.3s ease;
            box-shadow: 0 10px 25px -5px rgba(0,0,0,0.2);
            font-size: 0.9rem;
        }
        
        .admin-toast.show {
            transform: translateX(0);
        }
        
        /* Loading State */
        .loading-spinner {
            text-align: center;
            padding: 3rem;
        }
        
        .loading-spinner i {
            font-size: 2rem;
            color: #3b82f6;
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .admin-stats {
                flex-direction: column;
            }
            .admin-actions {
                flex-direction: column;
                align-items: stretch;
            }
            .search-admin input {
                width: 100%;
            }
            .search-admin {
                width: 100%;
            }
            .admin-banner h1 {
                font-size: 1.5rem;
            }
        }
        
        @media (max-width: 480px) {
            .action-buttons {
                flex-direction: column;
            }
            .admin-table th, .admin-table td {
                padding: 0.8rem;
            }
        }
    </style>
</head>
<body>

<%
    // Check if user is admin
    Boolean isAdmin = (Boolean) session.getAttribute("admin");
    String role = (String) session.getAttribute("role");
    
    // Check both possible admin indicators
    if((isAdmin == null || !isAdmin) && (role == null || !role.equals("admin"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<jsp:include page="header.jsp" />

<!-- Admin Banner -->
<section class="admin-banner">
    <h1><i class="fas fa-boxes"></i> Product Management</h1>
    <p>Add, edit, or remove products from your store inventory</p>
</section>

<!-- Stats Section -->
<%
    int productCount = 0;
    Connection conStats = null;
    try {
        conStats = SmartElectronics.DBConnection.getConnection();
        Statement stStats = conStats.createStatement();
        ResultSet rsStats = stStats.executeQuery("SELECT COUNT(*) as total FROM products");
        if(rsStats.next()) productCount = rsStats.getInt("total");
        rsStats.close();
        stStats.close();
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(conStats != null) try { conStats.close(); } catch(Exception e) {}
    }
%>

<div class="admin-stats">
    <div class="stat-card">
        <div class="stat-icon"><i class="fas fa-boxes"></i></div>
        <div class="stat-info">
            <h3><%= productCount %></h3>
            <p>Total Products</p>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon"><i class="fas fa-plus-circle"></i></div>
        <div class="stat-info">
            <h3>Add New</h3>
            <p>Create Products</p>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon"><i class="fas fa-edit"></i></div>
        <div class="stat-info">
            <h3>Manage</h3>
            <p>Edit/Delete</p>
        </div>
    </div>
</div>

<div class="admin-main">
    <!-- Admin Actions Bar -->
    <div class="admin-actions">
        <a href="add_products.jsp" class="btn-add-new-modern">
            <i class="fas fa-plus-circle"></i> Add New Product
        </a>
        <div class="search-admin">
            <input type="text" id="searchProducts" placeholder="Search by product name..." onkeyup="filterProducts()">
            <button onclick="filterProducts()"><i class="fas fa-search"></i> Search</button>
        </div>
    </div>
    
    <!-- Products Table -->
    <div class="admin-table-container">
        <table class="admin-table" id="productsTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Price (ETB)</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="productsTableBody">
                <%
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    boolean hasProducts = false;
                    try {
                        con = SmartElectronics.DBConnection.getConnection();
                        ps = con.prepareStatement("SELECT * FROM products ORDER BY id DESC");
                        rs = ps.executeQuery();
                        
                        while(rs.next()){
                            hasProducts = true;
                            int productId = rs.getInt("id");
                            String productName = rs.getString("name");
                            double productPrice = rs.getDouble("price");
                            String productImage = rs.getString("image");
                            if(productImage == null || productImage.isEmpty()) {
                                productImage = "https://placehold.co/80x80/e2e8f0/475569?text=No+Image";
                            }
                %>
                <tr data-product-name="<%= productName.toLowerCase() %>">
                    <td><strong><%= productId %></strong></td>
                    <td class="product-name-cell"><%= productName %></td>
                    <td class="price-cell-admin"><%= String.format("%.2f", productPrice) %> ETB</td>
                    <td>
                        <img src="<%= productImage %>" class="admin-product-img" 
                             alt="<%= productName %>"
                             onerror="this.src='https://placehold.co/80x80/e2e8f0/475569?text=No+Image'">
                    </td>
                    <td>
                        <div class="action-buttons">
                            <a href="edit_product.jsp?id=<%= productId %>" class="btn-edit">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <form action="DeleteProductServlet" method="post" style="display: inline;" 
                                  onsubmit="return confirmDelete('<%= productName %>')">
                                <input type="hidden" name="product_id" value="<%= productId %>">
                                <button type="submit" class="btn-delete">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                <%
                        }
                        if(!hasProducts) {
                %>
                <tr>
                    <td colspan="5" class="empty-state">
                        <i class="fas fa-box-open"></i>
                        <p>No products found in inventory</p>
                        <a href="add_products.jsp" style="display: inline-block; margin-top: 1rem; color: #3b82f6; text-decoration: none;">
                            <i class="fas fa-plus-circle"></i> Add your first product
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } catch(Exception e) {
                        e.printStackTrace();
                %>
                <tr>
                    <td colspan="5" class="empty-state">
                        <i class="fas fa-exclamation-triangle"></i>
                        <p>Error loading products. Please check database connection.</p>
                        <p style="font-size: 0.8rem; margin-top: 0.5rem;"><%= e.getMessage() %></p>
                    </td>
                </tr>
                <%
                    } finally {
                        if(rs != null) try { rs.close(); } catch(Exception e) {}
                        if(ps != null) try { ps.close(); } catch(Exception e) {}
                        if(con != null) try { con.close(); } catch(Exception e) {}
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Toast Notification -->
<div id="adminToast" class="admin-toast">
    <i class="fas fa-check-circle"></i>
    <span>Action completed successfully!</span>
</div>

<jsp:include page="footer.jsp" />

<script>
    // Filter products by search
    function filterProducts() {
        let input = document.getElementById('searchProducts');
        let filter = input.value.toLowerCase();
        let rows = document.querySelectorAll('#productsTableBody tr');
        let visibleCount = 0;
        
        // Skip the empty state row if it exists
        rows.forEach(row => {
            let nameCell = row.querySelector('td:nth-child(2)');
            if(nameCell && !row.querySelector('.empty-state')) {
                let productName = nameCell.textContent.toLowerCase();
                if(productName.includes(filter)) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            }
        });
        
        // Show/hide no results message
        let noResultRow = document.getElementById('noProductResult');
        if(visibleCount === 0 && filter !== '' && document.querySelectorAll('#productsTableBody tr:not([style*="display: none"]) td.empty-state').length === 0) {
            if(!noResultRow) {
                let tbody = document.getElementById('productsTableBody');
                let tr = document.createElement('tr');
                tr.id = 'noProductResult';
                tr.innerHTML = '<td colspan="5" class="empty-state"><i class="fas fa-search"></i><p>No products matching "' + filter + '" found</p></td>';
                tbody.appendChild(tr);
            } else {
                noResultRow.style.display = '';
            }
        } else if(noResultRow) {
            noResultRow.style.display = 'none';
        }
    }
    
    // Confirm delete with product name
    function confirmDelete(productName) {
        return confirm('⚠️ Are you sure you want to delete "' + productName + '"?\n\nThis action cannot be undone.');
    }
    
    // Show toast notification
    function showToast(message, type) {
        let toast = document.getElementById('adminToast');
        let icon = toast.querySelector('i');
        let span = toast.querySelector('span');
        span.textContent = message;
        if(type === 'error') {
            icon.className = 'fas fa-exclamation-circle';
            toast.style.background = '#ef4444';
        } else {
            icon.className = 'fas fa-check-circle';
            toast.style.background = '#10b981';
        }
        toast.classList.add('show');
        setTimeout(() => {
            toast.classList.remove('show');
        }, 3000);
    }
    
    // Check URL parameters for operation status
    let urlParams = new URLSearchParams(window.location.search);
    let status = urlParams.get('status');
    if(status === 'deleted') {
        showToast('Product deleted successfully!', 'success');
        // Remove status from URL without reload
        let newUrl = window.location.pathname;
        window.history.replaceState({}, document.title, newUrl);
        // Reload to update count
        setTimeout(() => location.reload(), 2000);
    } else if(status === 'added') {
        showToast('Product added successfully!', 'success');
        let newUrl = window.location.pathname;
        window.history.replaceState({}, document.title, newUrl);
        setTimeout(() => location.reload(), 2000);
    } else if(status === 'updated') {
        showToast('Product updated successfully!', 'success');
        let newUrl = window.location.pathname;
        window.history.replaceState({}, document.title, newUrl);
        setTimeout(() => location.reload(), 2000);
    } else if(status === 'error') {
        showToast('An error occurred. Please try again.', 'error');
        let newUrl = window.location.pathname;
        window.history.replaceState({}, document.title, newUrl);
    }
    
    // Add hover effect to table rows
    const rows = document.querySelectorAll('#productsTableBody tr');
    rows.forEach(row => {
        if(!row.querySelector('.empty-state')) {
            row.addEventListener('mouseenter', function() {
                this.style.backgroundColor = '#fafcff';
            });
            row.addEventListener('mouseleave', function() {
                this.style.backgroundColor = '';
            });
        }
    });
    
    // Refresh product count after actions
    function updateProductCount() {
        let rowCount = document.querySelectorAll('#productsTableBody tr:not([id="noProductResult"]):not(.empty-state-row)').length;
        let statCount = document.querySelector('.stat-card:first-child .stat-info h3');
        if(statCount && rowCount > 0) {
            statCount.textContent = rowCount;
        }
    }
</script>

</body>
</html>