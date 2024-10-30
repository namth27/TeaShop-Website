/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package categories;

import com.sun.jdi.connect.spi.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import object.CategoriesObject;
import util.ConnectionPool;
import util.ConnectionPoolImpl;

/**
 *
 * @author admin
 */
public class CategoryFunctionImp implements CategoryFunction {

    private java.sql.Connection con;

    private ConnectionPool cp;

    public CategoryFunctionImp(ConnectionPool cp) {
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
    public boolean addCategory(CategoriesObject item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean editUser(CategoriesObject item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delUser(CategoriesObject item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public CategoriesObject getCategory(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<CategoriesObject> getTop4Categories(int id) {
        ArrayList<CategoriesObject> results = new ArrayList<>();
        CategoriesObject item = null;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM categories ");
        sql.append("WHERE CategoryID > ? ");
        sql.append("LIMIT 4");

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, id);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new CategoriesObject();
                    item.setCategoryID(rs.getInt("CategoryID"));
                    item.setCategoryName(rs.getString("CategoryName"));
                    item.setDescription(rs.getString("Description"));
                    item.setPicture(rs.getString("Picture"));

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
    public ArrayList<CategoriesObject> getAllCategories() {
        ArrayList<CategoriesObject> results = new ArrayList<>();
        CategoriesObject item = null;

        String sql = "SELECT * FROM categories";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            //Lấy ra tập bản ghi 
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new CategoriesObject();
                    item.setCategoryID(rs.getInt("CategoryID"));
                    item.setCategoryName(rs.getString("CategoryName"));
                    item.setDescription(rs.getString("Description"));
                    item.setPicture(rs.getString("Picture"));
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

    @Override
    public String getCategoryName(int CategoryId) {
        String name = null;

        String sql = "SELECT CategoryName FROM Categories WHERE CategoryID = ?";

        //Biên dịch câu lệnh
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, CategoryId);

            ResultSet rs = pre.executeQuery();
            if (rs != null && rs.next()) {
                // Lấy giá trị từ cột đầu tiên của kết quả
                name = rs.getString(1);
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

        return name;
    }

    @Override
    public ArrayList<String> getAllNameCategories() {
        ArrayList<String> categoryNames = new ArrayList<>();

        String sql = "SELECT CategoryName FROM Categories";

        try {
            PreparedStatement pre = this.con.prepareStatement(sql);

            ResultSet rs = pre.executeQuery();
            while (rs != null && rs.next()) {
                // Lấy giá trị từ cột đầu tiên của kết quả
                String name = rs.getString(1);
                categoryNames.add(name);
            }

            // Đóng ResultSet và PreparedStatement
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();

            // Nếu câu lệnh sql có lỗi thì trở lại trạng thái an toàn của kết nối
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return categoryNames;
    }

    @Override
    public String convertListToJSONString(ArrayList<String> list) {
        StringBuilder sb = new StringBuilder("[");

        for (int i = 0; i < list.size(); i++) {
            sb.append("\"").append(list.get(i)).append("\"");
            if (i < list.size() - 1) {
                sb.append(", ");
            }
        }

        sb.append("]");
        return sb.toString();
    }
    
    public static void main(String[] args) {
        CategoryFunction uf = new CategoryFunctionImp(null);

//        ArrayList<CategoriesObject> list = uf.getTop4Categories(0);
//
//        list.forEach(u -> {
//            System.out.println(u);
//        });
        ArrayList<String> categories = uf.getAllNameCategories();
        
        String jsonCategories = uf.convertListToJSONString(categories);

//        for (String category : categories) {
//            System.out.println(category);
//        }
        System.out.println(jsonCategories);
    }

}
