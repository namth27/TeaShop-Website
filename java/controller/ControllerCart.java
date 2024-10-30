package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.CartItemsFunction;
import cart.CartItemsFunctionImp;
import object.*;
import products.ProductFunction;
import products.ProductFunctionImp;
import util.ConnectionPool;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/addtocart")
public class ControllerCart extends HttpServlet {
       
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    
    public ControllerCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        CartItemsFunction carts = new CartItemsFunctionImp(cp);
        
        if (cp == null) {
            getServletContext().setAttribute("CPool", carts.getCP());
        }
        
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Lấy CustomerID từ session
            int customerID = (int) session.getAttribute("customerID");
            ArrayList<CartItemsObject> list_sp = carts.GetCartByCustomer(customerID);
            int sl = carts.countProductByCustomerID(customerID);
            request.setAttribute("list_sp", list_sp);
            request.setAttribute("sl", sl);
            double ship = 23000;
            request.setAttribute("shippingFee", ship);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
	}

	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType(CONTENT_TYPE);
	        request.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        CartItemsFunction carts = new CartItemsFunctionImp(null);
	        
	        String action = request.getParameter("action");
	        
	        if (action.equals("addtocart")) {
	        	// Thu sản phẩm từ button thêm vào giỏ hàng
		        String productId_cartStr = request.getParameter("productId_cart");
		        String productImage_cart = request.getParameter("productImage_cart");
		        String productName_cart = request.getParameter("productName_cart");
		        String productUnitPrice_cartStr = request.getParameter("productPrice_cart");
		        String quantity = request.getParameter("quantity_tt");

		        int quantityInt = Integer.parseInt(quantity);

//		        // Chuyển đổi các tham số sang kiểu int (nếu cần)
		        int productId_cart = Integer.parseInt(productId_cartStr);
		        double productPrice_cart = Double.parseDouble(productUnitPrice_cartStr);

		        

//		        // Lấy session hiện tại
		        HttpSession session = request.getSession(false);

		        if (session != null) {
		            // Lấy CustomerID từ session
		            int customerID = (int) session.getAttribute("customerID");
		            ArrayList<CartItemsObject> list_sp = carts.GetCartByCustomer(customerID);

		            // Tạo đối tượng CartItemsObject và thiết lập các thuộc tính
		            CartItemsObject cartItem = new CartItemsObject();
		            cartItem.setProductID(productId_cart);
		            cartItem.setProductImage(productImage_cart);
		            cartItem.setProductName(productName_cart);
		            cartItem.setUnitPrice(productPrice_cart);
		            cartItem.setCustomerID(customerID);
		            cartItem.setQuantity(quantityInt);

		            carts.addProduct(cartItem);
		            list_sp.add(cartItem);
		            int sl = carts.countProductByCustomerID(customerID);

		            // Chuyển hướng hoặc forward tới trang giỏ hàng hoặc trang xác nhận
		            double ship = 23000;
		            request.setAttribute("shippingFee", ship);
		            request.setAttribute("list_sp", list_sp);
		            request.setAttribute("sl", sl);
		            request.getRequestDispatcher("cart.jsp").forward(request, response);
		        } else {
		            // Phiên không tồn tại, người dùng chưa đăng nhập
		            response.sendRedirect("login.jsp");
		        }
			} else if (action.equals("delproduct")) {
				String cartItemId = request.getParameter("cartItemId");
				
				boolean checkdel = carts.delProduct(Integer.parseInt(cartItemId));
	        	if (checkdel) {
	        		ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
//	                CartItemsFunction carts = new CartItemsFunctionImp(cp);
	                
	                if (cp == null) {
	                    getServletContext().setAttribute("CPool", carts.getCP());
	                }
	                
	                HttpSession session = request.getSession(false);

	                if (session != null) {
	                    // Lấy CustomerID từ session
	                    int customerID = (int) session.getAttribute("customerID");
	                    ArrayList<CartItemsObject> list_sp = carts.GetCartByCustomer(customerID);
	                    int sl = carts.countProductByCustomerID(customerID);
	                    request.setAttribute("list_sp", list_sp);
	                    request.setAttribute("sl", sl);
	                    double ship = 23000;
	                    request.setAttribute("shippingFee", ship);
	                    request.getRequestDispatcher("cart.jsp").forward(request, response);
	                }
				} else {
					out.print("false");
				}
	        	
	        	
			}	        
		}
}
