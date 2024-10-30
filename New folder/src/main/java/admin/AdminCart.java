package admin;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.*;
import object.CustomerObject;
import util.ConnectionPool;

/**
 * Servlet implementation class AdminCart
 */
@WebServlet("/admincart")
public class AdminCart extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        CartItemsFunction cart = new CartItemsFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", cart.getCP());
        }
        
        // Lấy danh sách giỏ hàng
        List<Object[]> list_cart =null;
		try {
			list_cart = cart.getAllCartsSummary();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        cart.releaseConnection();

        // Gửi danh sách giỏ hàng đến JSP
        request.setAttribute("list_cart", list_cart);
        request.getRequestDispatcher("CartManage.jsp").forward(request, response);

    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
	    if ("deleteCart".equals(action)) {
	        int customerId = Integer.parseInt(request.getParameter("customerId"));
	        
	        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
	        CartItemsFunction cart = new CartItemsFunctionImp(cp);
	        
	        if (cp == null) {
	            getServletContext().setAttribute("CPool", cart.getCP());
	        }
	        
	        try {
	            boolean success = cart.deleteCartByCustomerID(customerId);
	            if (success) {
	                request.setAttribute("message", "Xóa giỏ hàng thành công.");
	            } else {
	                request.setAttribute("message", "Không tìm thấy giỏ hàng để xóa.");
	            }
	        } finally {
	            cart.releaseConnection();
	        }
	        
	        CustomerObject user = (CustomerObject) request.getSession().getAttribute("admin");
	        view(request, response, user);
	    } else {
	        doGet(request, response);
	    }
	}

}
