package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import object.CustomerObject;
import object.CustomerRate;
import object.ProductObject;
import products.ProductFunction;
import products.ProductFunctionImp;
import util.ConnectionPool;

/**
 * Servlet implementation class AdminRate
 */
@WebServlet("/adminrate")
public class AdminRate extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
	private static final long serialVersionUID = 1L;

	public AdminRate() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
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
		ProductFunction product = new ProductFunctionImp(cp);

		if (cp == null) {
			getServletContext().setAttribute("CPool", product.getCP());
		}
//
//		// Lấy danh sách hiển thị
//		ArrayList<ProductObject> list_product = product.getAllProduct();
//		product.releaseConnection();
//
//		request.setAttribute("list_product", list_product);
		request.getRequestDispatcher("tblsanpham.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
		ProductFunction product = new ProductFunctionImp(cp);

		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		if ("complete".equals(action)) {
			String rateID = request.getParameter("RateID");
			
			CustomerRate item = new CustomerRate();
			item.setRateID(Integer.parseInt(rateID));
			
			boolean isrespone = product.checkrate(item);

            if (isrespone) {
                session.setAttribute("message", "Phản hồi khách hàng thành công!");
            } else {
            	session.setAttribute("message", "Phản hồi khách hàng thất bại.");
            }
            
            ArrayList<CustomerRate> ds = product.getRate(0);
            product.releaseConnection();
            request.setAttribute("ds", ds);

            request.getRequestDispatcher("phanhoisanpham.jsp").forward(request, response);
		} 
	}

}
