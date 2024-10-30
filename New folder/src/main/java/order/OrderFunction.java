package order;

import java.util.ArrayList;
import java.util.Map;

import object.*;
import util.ConnectionPool;

public interface OrderFunction {
    
	ArrayList<Object[]> getOrderDetail(int orderId);
    
    ArrayList<Object[]> getAllOrders();
    
    double getUnitPrice(int ProductID);
    
    boolean addOrder(OrdersObject item);
    
    boolean addOrderDetail(CartItemsObject item, int orderID);
    
    boolean delOrder(int orderId);
    
    Map<Integer, Integer> getProductsSales();
    
    ProductObject getProductByID(int ProductID);
    
    ArrayList<OrdersObject> getAllDonHang();
    
    int getLatestOrderIDByCustomerID(int customerID);

    ConnectionPool getCP();

    void releaseConnection();
    
}
