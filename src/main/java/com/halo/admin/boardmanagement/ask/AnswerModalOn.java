package com.halo.admin.boardmanagement.ask;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.user.qa.question.QuestionDAO;

@WebServlet("/AnswerModalOn")
public class AnswerModalOn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionDAO.getQuestion(request);
		request.setAttribute("menu", "/admin/boardmanagement/ask/.jsp");
		
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
