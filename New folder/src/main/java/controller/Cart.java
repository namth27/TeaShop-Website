package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.*;
import object.CartItemsObject;
import util.ConnectionPool;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart")
public class Cart extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Tìm bộ quản lý kết nối
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        // Tạo đối tượng thực thi chức năng
        CartItemsFunction cart = new CartItemsFunctionImp(cp);
        
        if (cp == null) {
            getServletContext().setAttribute("CPool", cart.getCP());
        }
        
     // Lấy session hiện tại
        HttpSession session = request.getSession(false);
        int customerID = 0;
     
        double shippingFee = 0.0; 
        int sl = 0;
        if (session != null) {
            customerID = (int) session.getAttribute("customerID");
            
        }
               
        List<CartItemsObject> cartItems = null;
        try {
            cartItems = cart.getCartItemsByCustomerId(customerID);
        } catch (SQLException e) {           
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving cart items.");           
            return;
        }
        
//        if (cartItems != null && !cartItems.isEmpty()) {          
//            try {
//				sl = cart.countProductByCustomerID(customerID);
//				shippingFee = 23000;
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//        } 
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("shippingFee", shippingFee);
        request.setAttribute("sl", sl);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
        
              
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
        
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        CartItemsFunction cart = new CartItemsFunctionImp(cp);
        if (cp == null) {
            getServletContext().setAttribute("CPool", cart.getCP());
        }
        
        
        if(action.equals("addToCart")) {
        	int customerID = Integer.parseInt(request.getParameter("CustomerID"));
        	int productID =  Integer.parseInt(request.getParameter("productID"));
            int quantity =  Integer.parseInt(request.getParameter("quantity"));
            
            
            
            
            
//            try {
////				cart.addToCart(customerID, productID, quantity);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
        }
        
        if("delete".equals(action)) {
        	boolean checkdel = cart.delProduct(cartItemId);
        	if (checkdel) {
				
			} else {
				
			}
        }
        doGet(request,response);
	}

}
