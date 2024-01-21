package com.halo.admin.calender.reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReservationDelete")
public class ReservationDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReservationDAO.passToReservationScheduleDecline(request, response);
		ReservationDAO.deleteReservationSchedule(request, response);
		response.sendRedirect("ReservationC");
	}

}
