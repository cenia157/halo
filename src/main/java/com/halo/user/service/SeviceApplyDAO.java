package com.halo.user.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
		String selectedEnd = request.getParameter("selectedEnd");

		System.out.println(selectedStart);
		System.out.println(selectedEnd);
		
		request.setAttribute("selectedStart",selectedStart);
		request.setAttribute("selectedEnd",selectedEnd);
	}


	public static void timeSelect(HttpServletRequest request) {

		String selectedTime = request.getParameter("selectedTime");

		System.out.println(selectedTime);

		request.setAttribute("selectedTime", selectedTime);
	}

	public static void nursingApply(HttpServletRequest request) throws IOException {

		String applicant = request.getParameter("applicant");
		String phoneNum = request.getParameter("phoneNum");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		String addr = request.getParameter("addr");
		String niText = request.getParameter("niText");
		
		String userYear = request.getParameter("userYear");
		String userMonth = request.getParameter("userMonth");
		String userDay = request.getParameter("userDay");
		
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
		System.out.println(userYear);
		System.out.println(userMonth);
		System.out.println(userDay);
		
		request.setAttribute("applicant", applicant);
		request.setAttribute("phoneNum", phoneNum);
		request.setAttribute("userName", userName);
		request.setAttribute("addr", addr);
		request.setAttribute("niText", niText);
		


	}
	
	public static void userDate(HttpServletRequest request, HttpServletResponse response) {
		String userYear = request.getParameter("userYear");
		String userMonth = request.getParameter("userMonth");
		String userDay = request.getParameter("userDay");
		
		try {
		// JSON 객체 생성
		JSONObject jsonObject = new JSONObject();
	    jsonObject.put("userYear", userYear);
	    jsonObject.put("userMonth", userMonth);
	    jsonObject.put("userDay", userDay);
	    
	 // JSON 형태로 응답을 전송
	    response.setContentType("application/json; charset=utf-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    
	    PrintWriter out;
			out = response.getWriter();
	    out.print(jsonObject.toString());
	    out.flush();
	    out.close(); 
	    
//		request.setAttribute("userYear", userYear);
//		request.setAttribute("userMonth", userMonth);
//		request.setAttribute("userDay", userDay);
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
			String sql = "INSERT INTO reservation_information (sa_seq, ci_seq, sa_year, sa_month, sa_days, sa_time, sa_addr, sa_start_place, sa_end_place, sa_reservation_check, sa_car_no, sa_nurssing_info, sa_texi_info, ti_service_completion_status, ti_feedback, ti_registration_date) VALUES (?,?,?, ?,?,?,?,?,?,?,?,?,?,?,?,?)";
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);

			String applicant = request.getParameter("applicant");
			String phoneNum = request.getParameter("phoneNum");
			String userName = request.getParameter("userName");
			String userGender = request.getParameter("userGender");
			String addr = request.getParameter("addr");
			String niText = request.getParameter("niText");
			String startAddr = request.getParameter("startAddr");
			String endAddr = request.getParameter("endAddr");
			String tiText = request.getParameter("tiText");

			String selectedStart = request.getParameter("selectedStart");
			String selectedEnd = request.getParameter("selectedEnd");


			// 문자열을 LocalDate로 변환
			LocalDate startDate = LocalDate.parse(selectedStart);
			LocalDate endDate = LocalDate.parse(selectedEnd);


			// 각 날짜에서 연, 월, 일 추출
			int startYear = startDate.getYear();
			int startMonth = startDate.getMonthValue();
//	        int startDay = startDate.getDayOfMonth();
	//
			int endYear = endDate.getYear();
			int endMonth = endDate.getMonthValue();
//	        int endDay = endDate.getDayOfMonth();		
	//
//	        LocalDate startDate = LocalDate.of(startYear, startMonth, startDay);
//	        LocalDate endDate = LocalDate.of(endYear, endMonth, endDay);
			String startDayDate = "";
			String endDayDate = "";
			String startMonthDate = "";
			String endMonthDate = "";
			String startYearDate = "";
			String endYearDate = "";
//	        String startMonth = null;
//	        String endMonth = null;
//	        String startYear = null;
//	        String endYear = null;
			for (LocalDate period = startDate; !period.isAfter(endDate); period = period.plusDays(1)) {
				int periodYear = period.getYear();
				int periodMonth = period.getMonthValue();
				int periodDay = period.getDayOfMonth();
				System.out.println(periodDay); // 날짜 출력 예시
				if (startMonth == periodMonth) {
					startDayDate += periodDay;
					if(startMonthDate.equals("")) {
						startMonthDate += periodMonth;
						startYearDate += periodYear;
					}
				}
				if (endMonth == periodMonth) {
					endDayDate += periodDay;
					if(endMonthDate.equals("")) {
						endMonthDate += periodMonth;
						endYearDate += periodYear;
						}
				}
				
				if(startMonth == endMonth) {
				if (!period.equals(endDate)) {
				startDayDate += ",";
				}else {
					break;
				}
				} else {
					
					if (startMonth == period.plusDays(1).getMonthValue()) {
					startDayDate += ",";
					
					} 
					if (!period.equals(endDate)) {
					if (endMonth == periodMonth) {
						endDayDate += ",";
					}
					} else {
					break;
					}
				}

			}
			
			System.out.println(startDayDate);
			System.out.println(endDayDate);
			System.out.println(startMonthDate);
			System.out.println(endMonthDate);
			System.out.println(startYearDate);
			System.out.println(endYearDate);

			// 세션 객체 가져오기
			HttpSession session = request.getSession();

			// 세션에서 데이터 불러오기
			String selectedService = (String) session.getAttribute("selectedService");
			String ci_Sql = "INSERT INTO customer_information VALUES (customer_information_seq.NEXTVAL, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?);";
			String sa_sql = "INSERT INTO reservation_information"
					+ " (sa_seq, ci_seq, sa_year, sa_month, sa_days, sa_time, sa_addr, sa_start_place, sa_end_place, sa_reservation_check, sa_car_no, sa_nurssing_info, sa_texi_info, ti_service_completion_status, ti_feedback, ti_registration_date) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			
			
			if (selectedService == "nursingTexi" ) {
				
			}
//			pstmt.setString(1, name);
//			pstmt.setString(2, id);
//			pstmt.setString(3, pw);
//			pstmt.setString(4, gender);
//			pstmt.setString(5, addr);
//			pstmt.setString(6, interest2);
//			pstmt.setString(7, txt);
//			pstmt.setString(8, img);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("신청성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("신청 실패");
		} finally {
			DBManagerhalo.close(con, pstmt, null);
		}

	}

	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}



}
