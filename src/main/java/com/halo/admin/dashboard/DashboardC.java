package com.halo.admin.dashboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DashboardC")
public class DashboardC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if (request.getSession().getAttribute("login_session") == null) {
//		response.sendRedirect("LoginPageC");
//	} else {
	request.setAttribute("menu", "/admin/dashboard/dashboard.jsp");
	request.getRequestDispatcher("admin/index.jsp").forward(request, response);
//}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
