package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.CustomerObject;
import util.ConnectionPool;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=utf-8";
    private static final long serialVersionUID = 1L;
    
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        String action = request.getParameter("action");

        if (action.equals("register")) {
            username = username.trim();
            email = email.trim();
            pass = pass.trim();
            if (!"".equalsIgnoreCase(username) && !"".equals(pass)) {
                ServletContext application = getServletConfig().getServletContext();
                ConnectionPool cp = (ConnectionPool) application.getAttribute("CPool");
                CustomerFunction uf = new CustomerFunctionImpl(cp);

                if (cp == null) {
                    application.setAttribute("CPool", uf.getCP());
                }

                CustomerObject item = uf.getUser(email);

                if (item == null) {
                    CustomerObject user = new CustomerObject(username, pass, email);
                    boolean results = uf.addUser(user);
                    if (!results) {
                        System.out.println("Thêm KHÔNG THÀNH CÔNG");
                    } else {
                        request.setAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                        System.out.println("THÀNH CÔNG");
                    }
                    uf.releaseConnection();
                } else {
                    request.setAttribute("errorMessageEmail", "Email đã tồn tại. Vui lòng sử dụng email khác!");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Tên tài khoản hoặc mật khẩu không hợp lệ!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }

}
