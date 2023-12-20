package com.halo.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager_ody {

	public static Connection connect() throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		return DriverManager.getConnection(url, "dy1004", "dy1004");
	
	} 

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		
		try {
			con.close();
			
			if (rs != null) {
			rs.close();
			}

			pstmt.close();
		} catch (Exception e) {
			System.out.println("close() �޼ҵ� ���� ");
			e.printStackTrace();
		}
		
	}

}
