package com.halo.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SeviceApplyDAO {

	public static void svcSelect(HttpServletRequest request) {
		String selectedService = request.getParameter("service");
		
		HttpSession session = request.getSession();
		session.setAttribute("selectedService", selectedService);
		
		System.out.println(selectedService);
	}


	public static void calSelect(HttpServletRequest request) {
		String selectedStart = request.getParameter("start-date-sel");
		String selectedEnd  = request.getParameter("end-date-sel");
		
		System.out.println(selectedStart);
		System.out.println(selectedEnd);
		
		request.setAttribute("selectedStartDate", selectedStart);
		request.setAttribute("selectedEndDate", selectedEnd);
		
	}


	public static void timeSelect(HttpServletRequest request) {
		String selectedStart = request.getParameter("selectedStart");
		String selectedEnd  = request.getParameter("selectedEnd");
		String selectedTime = request.getParameter("selectedTime");
		
		
		System.out.println(selectedStart);
		System.out.println(selectedEnd);
		System.out.println(selectedTime);
		
		request.setAttribute("selectedStartDate", selectedStart);
		request.setAttribute("selectedEndDate", selectedEnd);
		request.setAttribute("selectedTime", selectedTime);
	}

}
