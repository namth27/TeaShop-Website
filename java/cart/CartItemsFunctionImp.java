/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import object.CartItemsObject;
import util.ConnectionPool;
import util.ConnectionPoolImpl;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
public class CartItemsFunctionImp implements CartItemsFunction {

    private Connection con;

    private ConnectionPool cp;

    public CartItemsFunctionImp(ConnectionPool cp) {
        if (cp == null) {
            this.cp = new ConnectionPoolImpl();
        } else {
            this.cp = cp;
        }

        //Xin kết nối
        try {
            this.con = this.cp.getConnection("User");

            //Chấm dứt chế độ thực thi tự động của kết nối
            if (this.con.getAutoCommit()) {
                this.con.setAutoCommit(false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private boolean exe(PreparedStatement pre) {
        if (pre != null) {
            // pre đã được biên dịch và truyền đầy đủ giá trị cho tham số
            try {
                int result = pre.executeUpdate();
                if (result == 0) {
                    this.con.rollback();
                    return false;
                }

                // Xác nhận thực thi sau cùng
                this.con.commit();
                return true;

            } catch (SQLException e) {
                // TODO: handle exception
                e.printStackTrace();

                try {
                    this.con.rollback();
                } catch (SQLException e1) {
                    // TODO: handle exception
                    e1.printStackTrace();
                }
            } finally {
                pre = null;
            }
        }
        return false;
    }

    @Override
    public boolean addProduct(CartItemsObject item) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO CartItems(");
        sql.append("CustomerID, ProductID, Quantity, CreatedDate) ");
        sql.append("VALUES(?,?,?,?)");

        // Get current date
        String currentDate = java.time.LocalDate.now().toString(); // Format: YYYY-MM-DD

        // Compile the SQL statement
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, item.getCustomerID());
            pre.setInt(2, item.getProductID());
            pre.setInt(3, item.getQuantity());
            pre.setString(4, currentDate);

            return this.exe(pre);

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return false;
    }

    @Override
    public boolean delProduct(int CartItemID) {
        String sql = "DELETE FROM CartItems WHERE CartItemID = ? ";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, CartItemID);

            return this.exe(pre);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

            try {
                this.con.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }
        return false;
    }
    
    @Override
    public boolean deleteCartByCustomerID(int customerId) {
        String sql = "DELETE FROM CartItems WHERE CustomerID = ?";
        try (PreparedStatement ps = this.con.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            int rowsAffected = ps.executeUpdate();
            this.con.commit();
            return rowsAffected > 0;
        } catch (SQLException e) {
            try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ArrayList<CartItemsObject> GetCartByCustomer(int customerID) {
        ArrayList<CartItemsObject> results = new ArrayList<>();
        CartItemsObject item = null;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT c.CartItemID, c.ProductID, p.ProductName, p.ProductImage, p.UnitPrice, c.Quantity FROM CartItems AS c ");
        sql.append("JOIN Products AS p ON c.ProductID = p.ProductID ");
        sql.append("WHERE c.CustomerID = ? ");

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, customerID);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new CartItemsObject();
                    item.setCartItemID(rs.getInt("CartItemID"));
                    item.setProductID(rs.getInt("ProductID"));
                    item.setProductImage(rs.getString("ProductImage"));
                    item.setProductName(rs.getString("ProductName"));
                    item.setUnitPrice(rs.getDouble("UnitPrice"));
                    item.setQuantity(rs.getInt("Quantity"));
                    item.tongTien(rs.getDouble("UnitPrice"), rs.getInt("Quantity"));

                    results.add(item);
                }
                rs.close();
            }

        } catch (SQLException e) {// TODO Auto-generated catch block
            e.printStackTrace();

            //Nếu câu lệnh sql có lỗi thì trở lại trạng thái an toàn của kết nối
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }

        return results;
    }

