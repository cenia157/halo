package com.halo.user.qa.question;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//AOP ����
public class DBManager {

	//����
	 public static Connection connect() throws SQLException {

			String url ="jdbc:oracle:thin:@localhost:1521:xe";
			String id = "c##lyj";
			String pw = "lyj";
			return DriverManager.getConnection(url,id,pw);
		 
	}

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		// TODO Auto-generated method stub
		
		try {
			if( rs != null) {
			rs.close();
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}