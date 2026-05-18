<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product | Smart Electronics</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f1f5f9; }
        .form-container { max-width: 700px; margin: 2rem auto; padding: 0 1.5rem; }
        .form-card { background: white; border-radius: 1.5rem; padding: 2rem; box-shadow: 0 20px 35px -12px rgba(0,0,0,0.1); }
        .form-header { text-align: center; margin-bottom: 2rem; }
        .form-header h2 { font-size: 1.8rem; font-weight: 800; background: linear-gradient(135deg, #0f172a, #1e293b); background-clip: text; -webkit-background-clip: text; color: transparent; }
        .form-header p { color: #64748b; margin-top: 0.5rem; }
        .form-group { margin-bottom: 1.5rem; }
        .form-group label { display: block; font-weight: 600; margin-bottom: 0.5rem; color: #334155; font-size: 0.9rem; }
        .form-group label i { margin-right: 8px; color: #3b82f6; }
        .form-group input, .form-group textarea, .form-group select { width: 100%; padding: 0.8rem 1rem; border: 1px solid #e2e8f0; border-radius: 12px; font-family: 'Inter', sans-serif; transition: 0.2s; }
        .form-group input:focus, .form-group textarea:focus, .form-group select:focus { outline: none; border-color: #3b82f6; box-shadow: 0 0 0 3px rgba(59,130,246,0.1); }
        .form-group textarea { resize: vertical; min-height: 100px; }
        .preview-image { margin-top: 1rem; text-align: center; }
        .preview-image img { max-width: 200px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .btn-submit { width: 100%; background: linear-gradient(135deg, #10b981, #059669); color: white; border: none; padding: 1rem; border-radius: 60px; font-weight: 700; font-size: 1rem; cursor: pointer; transition: 0.2s; display: flex; align-items: center; justify-content: center; gap: 8px; }
        .btn-submit:hover { transform: translateY(-2px); box-shadow: 0 10px 20px -5px rgba(16,185,129,0.4); }
        .btn-back { display: inline-block; margin-bottom: 1rem; color: #3b82f6; text-decoration: none; font-weight: 500; }
        .btn-back i { margin-right: 5px; }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="form-container">
    <a href="admin_products.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    <div class="form-card">
        <div class="form-header">
            <h2><i class="fas fa-plus-circle"></i> Add New Product</h2>
            <p>Fill in the details to add a new product to your store</p>
        </div>
        <form action="AddProductServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label><i class="fas fa-tag"></i> Product Name</label>
                <input type="text" name="name" placeholder="Enter product name" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-folder"></i> Category</label>
                <input type="text" name="category" placeholder="e.g., Laptops, Headphones, Accessories" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-money-bill-wave"></i> Price (ETB)</label>
                <input type="number" name="price" placeholder="Enter price" min="0" step="0.01" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-align-left"></i> Description</label>
                <textarea name="description" placeholder="Write a detailed product description..." required></textarea>
            </div>
            <div class="form-group">
                <label><i class="fas fa-image"></i> Product Image</label>
                <input type="file" name="image" id="imageInput" accept="image/*" required>
                <div class="preview-image" id="imagePreview"></div>
            </div>
            <button type="submit" class="btn-submit"><i class="fas fa-save"></i> Add Product</button>
        </form>
    </div>
</div>
<script>
    document.getElementById('imageInput').addEventListener('change', function(e) {
        let preview = document.getElementById('imagePreview');
        preview.innerHTML = '';
        if(e.target.files[0]) {
            let img = document.createElement('img');
            img.src = URL.createObjectURL(e.target.files[0]);
            preview.appendChild(img);
        }
    });
</script>
<jsp:include page="footer.jsp" />
</body>
</html>