package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

import object.CartItemsObject;
import object.OrdersObject;
import object.ProductObject;
import util.ConnectionPool;
import util.ConnectionPoolImpl;

public class OrderFunctionImpl implements OrderFunction {
	private Connection con;
	
	private ConnectionPool cp;
	
	public OrderFunctionImpl(ConnectionPool cp) {
		if(cp==null) {
			this.cp = new ConnectionPoolImpl();
		} else {
			this.cp = cp;
		}
		
		//Xin kết nối
		try {
			this.con = this.cp.getConnection("Order");
			
			//Kiem tra ket noi
			if(this.con.getAutoCommit()) {
				//Chấm dứt chế độ thực thi tự động của kết nối
				this.con.setAutoCommit(false);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	private boolean exe(PreparedStatement pre) {
		if(pre != null) {
//			pre da duoc bien dich va truyen day du gia tri cho tham so
			try {
				int result = pre.executeUpdate();
				if(result == 0) {
					this.con.rollback();
					return false;
				}
				
				// Xac nhan thuc thi sau cung
				this.con.commit();
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				try {
					this.con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} finally {
				pre = null;
			}
		}
		
		return false;
	}
	


	@Override
	public ConnectionPool getCP() {
		// TODO Auto-generated method stub
		return this.cp;
	}
	@Override
	public void releaseConnection() {
		// TODO Auto-generated method stub
		try {
			this.cp.releaseConnection(this.con, "User");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
    public ArrayList<Object[]> getAllOrders() {
        ArrayList<Object[]> results = new ArrayList<>();
        String sql = "SELECT " +
                "o.OrderID, " +
                "c.CustomerID, " +
                "c.CustomerFullname AS FullName, " +
                "c.CustomerAddress AS Address, " +
                "c.Phone, " +
                "c.CustomerEmail AS Email, " +
                "c.CustomerNotes AS CustomerNote, " +
                "od.ProductID, " +
                "p.ProductName, " +
                "od.UnitPrice, " +
                "od.Quantity, " +
                "(od.UnitPrice * od.Quantity) AS TotalAmount, " +
                "o.OrderDate " +
                "FROM Orders o " +
                "JOIN Customers c ON o.CustomerID = c.CustomerID " +
                "JOIN OrderDetails od ON o.OrderID = od.OrderID " +
                "JOIN Products p ON od.ProductID = p.ProductID";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    Object[] item = new Object[12];
                    item[0] = rs.getInt("OrderID");
                    item[1] = rs.getInt("CustomerID");
                    item[2] = rs.getString("FullName");
                    item[3] = rs.getString("Address");
                    item[4] = rs.getString("Phone");
                    item[5] = rs.getString("Email");
                    item[6] = rs.getString("CustomerNote");
                    item[7] = rs.getInt("ProductID");
                    item[8] = rs.getString("ProductName");
                    item[9] = rs.getDouble("UnitPrice");
                    item[10] = rs.getInt("Quantity");
                    item[11] = rs.getDouble("TotalAmount");
                    item[12] = rs.getString("OrderDate");
                    results.add(item);
                }
                rs.close();
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
    public double getUnitPrice(int ProductID) {
        double result = 0.0;
        String sql = "SELECT UnitPrice FROM Products WHERE ProductID = ?";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, ProductID);
            ResultSet rs = pre.executeQuery();

            if (rs != null && rs.next()) {
                result = rs.getDouble("UnitPrice");
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

        return result;
    }

    @Override
    public boolean delOrder(int orderId) {
        String sql = "DELETE FROM Orders WHERE OrderID = ?";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, orderId);

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
    public Map<Integer, Integer> getProductsSales() {
        Map<Integer, Integer> productSales = new HashMap<>();
        String sql = "SELECT p.ProductID, COALESCE(SUM(od.Quantity), 0) AS TotalQuantity " +
                "FROM Products p " +
                "LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID " +
                "GROUP BY p.ProductID";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("ProductID");
                int totalQuantity = rs.getInt("TotalQuantity");
                productSales.put(productId, totalQuantity);
            }
            rs.close();
            pre.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productSales;
    }

    @Override
    public ProductObject getProductByID(int ProductID) {
        String sql = "SELECT * FROM Products WHERE ProductID = ?";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, ProductID);
            ResultSet rs = pre.executeQuery();

            ProductObject item = null;
            if (rs != null && rs.next()) {
                item = new ProductObject();
                item.setProductID(rs.getInt("ProductID"));
                item.setProductName(rs.getString("ProductName"));
                item.setProductImage(rs.getString("ProductImage"));
                item.setSupplierID(rs.getInt("SupplierID"));
                item.setCategoryID(rs.getInt("CategoryID"));
                item.setQuantityPerUnit(rs.getString("QuantityPerUnit"));
                item.setUnitPrice(rs.getDouble("UnitPrice"));
                item.setUnitsInStock(rs.getInt("UnitsInStock"));
                item.setUnitsOnOrder(rs.getInt("UnitsOnOrder"));
                item.setReorderLevel(rs.getInt("ReorderLevel"));
                item.setDiscontinued(rs.getBoolean("Discontinued"));
                item.setDescription(rs.getString("Description"));
            }

            rs.close();
            pre.close();
            return item;

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public boolean addOrder(OrdersObject item) {
    									//CustomerID, OrderDate, RequiredDate, ShippedDate, Freight, ShipName, ShipAddress, Status
        String sql = "INSERT INTO Orders (CustomerID, OrderDate, RequiredDate, ShippedDate, Freight, ShipName, ShipAddress, Status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, item.getCustomerId());
            pre.setString(2, item.getOrderDate());
            pre.setString(3, item.getRequiredDate());
            pre.setString(4, item.getShippedDate());
            pre.setDouble(5, item.getFreight());
            pre.setString(6, item.getShipName());
            pre.setString(7, item.getShipAddress());
            pre.setString(8, item.getStatus());

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
    public boolean addOrderDetail(CartItemsObject item, int orderID) {
    							//    	OrderID, ProductID, UnitPrice, Quantity, Discount
    	 String sql = "INSERT INTO orderdetails (OrderID, ProductID, UnitPrice, Quantity, Discount) " +
                 "VALUES (?, ?, ?, ?, ?)";

         try {
             PreparedStatement pre = this.con.prepareStatement(sql);
             pre.setInt(1, orderID);
             pre.setInt(2, item.getProductID());
             pre.setDouble(3, item.getUnitPrice());
             pre.setInt(4, item.getQuantity());
             pre.setFloat(5, 0);

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
    public ArrayList<OrdersObject> getAllDonHang() {
        ArrayList<OrdersObject> results = new ArrayList<>();
        String sql = "SELECT * FROM Orders";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    OrdersObject item = new OrdersObject();
                    item.setOrderId(rs.getInt("OrderID"));
                    item.setCustomerId(rs.getInt("CustomerID"));
                    item.setOrderDate(rs.getString("OrderDate"));
                    item.setRequiredDate(rs.getString("RequiredDate"));
                    item.setShippedDate(rs.getString("ShippedDate"));
                    item.setShipVia(rs.getInt("ShipVia"));
                    item.setFreight(rs.getDouble("Freight"));
                    item.setShipName(rs.getString("ShipName"));
                    item.setShipAddress(rs.getString("ShipAddress"));
                    item.setStatus(rs.getString("Status"));

                    results.add(item);
                }
                rs.close();
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
    
    public ArrayList<Object[]> getOrderDetail(int orderId) {
		ArrayList<Object[]> results = new ArrayList<>();
	    double totalOrderAmount = 0;
	    
	    String sql = "SELECT od.OrderID, od.ProductID, p.ProductName, od.UnitPrice, od.Quantity, od.Discount, " +
	                 "(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalAmount " +
	                 "FROM OrderDetails od " +
	                 "JOIN Products p ON od.ProductID = p.ProductID " +
	                 "WHERE od.OrderID = ?";
	    
	    try (PreparedStatement pre = this.con.prepareStatement(sql)) {
	        pre.setInt(1, orderId);

	        try (ResultSet rs = pre.executeQuery()) {
	            while (rs.next()) {
	                Object[] orderDetail = new Object[7];
	                orderDetail[0] = rs.getInt("OrderID");
	                orderDetail[1] = rs.getInt("ProductID");
	                orderDetail[2] = rs.getString("ProductName");
	                orderDetail[3] = rs.getDouble("UnitPrice");
	                orderDetail[4] = rs.getInt("Quantity");
	                orderDetail[5] = rs.getDouble("Discount");
	                orderDetail[6] = rs.getDouble("TotalAmount");
	                
	                totalOrderAmount += rs.getDouble("TotalAmount");
	                
	                results.add(orderDetail);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            this.con.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    
	    // Add total order amount as the last entry
	    if (!results.isEmpty()) {
	        Object[] totalAmountEntry = new Object[7];
	        totalAmountEntry[0] = "Total";
	        totalAmountEntry[1] = "";
	        totalAmountEntry[2] = "";
	        totalAmountEntry[3] = "";
	        totalAmountEntry[4] = "";
	        totalAmountEntry[5] = "";
	        totalAmountEntry[6] = totalOrderAmount;
	        
	        results.add(totalAmountEntry);
	    }
	    
	    return results;
	}
	
	
	public static void main(String[] args) {
		OrderFunction uf = new OrderFunctionImpl(null);

//        ArrayList<OrdersObject> orders = uf.getAllDonHang();
//        orders.forEach(u -> {
//            System.out.println(u);
//        });
//
//        Map<Integer, Integer> productSales = uf.getProductsSales();
//
//        for (Map.Entry<Integer, Integer> entry : productSales.entrySet()) {
//            System.out.println("ProductID: " + entry.getKey() + ", Total Quantity Sold: " + entry.getValue());
//        }
//		OrdersObject [orderId=0, customerId=30, orderDate=2024-06-27, requiredDate=null, shippedDate=null, shipVia=0, freight=30.0, shipName=Nguyễn Thành Nam, shipAddress=Hà Nam Tỉnh thành: , status=Cancelled]
		
		//CustomerID, OrderDate, RequiredDate, ShippedDate, Freight, ShipName, ShipAddress, Status
		OrdersObject od = new OrdersObject();
		od.setCustomerId(30);
		od.setOrderDate("2024-06-27");
		od.setFreight(30);
		od.setShipName("A");
		od.setStatus("Cancelled");
		
		boolean addorder = uf.addOrder(od);
		
		if (addorder) {
			System.out.println("ok");
		} else {
			System.out.println(" nt ok");
		}
		
		CartItemsObject sp = new CartItemsObject(19, 28, "sp1", "Trà", 2300.0, 5);
		
		
		boolean addetail = uf.addOrderDetail(sp, 19);
		
//		
		if (addetail) {
			System.out.println("ok");
		} else {
			System.out.println("nt ok");
		}
        


    }
	@Override
    public int getLatestOrderIDByCustomerID(int customerID) {
        int latestOrderID = -1; // Giá trị mặc định khi không có đơn hàng
        
        String sql = "SELECT OrderID FROM Orders WHERE CustomerID = ? ORDER BY OrderDate DESC LIMIT 1";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, customerID);
            ResultSet rs = pre.executeQuery();

            if (rs != null && rs.next()) {
                latestOrderID = rs.getInt("OrderID");
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

        return latestOrderID;
    }
	

}
