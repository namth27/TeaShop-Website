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
import object.ProductObject;
import products.ProductFunction;
import products.ProductFunctionImp;
import util.ConnectionPool;

/**
 * Servlet implementation class FormProduct
 */
@WebServlet("/formproduct")
public class FormProduct extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    public FormProduct() {
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
        request.getRequestDispatcher("formsanpham.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Tìm bộ quản lý kết nối
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        // Tạo đối tượng thực thi chức năng
        ProductFunction product = new ProductFunctionImp(cp);
        HttpSession session = request.getSession();

        String action = request.getParameter("action");

        String tenSanPham = request.getParameter("tenSanPham");
        String maNCC = request.getParameter("maNCC");
        String maTheLoai = request.getParameter("maTheLoai");
        String khoiLuong = request.getParameter("khoiLuong");
        String giaTien = request.getParameter("giaTien");
        String soLuong = request.getParameter("soLuong");
        String moTa = request.getParameter("moTa");
        String sanXuat = request.getParameter("sanXuat");

        ArrayList<String> errors = new ArrayList<>();

        if (tenSanPham == null || tenSanPham.trim().isEmpty()) {
            errors.add("Tên sản phẩm không được để trống.");
        }
        if (maNCC == null || maNCC.trim().isEmpty()) {
            errors.add("Mã nhà cung cấp không được để trống.");
        }
        if (maTheLoai == null || maTheLoai.trim().isEmpty()) {
            errors.add("Mã thể loại không được để trống.");
        }
        if (khoiLuong == null || khoiLuong.trim().isEmpty()) {
            errors.add("Khối lượng không được để trống.");
        }
        if (giaTien == null || giaTien.trim().isEmpty()) {
            errors.add("Giá tiền không được để trống.");
        }
        if (soLuong == null || soLuong.trim().isEmpty()) {
            errors.add("Số lượng không được để trống.");
        }
        if (moTa == null || moTa.trim().isEmpty()) {
            errors.add("Mô tả không được để trống.");
        }

        if ("add".equals(action)) {
            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("formsanpham.jsp").forward(request, response);
            } else {
                // Thực hiện thêm sản phẩm vào cơ sở dữ liệu
                ProductObject Product = new ProductObject();
                Product.setProductName(tenSanPham);
                Product.setSupplierID(Integer.parseInt(maNCC));
                Product.setCategoryID(Integer.parseInt(maTheLoai));
                Product.setQuantityPerUnit(khoiLuong);
                Product.setUnitPrice(Double.parseDouble(giaTien));
                Product.setUnitsInStock(Integer.parseInt(soLuong));
                Product.setDescription(moTa);
                Product.setDiscontinued("conSanXuat".equals(sanXuat));

                boolean isAdded = product.addProduct(Product);

                if (isAdded) {
                    request.getSession().setAttribute("message", "Sản phẩm đã được thêm thành công!");
                    ArrayList<ProductObject> list_product = product.getAllProduct();
                    product.releaseConnection();
                    request.setAttribute("list_product", list_product);
                    request.getRequestDispatcher("tblsanpham.jsp").forward(request, response);
                } else {
                    errors.add("Đã xảy ra lỗi, vui lòng thử lại.");
                    request.setAttribute("errors", errors);
                    request.getRequestDispatcher("formsanpham.jsp").forward(request, response);
                }
            }
        } else {
            String productId = request.getParameter("productId");
//            out.print(productId);
            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("formsanpham.jsp").forward(request, response);
            } else {
                // Thực hiện thêm sản phẩm vào cơ sở dữ liệu
                ProductObject Product = new ProductObject();
                Product.setProductID(Integer.parseInt(productId));
                Product.setProductName(tenSanPham);
                Product.setSupplierID(Integer.parseInt(maNCC));
                Product.setCategoryID(Integer.parseInt(maTheLoai));
                Product.setQuantityPerUnit(khoiLuong);
                Product.setUnitPrice(Double.parseDouble(giaTien));
                Product.setUnitsInStock(Integer.parseInt(soLuong));
                Product.setDescription(moTa);
                Product.setDiscontinued("conSanXuat".equals(sanXuat));

                boolean isAdded = product.editProduct(Product);

                if (isAdded) {
                    request.getSession().setAttribute("message", "Sản phẩm đã được sửa thành công!");
                    ArrayList<ProductObject> list_product = product.getAllProduct();
                    product.releaseConnection();
                    request.setAttribute("list_product", list_product);
//                    session.setAttribute("sua", null);
                    request.getRequestDispatcher("tblsanpham.jsp").forward(request, response);
                } else {
                    errors.add("Đã xảy ra lỗi, vui lòng thử lại.");
                    request.setAttribute("errors", errors);
                    request.getRequestDispatcher("formsanpham.jsp").forward(request, response);
                }
            }
        }

    }

}
