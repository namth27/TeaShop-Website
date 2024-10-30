package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import object.CustomerObject;
import products.ProductFunction;
import products.ProductFunctionImp;
import util.ConnectionPool;
import object.*;

/**
 * Servlet implementation class AdminProduct
 */
@WebServlet("/adminproduct")
public class AdminProduct extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    
    public AdminProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerObject user = (CustomerObject) request.getSession().getAttribute("admin");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            view(request, response, user);
        }
    }

    protected void view(HttpServletRequest request, HttpServletResponse response, CustomerObject user)
            throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);

        // Tìm bộ quản lý kết nối
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        // Tạo đối tượng thực thi chức năng
        ProductFunction product = new ProductFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", product.getCP());
        }

        // Lấy danh sách hiển thị
        ArrayList<ProductObject> list_product = product.getAllProduct();
        product.releaseConnection();

        request.setAttribute("list_product", list_product);
        request.getRequestDispatcher("tblsanpham.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();

        ProductFunction product = new ProductFunctionImp(null);

        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("edit".equals(action)) {
            String productId = request.getParameter("ProductID");
//            session.invalidate();
            if (productId != null) {
                // Lấy thông tin chi tiết của sản phẩm
                int id = Integer.parseInt(productId);
                ProductObject Product = product.getProduct(id);
                if (Product != null) {
                    // Chuyển thông tin sản phẩm đến form sửa
                    request.setAttribute("product", Product);
                    session.setAttribute("sua", "Sửa");
                    request.getRequestDispatcher("/formsanpham.jsp").forward(request, response);
                    session.setAttribute("sua", null);
                    return;
                } else {
                    session.setAttribute("message", "Không tìm thấy sản phẩm.");
                }
            } else {
                session.setAttribute("message", "Không tìm thấy sản phẩm để chỉnh sửa.");
            }
        } else if("del".equals(action)) {
            // Xử lý xóa sản phẩm
            String productId = request.getParameter("ProductID");
            if (productId != null) {
                int id = Integer.parseInt(productId);
                boolean isDeleted = product.delProduct(id); 

                if (isDeleted) {
                    session.setAttribute("message", "Sản phẩm đã được xóa thành công!");
                } else {
                    session.setAttribute("message", "Xóa sản phẩm thất bại.");
                }
            } else {
                session.setAttribute("message", "Không tìm thấy sản phẩm để xóa.");
            }
            ArrayList<ProductObject> list_product = product.getAllProduct();
            product.releaseConnection();
            request.setAttribute("list_product", list_product);
            request.getRequestDispatcher("tblsanpham.jsp").forward(request, response);
        }

    }

}
