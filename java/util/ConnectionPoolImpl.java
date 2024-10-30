package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Stack;

public class ConnectionPoolImpl implements ConnectionPool {

	private String driver;
	private String username;
	private String password;
	private String url;
	private Stack<Connection> pool;

	public ConnectionPoolImpl() {
		// Xác định trình điều khiển
		this.driver = "com.mysql.cj.jdbc.Driver";

		// Nạp trình điều khiển
		try {
			Class.forName(this.driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		// Xác định tài khoản làm việc
		this.username = "namnt";
		this.password = "@Nam28030303";
		// Xác định đường dẫn thực thi
		this.url = "jdbc:mysql://localhost:3306/project";

		// Cấp phát bộ nhớ cho pool
		this.pool = new Stack<>();
	}

	@Override
	public Connection getConnection(String objectName) throws SQLException {
		if(this.pool.isEmpty()) {
			System.out.println(objectName + "đã khởi tạo kết nối mới.");
			
			return DriverManager.getConnection(this.url, this.username, this.password);
		} else {
			System.out.println(objectName + "đã lấy ra một kết nối.");
			return this.pool.pop();

		}
	}

	@Override
	public void releaseConnection(Connection con, String objectName) throws SQLException {
		System.out.println(objectName + "đã trả lại kết nối.");
		this.pool.push(con);

	}

}
