package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.CustomerObject;
import user.CustomerFunction;
import user.CustomerFunctionImpl;
import util.ConnectionPool;

/**
 * Servlet implementation class IndexAdmin
 */
@WebServlet("/indexadmin")
public class IndexAdmin extends HttpServlet {

    private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    
    public IndexAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        CustomerFunction customer = new CustomerFunctionImpl(cp);

        if (cp == null) {
            getServletContext().setAttribute("CPool", customer.getCP());
        }

        request.getRequestDispatcher("index_admin.jsp").forward(request, response);

    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
