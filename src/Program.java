import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import config.ConnManager;

public class Program {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		new config.DBConfig();

		try {
			
			
			Statement stmt;
			stmt = ConnManager.connection().createStatement();

			String sql;

			sql = "SELECT * FROM Medico";

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				// Retrieve by column name
				String nomeDoFilhoDaPuta = rs.getString("nome");
				// Display values
				System.out.print("O filho da puta eh: " + nomeDoFilhoDaPuta);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
