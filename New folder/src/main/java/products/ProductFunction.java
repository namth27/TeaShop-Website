package products;

import java.util.ArrayList;
import java.util.List;

import object.CustomerRate;
import object.ProductObject;
import util.ConnectionPool;

/**
 *
 * @author admin
 */
public interface ProductFunction {
	
    public boolean addProduct(ProductObject item);
    
    public boolean editProduct(ProductObject item);

    public boolean delProduct(int productID);
    
    public ProductObject getProduct(int id);
    
    public ArrayList<ProductObject> getAllProduct();
    
    public ArrayList<ProductObject> getTopProductByCategoryId(int id, int top);
    
    public int countProductByCategory(int CategoryId);
    
    public int totalProduct();
    
    public int getCategoryById(int ProductID);
    
    public ArrayList<Integer> getTotalUnitInStockByCategory();
    
    public ArrayList<Integer> getTotalUnitsOnOrderByCategory();
    
    public ArrayList<Integer> getStatisticalByUnitprice(int CategoryID);
    
    public boolean AddRate(CustomerRate item);
    
    public ArrayList<CustomerRate> getRate(int Seen);
    
    public boolean checkrate(CustomerRate item);
    
    public ArrayList<ProductObject> search(String key);
    
    public List<ProductObject> getProductsByPage(int page, int pageSize);
    
    public ConnectionPool getCP();

    public void releaseConnection();
}
