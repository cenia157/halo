package com.halo.user.qa.question;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/QuestionC")
public class QuestionC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionDAO.questionSubmit(request);
		String subMenu = "qa/question/questionDetail";
		request.setAttribute("menu", "user/menu-index.jsp");
		request.setAttribute("subMenu", subMenu + ".jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
		String q_title = request.getParameter("q_title");
		System.out.println("q_title: " + q_title);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
