package user;

import java.util.ArrayList;
import object.CustomerObject;
import util.ConnectionPool;
import util.*;
import java.sql.*;

/**
 *
 * @author admin
 */
public class CustomerFunctionImpl implements CustomerFunction {

    private Connection con;

    private ConnectionPool cp;

    public CustomerFunctionImpl(ConnectionPool cp) {
        if (cp == null) {
            this.cp = new ConnectionPoolImpl();
//            cp = new ConnectionPoolImpl();
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
    public boolean addUser(CustomerObject item) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO Customers(");
        sql.append("CustomerFullname, CustomerAddress, Phone,");
        sql.append("CustomerUsername, CustomerPassword, CustomerEmail,");
        sql.append("CustomerPosition, CustomerLogined, CustomerCreatedDate, CustomerModifiedDate, CustomerNotes) ");
        sql.append("VALUES(?,?,?,?,md5(?),?,?,?,?,?,?)");

        // Biên dịch
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setString(1, item.getCustomerFullname());
            pre.setString(2, item.getCustomerAddress());
            pre.setString(3, item.getPhone());

            pre.setString(4, item.getCustomerUsername());
            pre.setString(5, item.getCustomerPassword());
            pre.setString(6, item.getCustomerEmail());

            pre.setInt(7, item.getCustomerPosition());
            pre.setString(8, item.getCustomerLogined());
            pre.setString(9, item.getCustomerCreatedDate());
            pre.setString(10, item.getCustomerModifiedDate());
            pre.setString(11, item.getCustomerNotes());

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
    public boolean editUser(CustomerObject item) {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE Customers SET ");
        sql.append("CustomerFullname = ?, CustomerAddress = ?, Phone = ?,");
        sql.append("CustomerUsername = ?, CustomerPassword = ?, CustomerEmail = ?,");
        sql.append("CustomerPosition = ?, CustomerLogined = ?, CustomerModifiedDate = ?, CustomerNotes= ?");
        sql.append("WHERE CustomerID = ?");

        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setString(1, item.getCustomerFullname());
            pre.setString(2, item.getCustomerAddress());
            pre.setString(3, item.getPhone());

            pre.setString(4, item.getCustomerUsername());
            pre.setString(5, item.getCustomerPassword());
            pre.setString(6, item.getCustomerEmail());

            pre.setInt(7, item.getCustomerPosition());
            pre.setString(8, item.getCustomerLogined());
            pre.setString(9, item.getCustomerModifiedDate());
            pre.setString(10, item.getCustomerNotes());

            pre.setInt(11, item.getCustomerID());

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
    public boolean delUser(CustomerObject item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public CustomerObject getUser(int id) {
    	String sql = "SELECT * FROM Customers WHERE (CustomerID = ?)";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, id);

            ResultSet rs = pre.executeQuery();

            CustomerObject item = null;
            if (rs != null) {
                if (rs.next()) {
                    item = new CustomerObject();
                    item.setCustomerID(rs.getInt("CustomerID"));
                    item.setCustomerUsername(rs.getString("CustomerUsername"));
                    item.setCustomerPassword(rs.getString("CustomerPassword"));
                    item.setCustomerEmail(rs.getString("CustomerEmail"));
                    item.setPhone(rs.getString("Phone"));
                    item.setCustomerFullname(rs.getString("CustomerFullname"));
                    item.setCustomerAddress(rs.getString("CustomerAddress"));
                    item.setCustomerPosition(rs.getInt("CustomerPosition"));
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
    public CustomerObject getUser(String email, String password) {
        String sql = "SELECT * FROM Customers WHERE (CustomerEmail = ?) AND (CustomerPassword = md5(?))";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, password);

            ResultSet rs = pre.executeQuery();

            CustomerObject item = null;
            if (rs != null) {
                if (rs.next()) {
                    item = new CustomerObject();
                    item.setCustomerID(rs.getInt("CustomerID"));
                    item.setCustomerUsername(rs.getString("CustomerUsername"));
                    item.setCustomerPassword(rs.getString("CustomerPassword"));
                    item.setCustomerEmail(rs.getString("CustomerEmail"));
                    item.setCustomerFullname(rs.getString("CustomerFullname"));
                    item.setCustomerAddress(rs.getString("CustomerAddress"));
                    item.setCustomerPosition(rs.getInt("CustomerPosition"));
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
    public int CustomerPosition(String email) {
        int results = 0;
        String sql = "SELECT CustomerPosition FROM Customers WHERE CustomerEmail = ? ";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setString(1, email);

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
    public CustomerObject getUser(String email) {
        String sql = "SELECT * FROM Customers WHERE (CustomerEmail = ?)";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setString(1, email);

            ResultSet rs = pre.executeQuery();

            CustomerObject item = null;
            if (rs != null) {
                if (rs.next()) {
                    item = new CustomerObject();
                    item.setCustomerID(rs.getInt("CustomerID"));
                    item.setCustomerUsername(rs.getString("CustomerUsername"));
                    item.setCustomerPassword(rs.getString("CustomerPassword"));
                    item.setCustomerEmail(rs.getString("CustomerEmail"));
                    item.setCustomerFullname(rs.getString("CustomerFullname"));
                    item.setCustomerAddress(rs.getString("CustomerAddress"));
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
    public ArrayList<CustomerObject> getAllUsers() {
        ArrayList<CustomerObject> results = new ArrayList<>();
        CustomerObject item = null;

        String sql = "SELECT * FROM Customers ";
        sql += "ORDER BY CustomerID ";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new CustomerObject();
                    // CustomerID, CustomerFullname, CustomerAddress, Phone, CustomerUsername, CustomerPassword, 
                    // CustomerEmail, CustomerPosition, CustomerLogined, CustomerCreatedDate, CustomerModifiedDate, CustomerNotes
                    item.setCustomerID(rs.getInt("CustomerID"));
                    item.setCustomerFullname(rs.getString("CustomerFullname"));
                    item.setCustomerAddress(rs.getString("CustomerAddress"));
                    item.setPhone(rs.getString("Phone"));
                    item.setCustomerUsername(rs.getString("CustomerUsername"));
                    item.setCustomerPassword(rs.getString("CustomerPassword"));
                    item.setCustomerEmail(rs.getString("CustomerEmail"));
                    item.setCustomerPosition(rs.getInt("CustomerPosition"));
                    item.setCustomerNotes(rs.getString("CustomerNotes"));

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

    public static void main(String[] args) {
        CustomerFunction uf = new CustomerFunctionImpl(null);

//        CustomerObject item = new CustomerObject("Nguyễn Thành Nam", "12345", "user@gmail.com");
//        boolean check = uf.addUser(item);
//        if (!check) {
//            System.out.println("THÊM KHÔNG THÀNH CÔNG");
//        } else {
//            System.out.println("THÀNH CÔNG");
//        }
//        CustomerObject item = uf.getUser("user1@gmail.com");
//        if (item == null) {
//            System.out.println("Thêm");
//        } else {
//            System.out.println("Trùng email");
//        }
//        CustomerObject item = uf.getUser("admin@gmail.com", "12345");
//        System.out.println(item);
//        int kq = uf.CustomerPosition("admin@gmail.com");
//        System.out.println(kq);
        ArrayList<CustomerObject> list = uf.getAllUsers();

        list.forEach(u -> {
            System.out.println(u);
        });
    }

}
