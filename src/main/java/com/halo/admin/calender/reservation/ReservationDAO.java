package com.halo.admin.calender.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.main.DBManagerhalo;
import com.halo.main.DBManagerhalo2;

public class ReservationDAO {
	private static Connection con = null;

	public static void getAllReservationSchedule(HttpServletRequest request, HttpServletResponse response) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 문자인코딩형식
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");

			// 데이터베이스 연동
			String sql = "select * from reservation_information";
			con = DBManagerhalo2.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 일정 배열 생성
			ArrayList<String> reservationSchedule = new ArrayList<String>();

			// 일정 객체 생성
			ReservationScheduleDTO schedule = null;

			// 객체에 데이터 추가
			while (rs.next()) {
				String no = rs.getString("sa_seq");
				String applicant = rs.getString("sa_applicant");
				String phoneNumber = rs.getString("sa_phone_number");
				String userName = rs.getString("sa_user_name");
				String gender = rs.getString("sa_gender");
				String birthDates = rs.getString("sa_birth_date");
				String year = rs.getString("sa_year");
				String month = rs.getString("sa_month");
				String dates = rs.getString("sa_days");
				String time = rs.getString("sa_time");
				String addr = rs.getString("sa_addr");
				String startPoint = rs.getString("sa_start_place");
				String endPoint = rs.getString("sa_end_place");
				String nurssingInfo = rs.getString("sa_nurssing_info");
				String texiInfo = rs.getString("sa_texi_info");
				String registrationDate = rs.getString("sa_registration_date");
				String service = rs.getString("sa_service");

				schedule = new ReservationScheduleDTO(no, applicant, phoneNumber, userName, gender, birthDates, year, month, dates, time, addr, startPoint, endPoint, nurssingInfo, texiInfo, registrationDate, service);
				reservationSchedule.add(schedule.toJson());
			}

			System.out.println("예약 달력 조회 성공");
			response.getWriter().print(reservationSchedule);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예약 달력 조회 실패");
		} finally {
			DBManagerhalo.close(con, pstmt, rs);
		}
	}

	public static void getReservationStaffList(HttpServletRequest request, HttpServletResponse response) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 문자인코딩형식
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");

			// 데이터베이스 연동
			String sql = "select * from staff_info";
			con = DBManagerhalo2.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 일정 배열 생성
			ArrayList<String> staffList = new ArrayList<String>();

			// 일정 객체 생성
			StaffDTO staff = null;

			// 객체에 데이터 추가
			while (rs.next()) {
				String name = rs.getString("s_name");

				staff = new StaffDTO(name);
				staffList.add(staff.toJson());
			}

			System.out.println("스태프 조회 성공");
			response.getWriter().print(staffList);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("스태프 조회 실패");
		} finally {
			DBManagerhalo.close(con, pstmt, rs);
		}
	}

}
