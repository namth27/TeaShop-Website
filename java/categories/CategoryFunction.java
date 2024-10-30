package categories;

import java.util.ArrayList;
import object.CategoriesObject;
import util.ConnectionPool;

/**
 *
 * @author admin
 */
public interface CategoryFunction {

    public boolean addCategory(CategoriesObject item);

    public boolean editUser(CategoriesObject item);

    public boolean delUser(CategoriesObject item);

    public CategoriesObject getCategory(int id);

    public ArrayList<CategoriesObject> getAllCategories();

    public ArrayList<CategoriesObject> getTop4Categories(int id);
    
    public String getCategoryName(int CategoryId);
    
    public ArrayList<String> getAllNameCategories();
    
    public String convertListToJSONString(ArrayList<String> list);

    public ConnectionPool getCP();

    public void releaseConnection();
}
