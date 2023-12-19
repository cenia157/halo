package com.halo.admin.calender.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import com.halo.main.DBManagerhalo;

public class CompanyDAO {
	private static Connection con = null;

	public static void insertCalender(HttpServletRequest request) {
		PreparedStatement pstmt = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			con = DBManagerhalo.connect();
			String sql = "insert into company_schedule values(company_schedule_seq.nextval, ?, ?, ?, ?)";
		
			LocalDateTime now = LocalDateTime.now();
			
			String selectDate = request.getParameter("input-date");
			int monthPlace = selectDate.indexOf("月") + 1;
			System.out.println(selectDate.substring(monthPlace, selectDate.length()));
			
			
					
					
					
//			pstmt = con.prepareStatement(sql);
//
//			pstmt.setString(1, request.getParameter("input-title"));
//			pstmt.setString(2, request.getParameter("input-date"));
//			pstmt.setString(3, request.getParameter("input-txt"));
//			pstmt.setString(4, now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
//			
//			if (pstmt.executeUpdate() == 1) {
//				System.out.println("일정추가 성공");
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
//			System.out.println("일정추가 실패");
		} finally {
			DBManagerhalo.close(con, null, null);
		}
		
		

	}

}
