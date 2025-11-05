package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectProvider {

	private static final String URL = "jdbc:postgresql://localhost:5432/shopapp";
	private static final String login = "postgres";
	private static final String password = "admin";
	static {
		try {
			Class.forName("org.postgresql.Driver");
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("PostgreSQL drivers not found !!!");
		}
	}
	public ConnectProvider() {
		// TODO Auto-generated constructor stub
	}
	public static Connection getConnect() throws SQLException {
		return DriverManager.getConnection(URL,login,password);
	}
	
}
