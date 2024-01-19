package com.halo.admin.calender.reservation;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;


@WebServlet("/ReservationAgree")
public class ReservationAgree extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getParameter("array"));
		
		// Jackson ObjectMapper를 사용하여 JSON 문자열을 Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> dataMap = objectMapper.readValue(request.getParameter("array"), Map.class);
		
		System.out.println(dataMap);
//		ReservationDAO.reservationAgree(request, response);
//		ReservationDAO.deleteReservationSchedule(request, response);
		
//		response.sendRedirect("ReservationC");
	}

}