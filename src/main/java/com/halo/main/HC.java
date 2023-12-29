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
		String subMenu = null;
		//DB에 업뎃된 모든 homepage_common 정보
		MainpageDAO.getMdao().getAllHompage_common(request);
		if (request.getParameter("link") != null) {
			if (request.getParameter("link").equals("1")) {
				subMenu = "information/company/inform";
			} else if (request.getParameter("link").equals("2")) {
				subMenu = "information/map/map";
			} else if (request.getParameter("link").equals("3")) {
				subMenu = "introduce/announcement/announcement_contentPage";
			} else if (request.getParameter("link").equals("4")) {
				subMenu = "introduce/album/album_contentPage";
			} else if (request.getParameter("link").equals("5")) {
				subMenu = "introduce/employment/employment_contentPage";
			} else if (request.getParameter("link").equals("6")) {
				subMenu = "service/serviceInformation/serviceInformation";
			} else if (request.getParameter("link").equals("7")) {
				subMenu = "service/serviceApply/serviceApply";
			} else if (request.getParameter("link").equals("8")) {
				subMenu = "qa/faq/faq";
			} else if (request.getParameter("link").equals("9")) {
				subMenu = "qa/question/question";
			} else if (request.getParameter("link").equals("10")) {
				subMenu = "qa/question/questionDetail";
			} 
			request.setAttribute("menu", "user/menu-index.jsp");
			request.setAttribute("subMenu", subMenu + ".jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		} else {
			request.setAttribute("menu", "home.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		 if (request.getParameter("link").equals("7")) {
			 contentPage = "service/serviceApply/serviceApply";
			request.setAttribute("step1Pos", "#ffdf6c");
			request.setAttribute("serviceStep", "svcselect.jsp");
		}


		String link = request.getParameter("link");
		System.out.println(link);

		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
