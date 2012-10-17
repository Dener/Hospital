package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnManager {

	private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

	public static Connection connection() throws SQLException {
		try {
			XMLDBManager manager = new XMLDBManager();

			String server = manager.server;
			String databaseName = manager.databaseName;
			String user = manager.user;
			String password = manager.password;

			Class.forName(driver);
			return DriverManager.getConnection("jdbc:sqlserver://" + server
					+ ";" + "databaseName=" + databaseName + ";", user,
					password);
		} catch (ClassNotFoundException e) {
			throw new SQLException(e.getMessage());
		}
	}
}
