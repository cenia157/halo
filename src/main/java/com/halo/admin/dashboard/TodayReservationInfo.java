package com.halo.admin.dashboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.admin.calender.reservation.ReservationDAO;

@WebServlet("/TodayReservationInfo")
public class TodayReservationInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DashboardDAO.getReservationAcceptSchedule(request,response);
		System.out.println("sadsadasdasdsadsadasdas");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
