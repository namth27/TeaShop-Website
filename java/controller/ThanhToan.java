package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.CartItemsFunction;
import cart.CartItemsFunctionImp;
import object.CartItemsObject;
import object.ProductObject;
import products.ProductFunction;
import products.ProductFunctionImp;

/**
 * Servlet implementation class ThanhToan
 */
@WebServlet("/thanhtoan")
public class ThanhToan extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    
    public ThanhToan() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        CartItemsFunction carts = new CartItemsFunctionImp(null);
        ProductFunction products = new ProductFunctionImp(null);
        
        String action = request.getParameter("action");
        
        // Lấy session hiện tại
        HttpSession session = request.getSession(false);
        
        if (action.equals("checkout1")) {
        	
        	String productId_ttStr = request.getParameter("productId_tt");
            String productImage_tt = request.getParameter("productImage_tt");
            String productName_tt = request.getParameter("productName_tt");
            String productPrice_ttStr = request.getParameter("productPrice_tt");
            String quantity = request.getParameter("quantity_tt");

            int quantityInt = Integer.parseInt(quantity);
            int productId_cart = Integer.parseInt(productId_ttStr);
            double productPrice_tt = Double.parseDouble(productPrice_ttStr);

//            out.println(session);

            if (session != null) {
            	
            	Integer customerID = (Integer) session.getAttribute("customerID");
    			if (customerID != null) {
    				int sl = carts.countProductByCustomerID(customerID);
    				request.setAttribute("sl", sl);
    			} else {
    				request.setAttribute("sl", 0);
    			}

                // Tạo đối tượng CartItemsObject và thiết lập các thuộc tính
                ArrayList<CartItemsObject> list_sp = new ArrayList<>();
                CartItemsObject cartItem = new CartItemsObject();
                cartItem.setProductID(productId_cart);
                cartItem.setProductImage(productImage_tt);
                cartItem.setProductName(productName_tt);
                cartItem.setUnitPrice(productPrice_tt);
                cartItem.setQuantity(quantityInt);

                list_sp.add(cartItem);

                request.setAttribute("list_ product", list_sp);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
		} else if (action.equals("isok")) {
			String hoten = request.getParameter("hoten");
			String diachi = request.getParameter("diachi");
			String tinhthanh = request.getParameter("tinhthanh");
			String sdt = request.getParameter("sdt");
			String text = request.getParameter("text");

			out.println(hoten);
			out.println(diachi);
			out.println(tinhthanh);
			out.println(sdt);
			out.println(text);
		}
	}

}
