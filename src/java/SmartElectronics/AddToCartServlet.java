package SmartElectronics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Check login
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.html");
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        
        // Get product data
        String productIdStr = request.getParameter("product_id");
        String quantityStr = request.getParameter("quantity");
        
        if (productIdStr == null || productIdStr.trim().isEmpty()) {
            response.sendRedirect("products.jsp?error=invalid_product");
            return;
        }
        
        int productId = Integer.parseInt(productIdStr);
        int quantity = 1;
        
        if (quantityStr != null && !quantityStr.trim().isEmpty()) {
            try {
                quantity = Integer.parseInt(quantityStr);
                if (quantity < 1) quantity = 1;
            } catch (NumberFormatException e) {
                quantity = 1;
            }
        }

        Connection con = null;
        PreparedStatement checkStmt = null;
        PreparedStatement updateStmt = null;
        PreparedStatement insertStmt = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            
            System.out.println("=== AddToCart Debug ===");
            System.out.println("User ID: " + userId);
            System.out.println("Product ID: " + productId);
            System.out.println("Quantity: " + quantity);

            // Check if product exists in cart
            String checkSql = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
            checkStmt = con.prepareStatement(checkSql);
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, productId);
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Update existing
                int existingQty = rs.getInt("quantity");
                int newQty = existingQty + quantity;
                String updateSql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                updateStmt = con.prepareStatement(updateSql);
                updateStmt.setInt(1, newQty);
                updateStmt.setInt(2, userId);
                updateStmt.setInt(3, productId);
                updateStmt.executeUpdate();
                System.out.println("Updated - New quantity: " + newQty);
            } else {
                // Insert new (id will auto-increment)
                String insertSql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
                insertStmt = con.prepareStatement(insertSql);
                insertStmt.setInt(1, userId);
                insertStmt.setInt(2, productId);
                insertStmt.setInt(3, quantity);
                insertStmt.executeUpdate();
                System.out.println("Inserted new item");
            }

            response.sendRedirect("cart.jsp?status=added");

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL Error: " + e.getMessage());
            response.sendRedirect("products.jsp?error=db_error");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
            response.sendRedirect("products.jsp?error=unknown");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (checkStmt != null) checkStmt.close(); } catch (SQLException e) {}
            try { if (updateStmt != null) updateStmt.close(); } catch (SQLException e) {}
            try { if (insertStmt != null) insertStmt.close(); } catch (SQLException e) {}
            try { if (con != null) con.close(); } catch (SQLException e) {}
        }
    }
}