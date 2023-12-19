package com.halo.admin.calender.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// DB관련 작업을 할 때 연결코드를 쓴 이후 작업 해옴
// 다 쓰면 닫음

// 그걸 AOP로 하자
public class DBManagermg {

	public static Connection connect() throws SQLException, ClassNotFoundException {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@anxucl0a8nyvimp0_high?TNS_ADMIN=/Users/admin/mg/Wallet_ANXUCL0A8NYVIMP0";
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
