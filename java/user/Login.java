package user;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ConnectionPool;
import object.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("email_login");
        String pass = request.getParameter("pass_login");

        String action = request.getParameter("action");

        if (action.equals("login")) {
            name = name.trim();
            pass = pass.trim();
            if (!"".equalsIgnoreCase(name) && !"".equals(pass)) {
                ServletContext application = getServletConfig().getServletContext();
                ConnectionPool cp = (ConnectionPool) application.getAttribute("CPool");
                CustomerFunction uf = new CustomerFunctionImpl(cp);

                if (cp == null) {
                    application.setAttribute("CPool", uf.getCP());
                }

                CustomerObject user = uf.getUser(name, pass);
                int position = uf.CustomerPosition(user.getCustomerEmail());
                uf.releaseConnection();

                if (user != null && position == 0) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("Login", user);

                    // Giả sử customerID là một thuộc tính của đối tượng CustomerObject
                    int customerID = user.getCustomerID();
                    session.setAttribute("customerID", customerID);

                    response.sendRedirect("index");
                } else if (user != null && position == 1) {
                    // Tham chiếu phiên làm việc(session) 
                    HttpSession sision = request.getSession(true);

                    // Đưa thông tin đăng nhập vào phiên
                    sision.setAttribute("admin", user);

                    // Chuyển sang giao diện chính
                    response.sendRedirect("index_admin.jsp");
                } else {
                    request.setAttribute("errorMessage", "Tên tài khoản hoặc mật khẩu không chính xác.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Tên tài khoản hoặc mật khẩu không chính xác.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
	}

}
