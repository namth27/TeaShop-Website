package admin;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import object.CustomerObject;
import object.OrdersObject;
import order.OrderFunction;
import order.OrderFunctionImpl;
import util.ConnectionPool;

@WebServlet("/adminorder")
public class AdminOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String CONTENT_TYPE = "text/html; charset=utf-8";

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

        ConnectionPool cp = (ConnectionPool) getServletContext().getAttribute("CPool");
        OrderFunction orderFunction = new OrderFunctionImpl(cp);
        if (cp == null) {
            getServletContext().setAttribute("CPool", orderFunction.getCP());
        }
       
     // Lấy danh sách đơn hàng
        ArrayList<OrdersObject> orderList = orderFunction.getAllDonHang();
        request.setAttribute("orderList", orderList);

        // Chuyển tiếp đến trang JSP
        request.getRequestDispatcher("tbldonhang.jsp").forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
