package SmartElectronics;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;
import java.sql.*;
import java.nio.file.*;

@MultipartConfig
public class UpdateProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || !"admin".equals(session.getAttribute("role"))){
            response.sendRedirect("login.html");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");

        // VALIDATION
        if(name == null || name.isEmpty() || priceStr == null || priceStr.isEmpty()){
            response.getWriter().println("All fields required!");
            return;
        }

        double price = Double.parseDouble(priceStr);

        try{
            Connection con = DBConnection.getConnection();

            // get old image
            PreparedStatement oldPs = con.prepareStatement("SELECT image FROM products WHERE id=?");
            oldPs.setInt(1, id);
            ResultSet oldRs = oldPs.executeQuery();

            String imagePath = "";
            if(oldRs.next()){
                imagePath = oldRs.getString("image");
            }

            // handle file upload
            Part filePart = request.getPart("image");

            if(filePart != null && filePart.getSize() > 0){

                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if(!uploadDir.exists()) uploadDir.mkdir();

                String fullPath = uploadPath + File.separator + fileName;

                filePart.write(fullPath);

                imagePath = "images/" + fileName;
            }

            // update product
            PreparedStatement ps = con.prepareStatement(
                "UPDATE products SET name=?, price=?, image=? WHERE id=?"
            );

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, imagePath);
            ps.setInt(4, id);

            ps.executeUpdate();

            // redirect with success message
            response.sendRedirect("edit_product.jsp?id=" + id + "&msg=success");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}