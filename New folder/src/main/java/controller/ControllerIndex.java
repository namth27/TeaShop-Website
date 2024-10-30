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
 * Servlet implementation class ControllerIndex
 */
@WebServlet("/index")
public class ControllerIndex extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
	private static final long serialVersionUID = 1L;

	public ControllerIndex() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);

		ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");

		ProductFunction product = new ProductFunctionImp(cp);
		CategoryFunction categories = new CategoryFunctionImp(cp);
		CartItemsFunction carts = new CartItemsFunctionImp(cp);

		if (cp == null) {
			getServletContext().setAttribute("CPool", product.getCP());
			getServletContext().setAttribute("CPool", categories.getCP());
		}

		ArrayList<CategoriesObject> listcategories1 = categories.getTop4Categories(0);
		ArrayList<CategoriesObject> listcategories2 = categories.getTop4Categories(4);
		categories.releaseConnection();

		ArrayList<ProductObject> product1 = product.getTopProductByCategoryId(5, 2);
		ArrayList<ProductObject> product2 = product.getTopProductByCategoryId(6, 3);
		ArrayList<ProductObject> product3 = product.getTopProductByCategoryId(7, 3);
		ArrayList<ProductObject> product4 = product.getTopProductByCategoryId(8, 4);
		product.releaseConnection();

		// Tạo một ArrayList mới để chứa tất cả các sản phẩm
		ArrayList<ProductObject> allProducts = new ArrayList<>();
		allProducts.addAll(product1);
		allProducts.addAll(product2);
		allProducts.addAll(product3);
		allProducts.addAll(product4);
		
		HttpSession session = request.getSession();
        String successMessage = (String) session.getAttribute("successMessage");

        if (successMessage != null) {
            request.setAttribute("successMessage", successMessage);
            session.removeAttribute("successMessage"); // Xóa thông báo sau khi đã sử dụng
        }
        

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

		request.setAttribute("data_categories1", listcategories1);
		request.setAttribute("data_categories2", listcategories2);
		request.setAttribute("data_product", allProducts);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);

		ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
		ProductFunction product = new ProductFunctionImp(cp);
		CategoryFunction categories = new CategoryFunctionImp(cp);
		CartItemsFunction carts = new CartItemsFunctionImp(cp);
		if (cp == null) {
			getServletContext().setAttribute("CPool", product.getCP());
			getServletContext().setAttribute("CPool", categories.getCP());
		}

		String productId = request.getParameter("productId");
		if (productId != null) {
			try {
				int id = Integer.parseInt(productId);
				ProductObject item = product.getProduct(id);
				if (item != null) {
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
					request.setAttribute("product", item);
					request.getRequestDispatcher("product-details.jsp").forward(request, response);
					return; // Kết thúc xử lý để không tiếp tục chuyển hướng
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		
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
		
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        ArrayList<ProductObject> products = product.getTopProductByCategoryId(categoryId, product.countProductByCategory(categoryId));
        product.releaseConnection();
        request.setAttribute("data_products", products);
        String message = "Danh sách các sản phẩm thuộc thể loại " + categories.getCategoryName(categoryId);
        categories.releaseConnection();
        request.setAttribute("message", message);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
	}

}