    @Override
    public int countProductByCustomerID(int customerID) {
        int results = 0;

        String sql = "SELECT COUNT(*) FROM CartItems WHERE CustomerID = ?";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, customerID);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null && rs.next()) {
                results = rs.getInt(1);
            }

            // Đóng ResultSet và PreparedStatement
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }

        } catch (SQLException e) {// TODO Auto-generated catch block
            e.printStackTrace();

            //Nếu câu lệnh sql có lỗi thì trở lại trạng thái an toàn của kết nối
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }

        return results;
    }
    
    @Override
    public ConnectionPool getCP() {
        return this.cp;
    }

    @Override
    public void releaseConnection() {
        try {
            this.cp.releaseConnection(this.con, "User");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	@Override
	public List<Object[]> getAllCartsSummary() throws SQLException {
		List<Object[]> results = new ArrayList<>();
        String sql = "SELECT ci.CustomerID, c.CustomerFullname, MIN(ci.CreatedDate) AS CartCreatedDate, " +
                     "SUM(ci.Quantity * p.UnitPrice) AS TotalCartPrice " +
                     "FROM CartItems ci " +
                     "JOIN Customers c ON ci.CustomerID = c.CustomerID " +
                     "JOIN Products p ON ci.ProductID = p.ProductID " +
                     "GROUP BY ci.CustomerID, c.CustomerFullname " +
                     "ORDER BY CartCreatedDate DESC";
        try (PreparedStatement ps = this.con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Object[] item = new Object[4];
                item[0] = rs.getInt("CustomerID");
                item[1] = rs.getString("CustomerFullname");
                item[2] = rs.getDate("CartCreatedDate");
                item[3] = rs.getBigDecimal("TotalCartPrice");
                results.add(item);
            }
        }
        return results;
	}

	@Override
	public List<CartItemsObject> getCartItemsByCustomerId(int customerId) throws SQLException {
		List<CartItemsObject> results = new ArrayList<>();
		CartItemsObject item = null;
        String sql = "SELECT ci.CartItemID, ci.CustomerID, p.ProductID, p.ProductImage, p.ProductName, p.UnitPrice, ci.Quantity, ci.CreatedDate "
        		+ "FROM CartItems ci "
        		+ "JOIN Products p ON ci.ProductID = p.ProductID "
        		+ "WHERE ci.CustomerID = ?";
        
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, customerId);
            ResultSet rs = pre.executeQuery();
            while (rs != null && rs.next()) {
            	item = new CartItemsObject();
            	item.setCartItemID(customerId);
                item.setProductID(customerId);
                item.setProductName(rs.getString("ProductName"));
                item.setProductImage(rs.getString("ProductImage"));
                item.setUnitPrice(rs.getDouble("UnitPrice"));
                item.setQuantity(rs.getInt("Quantity"));
                item.tongTien(rs.getDouble("UnitPrice"), rs.getInt("Quantity"));
                
                results.add(item);
            }     
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } 

        return results;
	}

	@Override
	public int getTotalQuantityByProductId(int productId) throws SQLException {
		int totalQuantity = 0;
	    String sql = "SELECT SUM(Quantity) AS TotalQuantity FROM CartItems WHERE ProductID = ?";
	    try (PreparedStatement ps = this.con.prepareStatement(sql)) {
	        ps.setInt(1, productId);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                totalQuantity = rs.getInt("TotalQuantity");
	            }
	        }
	    }
	    return totalQuantity;
	}

	@Override
	public List<Object[]> getAllProductQuantities() throws SQLException {
		 List<Object[]> productQuantities = new ArrayList<>();
		    String sql = "SELECT ProductID, SUM(Quantity) AS TotalQuantity FROM CartItems GROUP BY ProductID";
		    try (PreparedStatement ps = this.con.prepareStatement(sql);
		         ResultSet rs = ps.executeQuery()) {
		        while (rs.next()) {
		            int productId = rs.getInt("ProductID");
		            int totalQuantity = rs.getInt("TotalQuantity");
		            Object[] productQuantity = new Object[2];
		            productQuantity[0] = productId;
		            productQuantity[1] = totalQuantity;
		            productQuantities.add(productQuantity);
		        }
		    }
		    return productQuantities;
	}

	@Override
	public String convertListToJSONString(List<String> str) {
		StringBuilder sb = new StringBuilder("[");

        for (int i = 0; i < str.size(); i++) {
            sb.append("\"").append(str.get(i)).append("\"");
            if (i < str.size() - 1) {
                sb.append(", ");
            }
        }

        sb.append("]");
        return sb.toString();
	}
	
	
	
	 public static void main(String[] args) {
	        CartItemsFunction uf = new CartItemsFunctionImp(null);

//	        ArrayList<CartItemsObject> list_sp = uf.GetCartByCustomer(26);
//	        int sl = uf.countProductByCustomerID(26);
//
////	        System.out.println(list_sp);
////	        System.out.println(sl);
//	        boolean check = uf.delProduct(4);
//	        if (check) {
//	            System.out.println("Xóa Thành công");
//	        } else {
//	            System.out.println("Deo xóa đc");
//	        }

	        boolean check = uf.delProduct(2);
	        if (check) {
	        	System.out.println("true");
			} else {
				System.out.println("false");
			}
	    }

}
