package com.halo.admin.calender.company;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertCompanyC")
public class InsertCompanyC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CompanyDAO.insertCompanySchedule(request);

		request.setAttribute("menu", "/admin/calender/company/companyContent.jsp");
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
	}

}
