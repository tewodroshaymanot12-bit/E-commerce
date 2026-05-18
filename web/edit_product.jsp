<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product | Smart Electronics</title>
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
        .form-group { margin-bottom: 1.5rem; }
        .form-group label { display: block; font-weight: 600; margin-bottom: 0.5rem; color: #334155; }
        .form-group label i { margin-right: 8px; color: #3b82f6; }
        .form-group input, .form-group textarea { width: 100%; padding: 0.8rem 1rem; border: 1px solid #e2e8f0; border-radius: 12px; font-family: 'Inter', sans-serif; transition: 0.2s; }
        .form-group input:focus, .form-group textarea:focus { outline: none; border-color: #3b82f6; box-shadow: 0 0 0 3px rgba(59,130,246,0.1); }
        .current-image { margin: 1rem 0; text-align: center; }
        .current-image img { max-width: 150px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .btn-submit { width: 100%; background: linear-gradient(135deg, #3b82f6, #2563eb); color: white; border: none; padding: 1rem; border-radius: 60px; font-weight: 700; font-size: 1rem; cursor: pointer; transition: 0.2s; display: flex; align-items: center; justify-content: center; gap: 8px; }
        .btn-submit:hover { transform: translateY(-2px); box-shadow: 0 10px 20px -5px rgba(59,130,246,0.4); }
        .btn-back { display: inline-block; margin-bottom: 1rem; color: #3b82f6; text-decoration: none; font-weight: 500; }
        .alert-success { background: #d1fae5; color: #065f46; padding: 1rem; border-radius: 12px; margin-top: 1rem; text-align: center; }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="form-container">
    <a href="admin_products.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    <div class="form-card">
        <div class="form-header">
            <h2><i class="fas fa-edit"></i> Edit Product</h2>
            <p>Update product information</p>
        </div>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                con = SmartElectronics.DBConnection.getConnection();
                ps = con.prepareStatement("SELECT * FROM products WHERE id=?");
                ps.setInt(1, id);
                rs = ps.executeQuery();
                if(rs.next()){
        %>
        <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= id %>">
            <div class="form-group">
                <label><i class="fas fa-tag"></i> Product Name</label>
                <input type="text" name="name" value="<%= rs.getString("name") %>" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-money-bill-wave"></i> Price (ETB)</label>
                <input type="number" step="0.01" name="price" value="<%= rs.getDouble("price") %>" required>
            </div>
            <div class="form-group">
                <label><i class="fas fa-image"></i> Current Image</label>
                <div class="current-image">
                    <img src="<%= rs.getString("image") %>" alt="Current Image" onerror="this.src='https://placehold.co/150x150/e2e8f0/475569?text=No+Image'">
                </div>
            </div>
            <div class="form-group">
                <label><i class="fas fa-upload"></i> Upload New Image (Optional)</label>
                <input type="file" name="image" accept="image/*">
            </div>
            <button type="submit" class="btn-submit"><i class="fas fa-save"></i> Update Product</button>
        </form>
        <%
                }
            } catch(Exception e) { e.printStackTrace(); }
            finally {
                if(rs != null) try { rs.close(); } catch(Exception e) {}
                if(ps != null) try { ps.close(); } catch(Exception e) {}
                if(con != null) try { con.close(); } catch(Exception e) {}
            }
        %>
        <%
            String msg = request.getParameter("msg");
            if("success".equals(msg)){
        %>
        <div class="alert-success"><i class="fas fa-check-circle"></i> Product updated successfully!</div>
        <% } %>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>