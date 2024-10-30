package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import cart.CartItemsFunction;
import cart.CartItemsFunctionImp;
import object.CartItemsObject;
import object.OrdersObject;
import object.ProductObject;
import products.ProductFunction;
import products.ProductFunctionImp;
import util.ConnectionPool;
import order.*;

/**
 * Servlet implementation class Order
 */
@WebServlet("/order")
public class Order extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
	private static final long serialVersionUID = 1L;
       
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		int customerID = (int) session.getAttribute("customerID");
		
		
		ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        CartItemsFunction carts = new CartItemsFunctionImp(cp);
        OrderFunction orders = new OrderFunctionImpl(cp);
        ProductFunction products = new ProductFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", carts.getCP());
            getServletContext().setAttribute("CPool", orders.getCP());
            getServletContext().setAttribute("CPool", products.getCP());
        }
		
		String action = request.getParameter("action");
		
		if (action.equals("checkcout")) {      
	        if (session != null) {
	            // Lấy CustomerID từ session
	            ArrayList<CartItemsObject> list_sp = carts.GetCartByCustomer(customerID);
	            int sl = carts.countProductByCustomerID(customerID);
	            request.setAttribute("list_ product", list_sp);
	            request.setAttribute("sl", sl);

	            request.getRequestDispatcher("checkout.jsp").forward(request, response);
	        }	
		} else if (action.equals("isok")) {
			
			String sl = request.getParameter("sl");
			String id = request.getParameter("id");
			String quantity = request.getParameter("quantity");
			
			String hoten = request.getParameter("hoten");
			String diachi = request.getParameter("diachi");
			String tinhthanh = request.getParameter("tinhthanh");
			String sdt = request.getParameter("sdt");
			String text = request.getParameter("text");
			
			LocalDate today = LocalDate.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String formattedDate = today.format(formatter);
			
			OrdersObject order = new OrdersObject();
			order.setCustomerId(customerID);
			order.setOrderDate(formattedDate);
			order.setFreight(customerID);
			order.setShipName(hoten);
			order.setShipAddress(diachi+" Tỉnh thành: "+ tinhthanh);
			order.setStatus("Cancelled");
			
			if (Integer.parseInt(sl) == 1) {
							
				ProductObject sp = products.getProduct(Integer.parseInt(id));
				
				CartItemsObject item = new CartItemsObject();
				item.setProductID(Integer.parseInt(id));
				item.setUnitPrice(sp.getUnitPrice());
				item.setQuantity(Integer.parseInt(quantity));
				
				boolean addorder = orders.addOrder(order);
				
				boolean addetail = orders.addOrderDetail(item, orders.getLatestOrderIDByCustomerID(customerID));
				
				if (addorder && addetail) {
					session.setAttribute("successMessage", "Đặt hàng thành công!");
					response.sendRedirect("index");
				} else {
					out.print(addetail);
					out.print(orders.getLatestOrderIDByCustomerID(customerID));
					out.print(addorder);
					out.print("khong dat duoc");
				}			
			} else {
				ArrayList<CartItemsObject> list_sp = carts.GetCartByCustomer(customerID);
				
				boolean addorder = orders.addOrder(order);
				
				boolean check = true;

				CartItemsObject item = new CartItemsObject();
				for (CartItemsObject u : list_sp) {
				    item.setProductID(u.getProductID());
				    item.setUnitPrice(u.getUnitPrice());
				    item.setQuantity(u.getQuantity());
				    
				    boolean addetail = orders.addOrderDetail(item, orders.getLatestOrderIDByCustomerID(customerID));
				    if (!addetail) {
				        check = false;
				        break; 
				    }
				}
				
				if (addorder && check) {
					boolean delall = carts.deleteCartByCustomerID(customerID);
					session.setAttribute("successMessage", "Đặt hàng thành công!");
					response.sendRedirect("index");
				}			
			}		
			
		} else {
			
		}		
	}

}
