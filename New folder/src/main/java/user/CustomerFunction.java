package user;

import java.util.*;
import object.*;
import util.*;

/**
 *
 * @author admin
 */
public interface CustomerFunction {

    public boolean addUser(CustomerObject item);

    public boolean editUser(CustomerObject item);

    public boolean delUser(CustomerObject item);

    public CustomerObject getUser(int id);

    public CustomerObject getUser(String email, String password);

    public CustomerObject getUser(String email);

    public ArrayList<CustomerObject> getAllUsers();
    
    public int CustomerPosition(String email);

    public ConnectionPool getCP();

    public void releaseConnection();

}
