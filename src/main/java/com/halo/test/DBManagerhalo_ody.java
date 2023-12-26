package com.halo.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class DBManagerhalo_ody {

	private static BasicDataSource dataSource;

	static {
		dataSource = new BasicDataSource();
		dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
//        dataSource.setUrl("jdbc:oracle:thin:@anxucl0a8nyvimp0_high?TNS_ADMIN=C:\\\\Wallet_ANXUCL0A8NYVIMP0");
//		dataSource.setUrl("jdbc:oracle:thin:@anxucl0a8nyvimp0_high?TNS_ADMIN=/Users/admin/mg/Wallet_ANXUCL0A8NYVIMP0");
		dataSource.setUrl("jdbc:oracle:thin:@anxucl0a8nyvimp0_high?TNS_ADMIN=C:/Wallet_ANXUCL0A8NYVIMP0");
		dataSource.setUsername("ADMIN");
		dataSource.setPassword("Soldesk802!!");
//        dataSource.setInitialSize(5); // 초기 연결 수
//        dataSource.setMaxTotal(10);  // 최대 연결 수
	}

	public static Connection connect() throws SQLException {
		return dataSource.getConnection();
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