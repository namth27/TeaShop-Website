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
import categories.CategoryFunction;
import categories.CategoryFunctionImp;
import products.ProductFunction;
import products.ProductFunctionImp;
import util.ConnectionPool;
import object.*;

/**
 * Servlet implementation class ControllerShop
 */
@WebServlet("/shop")
public class ControllerShop extends HttpServlet {
	
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;

    public ControllerShop() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();

        // Tìm bộ quản lý kết nối
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        ProductFunction products = new ProductFunctionImp(cp);
        CartItemsFunction carts = new CartItemsFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", products.getCP());
        }
		
        ArrayList<ProductObject> list_prodcusts = products.getAllProduct();
        products.releaseConnection();
        
        HttpSession session = request.getSession(false);

        if (session != null) {
            Integer customerID = (Integer) session.getAttribute("customerID");
            if (customerID != null) {
                int sl = carts.countProductByCustomerID(customerID);
                request.setAttribute("sl", sl);
            } else {
                request.setAttribute("sl", 0);
            }
        } else {
            request.setAttribute("sl", 0);
        }

        request.setAttribute("data_products", list_prodcusts);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String searchContent = request.getParameter("content");

        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        ProductFunction products = new ProductFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", products.getCP());
        }
        
        ArrayList<ProductObject> list_prodcusts = products.search(searchContent);
        String message = "Danh sách các sản phẩm tìm kiếm: " + searchContent;
        request.setAttribute("message", message);
        request.setAttribute("data_products", list_prodcusts);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

	}
}
