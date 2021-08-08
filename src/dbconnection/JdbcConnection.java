package dbconnection;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnection {
	public Connection getConnection() throws SQLException {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_cell_db", "root", "#rushikesh11");
		}

		catch (Exception e) {
			e.printStackTrace();
		} 
		return con;
	}
}
