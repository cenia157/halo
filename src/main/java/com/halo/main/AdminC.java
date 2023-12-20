package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminC")
public class AdminC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String menu = null;
		if (request.getParameter("link") != null) {
			if (request.getParameter("link").equals("1")) {
				menu = "/admin/homepageSetting/logo/logoContent";
			} else if (request.getParameter("link").equals("2")) {
				menu = "/admin/homepageSetting/mainpage/mainpageContent";
			} else if (request.getParameter("link").equals("3")) {
				menu = "/admin/homepageSetting/banner/bannerContent";
			} else if (request.getParameter("link").equals("4")) {
				menu = "/admin/homepageSetting/information/informationContent";
			} else if (request.getParameter("link").equals("5")) {
				menu = "/admin/boardmanagement/notice/noticeContent";
			} else if (request.getParameter("link").equals("6")) {
				menu = "/admin/boardmanagement/ask/askContent";
			} else if (request.getParameter("link").equals("7")) {
				menu = "/admin/boardmanagement/frequenthyask/frequenthyaskContent";
			} else if (request.getParameter("link").equals("8")) {
				menu = "/admin/calender/company/companyContent";
			} else if (request.getParameter("link").equals("9")) {
				menu = "qa/question/question";
			} else if (request.getParameter("link").equals("10")) {
				menu = "qa/question/questionDetail";
			} else if (request.getParameter("link").equals("11")) {
					menu = "/admin/customerCare/stats/stats2";
			}
			request.setAttribute("menu", menu + ".jsp");
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
			
		} else {
			request.setAttribute("menu", "/admin/dashboard/dashboard.jsp");
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}


		String link = request.getParameter("link");
		System.out.println(link);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
