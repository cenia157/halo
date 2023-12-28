package com.halo.user.service;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.halo.main.DBManagerhalo;

public class SeviceApplyDAO {
private static Connection con = null;

	public static void svcSelect(HttpServletRequest request) {
		String selectedService = request.getParameter("service");
		
		HttpSession session = request.getSession();
		session.setAttribute("selectedService", selectedService);
		
		System.out.println(selectedService);
	}


	public static void calSelect(HttpServletRequest request) {
		String selectedStart = request.getParameter("selectedStart");
		String selectedEnd  = request.getParameter("selectedEnd");
		
		System.out.println(selectedStart);
		System.out.println(selectedEnd);
		
		request.setAttribute("selectedStart", selectedStart);
		request.setAttribute("selectedEnd", selectedEnd);
		
	}


	public static void timeSelect(HttpServletRequest request) {

		String selectedTime = request.getParameter("selectedTime");
		
		
		System.out.println(selectedTime);
		
		request.setAttribute("selectedTime", selectedTime);
	}


	public static void nursingApply(HttpServletRequest request) {

		String applicant = request.getParameter("applicant");
		String phoneNum = request.getParameter("phoneNum");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		String addr = request.getParameter("addr");
		String niText = request.getParameter("niText");
		
		if (userGender.equals("m")) {
			request.setAttribute("manChecked", "checked");
		} else if (userGender.equals("w")) {
			request.setAttribute("womanChecked", "checked");
		} 		
		
		System.out.println(applicant);
		System.out.println(phoneNum);
		System.out.println(userName);
		System.out.println(userGender);
		System.out.println(addr);
		System.out.println(niText);
		
		request.setAttribute("applicant", applicant);
		request.setAttribute("phoneNum", phoneNum);
		request.setAttribute("userName", userName);
		request.setAttribute("addr", addr);
		request.setAttribute("niText", niText);
		
		
		
	}


	public static void texiApply(HttpServletRequest request) {
		String applicant = request.getParameter("applicant");
		String phoneNum = request.getParameter("phoneNum");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		String startAddr = request.getParameter("startAddr");
		String endAddr = request.getParameter("endAddr");
		String tiText = request.getParameter("tiText");
		
		
		System.out.println(applicant);
		System.out.println(phoneNum);
		System.out.println(userName);
		System.out.println(userGender);
		System.out.println(startAddr);
		System.out.println(endAddr);
		System.out.println(tiText);
		
		request.setAttribute("applicant", applicant);
		request.setAttribute("phoneNum", phoneNum);
		request.setAttribute("userName", userName);
		request.setAttribute("startAddr", startAddr);
		request.setAttribute("endAddr", endAddr);
		request.setAttribute("tiText", tiText);
		
	}
	
	public static void nursingTexi(HttpServletRequest request) {
		String applicant = request.getParameter("applicant");
		String phoneNum = request.getParameter("phoneNum");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		String addr = request.getParameter("addr");
		String niText = request.getParameter("niText");
		String startAddr = request.getParameter("startAddr");
		String endAddr = request.getParameter("endAddr");
		String tiText = request.getParameter("tiText");
		
		
		System.out.println(applicant);
		System.out.println(phoneNum);
		System.out.println(userName);
		System.out.println(userGender);
		System.out.println(addr);
		System.out.println(startAddr);
		System.out.println(endAddr);
		System.out.println(niText);
		System.out.println(tiText);
		
		request.setAttribute("applicant", applicant);
		request.setAttribute("phoneNum", phoneNum);
		request.setAttribute("userName", userName);
		request.setAttribute("userGender", userGender);
		request.setAttribute("addr", addr);
		request.setAttribute("niText", niText);
		request.setAttribute("startAddr", startAddr);
		request.setAttribute("endAddr", endAddr);
		request.setAttribute("tiText", tiText);
		
	}


	public static void applyNursingTexi(HttpServletRequest request) {
		PreparedStatement pstmt = null;
		try {
			
		// 문자인코딩형식
		request.setCharacterEncoding("UTF-8");
		String sql = "insert into company_schedule values(company_schedule_seq.nextval, ?, ?, ?, ?, ?)";
		con = DBManagerhalo.connect();
		pstmt = con.prepareStatement(sql);
		
		
		
		
		

			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, gender);
			pstmt.setString(5, addr);
			pstmt.setString(6, interest2);
			pstmt.setString(7, txt);
			pstmt.setString(8, img);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("등록성공");
				return "등록성공";
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
