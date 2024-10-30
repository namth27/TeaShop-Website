package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.ProductObject;
import products.ProductFunction;
import products.ProductFunctionImp;
import util.*;

@WebServlet("/api/products/*")
public class RestAPI<ObjectMapper> extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RestAPI productFunction;

    @Override
    public void init() throws ServletException {
        super.init();
        ConnectionPool connectionPool = (ConnectionPool) getServletContext().getAttribute("CPool");
        ProductFunction productFunctiont  = new ProductFunctionImp(connectionPool);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            // Trường hợp lấy danh sách sản phẩm
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            Object mapper = new Object();
        } else {
            // Trường hợp lấy thông tin chi tiết sản phẩm
            String productIdStr = pathInfo.substring(1); // Bỏ qua dấu "/"
            try {
                int productId = Integer.parseInt(productIdStr);
                ProductObject product = new ProductObject();
                if (product != null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý yêu cầu POST để tạo mới một sản phẩm

    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý yêu cầu PUT để cập nhật thông tin sản phẩm
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        
        int productId;
        try {
            productId = Integer.parseInt(pathInfo.substring(1)); // Bỏ qua dấu "/"
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }


        ProductObject result = new ProductObject();

        if (result != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý yêu cầu DELETE để xóa sản phẩm
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        
        int productId;
        try {
            productId = Integer.parseInt(pathInfo.substring(1)); // Bỏ qua dấu "/"
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        boolean deleted = true;

        if (deleted) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}

