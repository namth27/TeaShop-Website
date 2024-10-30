package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.*;
import object.CartItemsObject;
import util.ConnectionPool;
import util.ConnectionPoolImpl;

/**
 * Servlet implementation class AdminCartDetail
 */
@WebServlet("/admincartdetail")
public class AdminCartDetail extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCartDetail() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	if (session != null && session.getAttribute("AdminLogined") != null) {
    		doPost(request,response);
    	} else {
    		response.sendRedirect("login");
    	}
    }
    
	protected void view(HttpServletRequest request, HttpServletResponse response, int customerId) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
	
        // Tìm bộ quản lý kết nối
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        // Tạo đối tượng thực thi chức năng
        CartItemsFunction cart = new CartItemsFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", cart.getCP());
        }
        
        
        List<CartItemsObject> cartItems = null;
        try {
            cartItems = cart.getCartItemsByCustomerId(customerId);
        } catch (SQLException e) {           
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving cart items.");           
            return;
        }
        
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("customerId", customerId);  
        request.getRequestDispatcher("CartDetail.jsp").forward(request, response);
	            
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerIdParam = request.getParameter("customer_id");
        int customerId = 0;
        
        if (customerIdParam != null) {
            customerId = Integer.parseInt(customerIdParam);          
        }        
        view(request, response, customerId);
	}
	

}
