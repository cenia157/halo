package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.user.qa.question.QuestionDAO;

@WebServlet("/AdminC")
public class AdminC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String menu = null;
		//DB에 업뎃된(저장된) homepage_common 모든 어트리뷰트
		MainpageDAO.getMdao().getAllHompage_common(request);
		if (request.getParameter("link") != null) {
			if (request.getParameter("link").equals("2")) {
				menu = "/admin/homepageSetting/mainpage/mainpageContent";
			} // 버튼누르면 바로 해당기능C로 ㄱㄱ하도록 인덱스에 박아둠, 해당 페이지 링크부분 삭제함
			else if (request.getParameter("link").equals("5")) {
				menu = "/admin/boardmanagement/notice/noticeContent";
			} else if (request.getParameter("link").equals("6")) {
				menu = "/admin/boardmanagement/ask/askContent";
			} else if (request.getParameter("link").equals("7")) {
				menu = "/admin/boardmanagement/frequenthyask_Test_JW/frequenthyaskContent";
			} else if (request.getParameter("link").equals("8")) {
				menu = "/admin/calender/company/companyContent";
			} else if (request.getParameter("link").equals("9")) {
				menu = "/admin/calender/reservation/reservationContent";
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
