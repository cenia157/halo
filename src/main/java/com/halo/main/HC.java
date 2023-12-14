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
		String contentPage = null;
		 if (request.getParameter("link").equals("7")) {
			 contentPage = "service/serviceApply/serviceApply";
			request.setAttribute("step1Pos", "#ffdf6c");
			request.setAttribute("serviceStep", "svcselect.jsp");
		}
		
		if (request.getParameter("link") != null) {
			if (request.getParameter("link").equals("1")) {
				contentPage = "information/company/inform";
			} else if (request.getParameter("link").equals("2")) {
				contentPage = "information/map/map";
			} else if (request.getParameter("link").equals("3")) {
				contentPage = "introduce/announcement/announcement_contentPage";
			} else if (request.getParameter("link").equals("4")) {
				contentPage = "introduce/album/album_contentPage";
			} else if (request.getParameter("link").equals("5")) {
				contentPage = "introduce/employment/employment_contentPage";
			} else if (request.getParameter("link").equals("6")) {
				contentPage = "service/serviceInformation/serviceInformation";
			} else if (request.getParameter("link").equals("8")) {
				contentPage = "qa/faq/faq";
			} else if (request.getParameter("link").equals("9")) {
				contentPage = "qa/question/question";
			} else if (request.getParameter("link").equals("10")) {
				contentPage = "qa/question/questionDetail";
			}
			request.setAttribute("contentPage", contentPage + ".jsp");
			request.getRequestDispatcher("user/menu-index.jsp").forward(request, response);
		} else {
			request.setAttribute("contentPage", "home.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

		String link = request.getParameter("link");
		System.out.println(link);


		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
