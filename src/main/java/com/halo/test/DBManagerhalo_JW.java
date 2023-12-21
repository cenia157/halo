package com.halo.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManagerhalo_JW {

	public static Connection connect() throws SQLException, ClassNotFoundException {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@anxucl0a8nyvimp0_high?TNS_ADMIN=C:/Wallet_ANXUCL0A8NYVIMP0";
		return DriverManager.getConnection(url, "ADMIN", "Soldesk802!!");
	}

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		
		try {
			if (rs != null) {
				rs.close();
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
}
