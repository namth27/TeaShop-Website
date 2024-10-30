package admin;

import java.io.IOException;
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
import object.CartItemsObject;
import order.OrderFunction;
import order.OrderFunctionImpl;
import util.ConnectionPool;

/**
 * Servlet implementation class OrderDetails
 */
@WebServlet("/adminorderdetails")
public class AdminOrderDetails extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderDetails() {
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
    
	protected void view(HttpServletRequest request, HttpServletResponse response, int orderId) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
	
		ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        OrderFunction orderFunction = new OrderFunctionImpl(cp);
        if (cp == null) {
            getServletContext().setAttribute("CPool", orderFunction.getCP());
        }
        
        
        ArrayList<Object[]> orderDetails = null;
        orderDetails = orderFunction.getOrderDetail(orderId);
        if(orderDetails!=null) {
        	request.setAttribute("orderDetails", orderDetails);
            request.setAttribute("orderId", orderId);  
            request.getRequestDispatcher("OrderDetails.jsp").forward(request, response);
        }
        else {
        	request.setAttribute("error", "Chi tiết đơn hàng trống");
        }
            
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
    
        if (orderId != 0) {
        	view(request, response, orderId);
        }        
     
	}

}
