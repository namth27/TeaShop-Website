package cart;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import object.CartItemsObject;
import util.ConnectionPool;

/**
 *
 * @author admin
 */
public interface CartItemsFunction {

    public boolean addProduct(CartItemsObject item);

    public boolean delProduct(int CartItemID);

    public ArrayList<CartItemsObject> GetCartByCustomer(int customerID);
    
    public int countProductByCustomerID(int customerID);
    
    public List<Object[]> getAllCartsSummary() throws SQLException;
    
    List<CartItemsObject> getCartItemsByCustomerId(int customerId) throws SQLException;
    
    boolean deleteCartByCustomerID(int customerId);
    
    int getTotalQuantityByProductId(int productId) throws SQLException;
    
    List<Object[]> getAllProductQuantities() throws SQLException;
    
	String convertListToJSONString(List<String> str);
    
    public ConnectionPool getCP();

    public void releaseConnection();

}
