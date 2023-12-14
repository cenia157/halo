package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HC")
public class HC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("link") != null) {
		if (request.getParameter("link").equals("1")) {
			request.setAttribute("contentPage", "information/company/inform.jsp");
		}  else if (request.getParameter("link").equals("2")) {
			request.setAttribute("contentPage", "information/map/map.jsp");
		} else if (request.getParameter("link").equals("3")) {
			request.setAttribute("contentPage", "introduce/announcement/announcement_contentPage.jsp");
		} else if (request.getParameter("link").equals("4")) {
			request.setAttribute("contentPage", "introduce/album/album_contentPage.jsp");
		} else if (request.getParameter("link").equals("5")) {
			request.setAttribute("contentPage", "introduce/employment/employment_contentPage.jsp");
		} else if (request.getParameter("link").equals("6")) {
			request.setAttribute("contentPage", "service/serviceInformation/serviceInformation.jsp");
		} else if (request.getParameter("link").equals("7")) {
			request.setAttribute("contentPage", "service/serviceApply/complet.jsp");
		} else if (request.getParameter("link").equals("8")) {
			request.setAttribute("contentPage", "qa/faq/faq.jsp");
		} else if (request.getParameter("link").equals("9")) {
			request.setAttribute("contentPage", "qa/question/question.jsp");
		} else if (request.getParameter("link").equals("10")) {
			request.setAttribute("contentPage", "qa/question/questionDetail.jsp");
		}
	}
		
		
		String link = request.getParameter("link");
		System.out.println(link);
		
		if (link == null) {
			request.setAttribute("contentPage","information/company/inform.jsp");
			System.out.println(1);
		}
		
		request.getRequestDispatcher("user/menu-index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
