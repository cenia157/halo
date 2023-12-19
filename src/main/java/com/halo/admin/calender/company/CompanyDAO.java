package com.halo.admin.calender.company;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

public class CompanyDAO {

	public static void insertCalender(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into company_schedule values(company_schedule_seq.nextval, ?, ?, ?)";
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			con = DBManagermg.connect();
			pstmt = con.prepareStatement(sql);
			
			
		
			pstmt.setString(1, request.getParameter("input-title"));
			pstmt.setString(2, request.getParameter("input-date"));
			pstmt.setString(3, request.getParameter("input-txt"));
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("일정추가 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("일정추가 실패");
		} finally {
			DBManagermg.close(con, pstmt, null);
		}
		
		

	}

}
