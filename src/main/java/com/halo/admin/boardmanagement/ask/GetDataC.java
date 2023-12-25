package com.halo.admin.boardmanagement.ask;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.user.qa.question.QuestionDAO;
@WebServlet("/GetDataC")
public class GetDataC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonData = QuestionDAO.questionList(request, response);
		QuestionDAO.questionList(request, response);
	    // 응답의 Content-Type 설정
	    response.setContentType("application/json");
	    // 생성한 JSON 데이터를 클라이언트로 전송
	    response.getWriter().write(jsonData);
	    System.out.println("확인용: "+ QuestionDAO.questionList(request, response));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonData = QuestionDAO.questionList(request, response);
		QuestionDAO.questionList(request, response);
	    // 응답의 Content-Type 설정
	    response.setContentType("application/json");

	    // 생성한 JSON 데이터를 클라이언트로 전송
	    response.getWriter().write(jsonData);

	}

}
