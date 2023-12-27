package com.halo.admin.boardmanagement.ask;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.user.qa.question.QuestionDAO;

@WebServlet("/CommentUpdateC")
public class CommentUpdateC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AskDAO.AskAnswerUpdate(request);
		QuestionDAO.getAllQuestions(request);
		String comments = AskDAO.commentList(request, response);
		request.setAttribute("comments", comments);
		System.out.println("comments: "+ comments);
	}

}
