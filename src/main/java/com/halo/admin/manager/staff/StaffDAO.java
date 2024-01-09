package com.halo.admin.manager.staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.main.DBManagerhalo;

public class StaffDAO {
	private static Connection con = null;

	public static void getAllStaffList(HttpServletRequest request, HttpServletResponse response) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 문자인코딩형식
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");

			// 데이터베이스 연동
			String sql = "select * from staff_info";
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 직원 배열 생성
			ArrayList<String> staffInfo = new ArrayList<String>();

			// 직원 객체 생성
			StaffDTO staff = null;
			// 객체에 데이터 추가
			while (rs.next()) {
			    int no = rs.getInt("s_no");
			    String pos = rs.getString("s_position");
			    String name = rs.getString("s_name");
			    String phoneNum = rs.getString("s_phone_num");
			    String entryDate = rs.getString("s_entry_date");
			    String color = rs.getString("s_color");
			    String addr = rs.getString("s_addr");

			    System.out.println("123" + no);
			    System.out.println(name);
			    System.out.println(phoneNum);
			    System.out.println(entryDate);
			    System.out.println(color);
			    System.out.println(addr);

			    staff = new StaffDTO(no, pos, name, phoneNum, entryDate, color, addr);
			    staffInfo.add(staff.toJson());
			}

			System.out.println("직원 정보 조회 성공");
			response.getWriter().print(staffInfo);


		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("직원 정보 조회 실패");
		} finally {
			DBManagerhalo.close(con, pstmt, rs);
		}
	}

	public static void staffReg(HttpServletRequest request) {
		PreparedStatement pstmt = null;
		try {
			// 문자인코딩형식
			request.setCharacterEncoding("UTF-8");

			String sql = "insert into staff_info values(staff_num_seq.nextval, ?, ?, ?, ?, ?, ?)";
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, request.getParameter("input-staff-name"));
			pstmt.setString(2, request.getParameter("input-staff-pos"));
			pstmt.setString(3, request.getParameter("input-staff-callNum"));
			pstmt.setString(4, request.getParameter("input-staff-entryDate"));
			pstmt.setString(5, request.getParameter("input-staff-color"));
			pstmt.setString(6, request.getParameter("input-steff-addr"));

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
