package com.halo.admin.boardmanagement.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NoticeMainC")
public class NoticeMainC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Notice.getAllNOTICE(request, response);
		Notice.NOTICEpagingAdmin(1, request);
		
		request.setAttribute("menu", "/admin/boardmanagement/notice/noticeContent.jsp");
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Notice.getAllNOTICE(request, response);

		request.setAttribute("menu", "/admin/boardmanagement/notice/noticeContent.jsp");
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);

	}

}
