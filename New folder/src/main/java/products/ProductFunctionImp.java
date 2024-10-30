package products;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.util.List;

import object.CustomerRate;
import object.ProductObject;
import util.ConnectionPool;
import util.ConnectionPoolImpl;

/**
 *
 * @author admin
 */
public class ProductFunctionImp implements ProductFunction {

    private java.sql.Connection con;

    private ConnectionPool cp;

    public ProductFunctionImp(ConnectionPool cp) {
        if (cp == null) {
            this.cp = new ConnectionPoolImpl();
        } else {
            this.cp = cp;
        }
        try {
            this.con = this.cp.getConnection("User");
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
    public boolean addProduct(ProductObject item) {
        StringBuilder sql = new StringBuilder();

        sql.append("INSERT INTO Products(");
        sql.append("ProductName, ProductImage, SupplierID, CategoryID,");
        sql.append("QuantityPerUnit, UnitPrice, UnitsInStock, ReorderLevel,");
        sql.append("Discontinued, Description) ");
        sql.append("VALUES(?,?,?,?,?,?,?,?,?,?)");

        // Biên dịch
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setString(1, item.getProductName());
            pre.setString(2, item.getProductImage());
            pre.setInt(3, item.getSupplierID());
            pre.setInt(4, item.getCategoryID());
            pre.setString(5, item.getQuantityPerUnit());

            pre.setDouble(6, item.getUnitPrice());
            pre.setInt(7, item.getUnitsInStock());
            pre.setInt(8, item.getReorderLevel());
            pre.setBoolean(9, item.isDiscontinued());
            pre.setString(10, item.getDescription());

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
    public boolean editProduct(ProductObject item) {
        StringBuilder sql = new StringBuilder();

        sql.append("UPDATE Products SET ");
        sql.append("ProductName = ? , ProductImage = ? , SupplierID = ? , ");
        sql.append("CategoryID = ? , QuantityPerUnit = ? , UnitPrice = ? , UnitsInStock = ? , ");
        sql.append("ReorderLevel = ? , Discontinued = ? , Description = ? ");
        sql.append("WHERE ProductID = ?");

        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setString(1, item.getProductName());
            pre.setString(2, item.getProductImage());
            pre.setInt(3, item.getSupplierID());
            pre.setInt(4, item.getCategoryID());
            pre.setString(5, item.getQuantityPerUnit());
            pre.setDouble(6, item.getUnitPrice());
            pre.setInt(7, item.getUnitsInStock());
            pre.setInt(8, item.getReorderLevel());
            pre.setBoolean(9, item.isDiscontinued());
            pre.setString(10, item.getDescription());
            pre.setInt(11, item.getProductID());

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
    public boolean delProduct(int productID) {
        String sql = "DELETE FROM Products WHERE ProductID = ?";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, productID);

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
    public ProductObject getProduct(int id) {
        String sql = "SELECT * FROM Products WHERE (ProductID = ?)";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, id);

            ResultSet rs = pre.executeQuery();

            ProductObject item = null;
            if (rs != null) {
                if (rs.next()) {
                    item = new ProductObject();
                    item.setProductID(rs.getInt("ProductID"));
                    item.setProductName(rs.getString("ProductName"));
                    item.setProductImage(rs.getString("ProductImage"));
                    item.setSupplierID(rs.getInt("SupplierID"));
                    item.setCategoryID(rs.getInt("CategoryID"));
                    item.setQuantityPerUnit(rs.getString("QuantityPerUnit"));
                    item.setUnitPrice(rs.getDouble("UnitPrice"));
                    item.setUnitsInStock(rs.getInt("UnitsInStock"));
                    item.setDiscontinued(rs.getBoolean("Discontinued"));
                    item.setDescription(rs.getString("Description"));
                }

            }

            return item;

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
        return null;
    }

    @Override
    public ArrayList<ProductObject> getAllProduct() {
        ArrayList<ProductObject> results = new ArrayList<>();
        ProductObject item = null;

        String sql = "SELECT * FROM Products";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
//                    ProductID, ProductName, ProductImage, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, Description
                    item = new ProductObject();
                    item.setProductID(rs.getInt("ProductID"));
                    item.setProductName(rs.getString("ProductName"));
                    item.setProductImage(rs.getString("ProductImage"));
                    item.setSupplierID(rs.getInt("SupplierID"));
                    item.setCategoryID(rs.getInt("CategoryID"));
                    item.setQuantityPerUnit(rs.getString("QuantityPerUnit"));
                    item.setUnitPrice(rs.getDouble("UnitPrice"));
                    item.setUnitsInStock(rs.getInt("UnitsInStock"));
                    item.setUnitsInStock(rs.getInt("UnitsOnOrder"));
                    item.setReorderLevel(rs.getInt("ReorderLevel"));
                    item.setDiscontinued(rs.getBoolean("Discontinued"));
                    item.setDescription(rs.getString("Description"));
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
    public int countProductByCategory(int CategoryId) {
        int results = 0;

        String sql = "SELECT COUNT(*) FROM Products WHERE CategoryID = ?";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, CategoryId);

            ResultSet rs = pre.executeQuery();
            if (rs != null && rs.next()) {
                // Lấy giá trị từ cột đầu tiên của kết quả
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
    public int totalProduct() {
        int results = 0;

        String sql = "SELECT COUNT(*) FROM Products";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null && rs.next()) {
                // Lấy giá trị từ cột đầu tiên của kết quả
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
    public ArrayList<ProductObject> getTopProductByCategoryId(int id, int top) {
        ArrayList<ProductObject> results = new ArrayList<>();
        ProductObject item = null;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Products ");
        sql.append("WHERE CategoryID = ? ");
        sql.append("ORDER BY UnitPrice DESC ");
        sql.append("LIMIT ?");

        //Biên dịch câu lệnh ORDER BY price DESC
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, id);
            pre.setInt(2, top);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new ProductObject();
                    item.setProductID(rs.getInt("ProductID"));
                    item.setProductName(rs.getString("ProductName"));
                    item.setProductImage(rs.getString("ProductImage"));
                    item.setSupplierID(rs.getInt("SupplierID"));
                    item.setCategoryID(rs.getInt("CategoryID"));
                    item.setQuantityPerUnit(rs.getString("QuantityPerUnit"));
                    item.setUnitPrice(rs.getDouble("UnitPrice"));
                    item.setUnitsInStock(rs.getInt("UnitsInStock"));
                    item.setUnitsInStock(rs.getInt("UnitsOnOrder"));
                    item.setReorderLevel(rs.getInt("ReorderLevel"));
                    item.setDiscontinued(rs.getBoolean("Discontinued"));
                    item.setDescription(rs.getString("Description"));
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

    public List<ProductObject> getProductsByPage(int page, int pageSize) {
        List<ProductObject> products = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT * FROM Products LIMIT ? OFFSET ?";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, pageSize);
            pre.setInt(2, offset);
            ResultSet rs = pre.executeQuery();

            while (rs != null && rs.next()) {
                ProductObject product = new ProductObject();
                // Giả sử Product có các thuộc tính id, name, price và imageUrl
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setUnitPrice(rs.getDouble("UnitPrice"));
                product.setProductImage(rs.getString("ProductImage"));
                products.add(product);
            }

            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return products;
    }

    @Override
    public int getCategoryById(int ProductID) {
        int results = 0;

        String sql = "SELECT CategoryID FROM Products WHERE ProductID = ?";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, ProductID);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null && rs.next()) {
                // Lấy giá trị từ cột đầu tiên của kết quả
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
    public ArrayList<Integer> getTotalUnitInStockByCategory() {
        ArrayList<Integer> results = new ArrayList<>();

        String sql = "SELECT CategoryID, SUM(UnitsInStock) AS TotalUnitsInStock "
                + "FROM Products "
                + "GROUP BY CategoryID";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            
            // Execute query
            ResultSet rs = pre.executeQuery();
            while (rs != null && rs.next()) {
                // Get the sum of UnitsInStock for each category
                int totalUnitsInStock = rs.getInt("TotalUnitsInStock");
                results.add(totalUnitsInStock);
            }

            // Close ResultSet and PreparedStatement
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            
            // Rollback if there is an SQL error
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        
        return results;
    }
    
    @Override
    public ArrayList<Integer> getTotalUnitsOnOrderByCategory() {
        ArrayList<Integer> results = new ArrayList<>();

        String sql = "SELECT CategoryID, SUM(UnitsOnOrder) AS TotalUnitsInStock "
                + "FROM Products "
                + "GROUP BY CategoryID";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            
            // Execute query
            ResultSet rs = pre.executeQuery();
            while (rs != null && rs.next()) {
                // Get the sum of UnitsInStock for each category
                int totalUnitsInStock = rs.getInt("TotalUnitsInStock");
                results.add(totalUnitsInStock);
            }

            // Close ResultSet and PreparedStatement
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            
            // Rollback if there is an SQL error
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        
        return results;
    }
    
    @Override
    public ArrayList<Integer> getStatisticalByUnitprice(int CategoryID) {
    	ArrayList<Integer> results = new ArrayList<>();

    	StringBuilder sql = new StringBuilder();

    	sql.append("SELECT CategoryID, ");
    	sql.append("MAX(UnitPrice) / 1000 AS MaxPrice, ");
    	sql.append("FLOOR((MAX(UnitPrice) - AVG(UnitPrice)) / 2000) AS HalfMaxAvgDiff, ");
    	sql.append("AVG(UnitPrice) / 1000 AS AvgPrice, ");
    	sql.append("FLOOR((AVG(UnitPrice) - MIN(UnitPrice)) / 2000) AS HalfAvgMinDiff, ");
    	sql.append("MIN(UnitPrice) / 1000 AS MinPrice ");
    	sql.append("FROM Products ");
    	sql.append("WHERE CategoryID = ? ");
    	sql.append("GROUP BY CategoryID");
        
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, CategoryID);
            // Execute query
            ResultSet rs = pre.executeQuery();
            while (rs != null && rs.next()) {
                // Get the sum of UnitsInStock for each category
                int MinPrice = rs.getInt("MinPrice");
                results.add(MinPrice);
                int HalfAvgMinDiff = rs.getInt("HalfAvgMinDiff");
                results.add(HalfAvgMinDiff);
                int AvgPrice = rs.getInt("AvgPrice");
                results.add(AvgPrice);
                int HalfMaxAvgDiff = rs.getInt("HalfMaxAvgDiff");
                results.add(HalfMaxAvgDiff);
                int max = rs.getInt("MaxPrice");
                results.add(max);
            }

            // Close ResultSet and PreparedStatement
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            
            // Rollback if there is an SQL error
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        
        return results;
    }
    
    @Override
    public boolean AddRate(CustomerRate item) {
    	StringBuilder sql = new StringBuilder();

        sql.append("INSERT INTO CustomerRate(");
        sql.append("ProductID, CustomerName, Email, TimeRate, Response, Seen) ");
        sql.append("VALUES(?,?,?,?,?,?)");

        // Biên dịch
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, item.getProductID());
            pre.setString(2, item.getCustomerName());
            pre.setString(3, item.getEmail());
            pre.setString(4, item.getTimeRate());
            pre.setString(5, item.getResponse());
            pre.setInt(6, item.getSeen());

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
    public ArrayList<CustomerRate> getRate(int Seen) {
    	ArrayList<CustomerRate> rates = new ArrayList<>();
        String sql = "SELECT * FROM CustomerRate WHERE Seen = ?";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, Seen);
            ResultSet rs = pre.executeQuery();

            while (rs != null && rs.next()) {
            	CustomerRate rate = new CustomerRate();
                // Giả sử Product có các thuộc tính id, name, price và imageUrl
            	rate.setRateID(rs.getInt("rateID"));
            	rate.setProductID(rs.getInt("ProductID"));
            	rate.setCustomerName(rs.getString("CustomerName"));
            	rate.setEmail(rs.getString("Email"));
            	rate.setTimeRate(rs.getString("TimeRate"));
            	rate.setResponse(rs.getString("Response"));
            	rates.add(rate);
            }

            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return rates;
    }
    
    @Override
    public boolean checkrate(CustomerRate item) {
    	StringBuilder sql = new StringBuilder();

        sql.append("UPDATE CustomerRate SET ");
        sql.append("Seen = 1 ");
        sql.append("WHERE rateID = ?");

        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, item.getRateID());

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
	public ArrayList<ProductObject> search(String key) {
		ArrayList<ProductObject> results = new ArrayList<>();
        ProductObject item = null;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM Products ");
        sql.append("WHERE Description LIKE ? ");

        //Biên dịch câu lệnh ORDER BY price DESC
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setString(1, "%" + key + "%");
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new ProductObject();
                    item.setProductID(rs.getInt("ProductID"));
                    item.setProductName(rs.getString("ProductName"));
                    item.setProductImage(rs.getString("ProductImage"));
                    item.setSupplierID(rs.getInt("SupplierID"));
                    item.setCategoryID(rs.getInt("CategoryID"));
                    item.setQuantityPerUnit(rs.getString("QuantityPerUnit"));
                    item.setUnitPrice(rs.getDouble("UnitPrice"));
                    item.setUnitsInStock(rs.getInt("UnitsInStock"));
                    item.setUnitsInStock(rs.getInt("UnitsOnOrder"));
                    item.setReorderLevel(rs.getInt("ReorderLevel"));
                    item.setDiscontinued(rs.getBoolean("Discontinued"));
                    item.setDescription(rs.getString("Description"));
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

    public static void main(String[] args) {
        ProductFunction uf = new ProductFunctionImp(null);

//        ArrayList<ProductObject> list = uf.getTopProductByCategoryId(7, 4);
//        
//        int kq = uf.totalProduct();
//        System.out.println(kq);
//
//        list.forEach(u -> {
//            System.out.println(u);
//        });
//         ArrayList<ProductObject> list_product = uf.getAllProduct();
//         list_product.forEach(u -> {
//            System.out.println(u);
//        });
//        ProductObject sp = uf.getProduct(1);
//        System.out.println(sp);
//        ProductObject Product = new ProductObject();
//        Product.setProductName("aa");
////        Product.setProductImage(filePath);
////        Product.setProductImage(productImage);
//        Product.setSupplierID(5);
//        Product.setCategoryID(8);
////        Product.setQuantityPerUnit(khoiLuong);
////        Product.setUnitPrice(Double.parseDouble(giaTien));
////        Product.setUnitsInStock(Integer.parseInt(soLuong));
////        Product.setDescription(moTa);
//        Product.setDiscontinued(true);
//        boolean isAdded = uf.addProduct(Product);
//        if (isAdded) {
//            System.out.println("Thành công");
//        } else {
//            System.out.println("Lỗi");
//        }


//        ArrayList<Integer> sl = uf.getTotalUnitInStockByCategory();
//        ArrayList<Integer> sl1 = uf.getTotalUnitsOnOrderByCategory();
//        System.out.println(sl);
//        System.out.println(sl1);
        
        
//        ArrayList<CustomerRate> ds = uf.getRate(0);
//        ds.forEach(u -> {
//          System.out.println(u);
//      });
        
//        CustomerRate item = new CustomerRate();
//        item.setRateID(84);
//        boolean check = uf.checkrate(item);
//        if (check) {
//        	 System.out.println("ok");
//		} else {
//			 System.out.println("no");
//		}
        
        ArrayList<ProductObject> ds = uf.search("Shan Tuyết");
        ds.forEach(u -> {
          System.out.println(u);
      });
        
        
        
    }

}
