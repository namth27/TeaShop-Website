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

import cart.*;
import object.CustomerObject;
import util.ConnectionPool;

/**
 * Servlet implementation class AdminChartCart
 */
@WebServlet("/adminchartcart")
public class AdminChartCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChartCart() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	CustomerObject user = (CustomerObject) request.getSession().getAttribute("admin");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            view(request, response, user);
        }
    }
    
	protected void view(HttpServletRequest request, HttpServletResponse response, CustomerObject user) throws ServletException, IOException {

		
		// Tìm bộ quản lý kết nối
        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        // Tạo đối tượng thực thi chức năng
        CartItemsFunction cart = new CartItemsFunctionImp(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", cart.getCP());
        }
        List<String> labels = new ArrayList<>();
        List<Integer> data = new ArrayList<>();
        try {
        	List<Object[]> chartData11 = cart.getAllProductQuantities();
			for (Object[] item : chartData11) {
				labels.add(String.valueOf(item[0]));
				data.add((Integer) item[1]);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        cart.releaseConnection();
        
        String labels_cv;
        labels_cv = cart.convertListToJSONString(labels);
     // Gửi danh sách data để vẽ biểu đồ đến JSP
        request.setAttribute("labels", labels_cv);
        request.setAttribute("data", data);
        request.getRequestDispatcher("ChartCart.jsp").forward(request, response);
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
