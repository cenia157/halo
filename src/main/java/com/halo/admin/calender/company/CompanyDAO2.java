package com.halo.admin.calender.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.halo.main.DBManagerhalo;

public class CompanyDAO2 {
	private static Connection con = null;

	public static void getAllCompanySchedule(HttpServletRequest request, HttpServletResponse response) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 문자인코딩형식
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");

			// 데이터베이스 연동
			String sql = "select * from company_schedule";
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
<<<<<<< HEAD
			rs = pstmt.executeQuery();

			// 일정 배열 생성
			ArrayList<String> companySchedule = new ArrayList<String>();

			// 일정 객체 생성
			CompanyScheduleDTO schedule = null;

			// 객체에 데이터 추가
			while (rs.next()) {
				String yearmonth = rs.getString("cs_yearmonth");
				String title = rs.getString("cs_title");
				String txt = rs.getString("cs_txt");
				String date = rs.getString("cs_date");
				String update = rs.getString("cs_update");

				schedule = new CompanyScheduleDTO(yearmonth, title, txt, date, update);
				companySchedule.add(schedule.toJson());

				System.out.println("회사 달력 조회 성공");
			}

			response.getWriter().print(companySchedule);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Company 달력 조회 실패");
		} finally {
			DBManagerhalo.close(con, pstmt, rs);
		}

	}

	public static void insertCompanySchedule(HttpServletRequest request) {
		PreparedStatement pstmt = null;

		try {
			// 문자인코딩형식
			request.setCharacterEncoding("UTF-8");

			// 날짜 객체생성
			LocalDateTime now = LocalDateTime.now();

			// 데이터베이스 연동
			String sql = "insert into company_schedule values(company_schedule_seq.nextval, ?, ?, ?, ?, ?)";
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);

			// 날짜 파라미터 요청
			String inputDates = request.getParameter("input-date");

			// 날짜 파라미터 연월 / 일 로 분할
			int selectYearMonthPlace = inputDates.indexOf("月") + 1;
			String selectYearMonth = inputDates.substring(0, selectYearMonthPlace);
			String selectDates = inputDates.substring(selectYearMonthPlace + 1, inputDates.length());

//			System.out.println(selectDates);
//			System.out.println(selectYearMonth);

			pstmt.setString(1, selectYearMonth);
			pstmt.setString(2, request.getParameter("input-title"));
=======
			
			pstmt.setString(1, request.getParameter("input-title"));
			pstmt.setString(2, request.getParameter("input-date"));
>>>>>>> 0b8323d233270248db478ea3261be34d74339c7a
			pstmt.setString(3, request.getParameter("input-txt"));
			pstmt.setString(4, selectDates);
			pstmt.setString(5, now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

			if (pstmt.executeUpdate() == 1) {
				System.out.println("일정추가 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("일정추가 실패");
		} finally {
			DBManagerhalo.close(con, pstmt, null);
		}

	}

	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}

}
