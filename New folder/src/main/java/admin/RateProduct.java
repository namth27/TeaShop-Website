package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.CustomerRate;
import products.ProductFunction;
import products.ProductFunctionImp;
import util.ConnectionPool;
import object.*;

/**
 * Servlet implementation class RateProduct
 */
@WebServlet("/rateproduct")
public class RateProduct extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;

    public RateProduct() {
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


	protected void view(HttpServletRequest request, HttpServletResponse response, CustomerObject user) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        
        // Tìm bộ quản lý kết nối
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        // Tạo đối tượng thực thi chức năng
        ProductFunction product = new ProductFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", product.getCP());
        }
        
        ArrayList<CustomerRate> ds = product.getRate(0);
        product.releaseConnection();
        request.setAttribute("ds", ds);

        request.getRequestDispatcher("phanhoisanpham.jsp").forward(request, response);
        

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
		response.setContentType(CONTENT_TYPE);
        
        LocalDate today = LocalDate.now();

        // Định dạng ngày theo "dd-MM-yyyy"
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = today.format(formatter);


        // Lấy thông tin từ form
		String productid = request.getParameter("productId");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String review = request.getParameter("review");
//        String rating = request.getParameter("rating");    
        
        
        CustomerRate rate = new CustomerRate();
        rate.setProductID(Integer.parseInt(productid));
        rate.setCustomerName(fullName);
        rate.setEmail(email);
        rate.setTimeRate(formattedDate);
        rate.setResponse(review);
        rate.setSeen(0);
        
     // Tìm bộ quản lý kết nối
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        // Tạo đối tượng thực thi chức năng
        ProductFunction product = new ProductFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", product.getCP());
        }
      
        boolean isRate = product.AddRate(rate);
        
        ProductObject  sp = product.getProduct(Integer.parseInt(productid));
        product.releaseConnection();
        request.setAttribute("product", sp);
        request.setAttribute("successMessage", "Đánh giá của bạn đã được gửi thành công!");
        request.getRequestDispatcher("product-details.jsp").forward(request, response);
        

        // Xử lý dữ liệu (ví dụ: in ra console để kiểm tra)
//        System.out.println("product ID: " + productid);
//        System.out.println("Full Name: " + fullName);
//        System.out.println("Email: " + email);
//        System.out.println("Time: " + formattedDate);
//        System.out.println("Rating: " + review);

	}

}
