package com.halo.admin.boardmanagement.ask;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.user.qa.question.QuestionDAO;

@WebServlet("/CommentSubmitC")
public class CommentSubmitC extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionDAO.getAllQuestions(request);
		AskDAO.AskAnswerSubmit(request, response);
		
		
		
		request.setAttribute("menu", "/admin/boardmanagement/ask/askContent.jsp");
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionDAO.getAllQuestions(request);
		AskDAO.AskAnswerSubmit(request, response);
		
		request.setAttribute("menu", "/admin/boardmanagement/ask/askContent.jsp");
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		
	}

}
