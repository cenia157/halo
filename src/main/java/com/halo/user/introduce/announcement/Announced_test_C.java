package com.halo.user.introduce.announcement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Announced_test_C")
public class Announced_test_C extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnnouncedDAO.getAllAnnouncements(request);
//		request.setAttribute("menu", "/user/introduce/announcement/announcement_contentPage_db_test.jsp");
		request.setAttribute("menu", "user/menu-index.jsp");
		request.setAttribute("subMenu", "/user/introduce/announcement/announcement_contentPage_db_test.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
