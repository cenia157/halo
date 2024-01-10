package com.halo.admin.boardmanagement.ask;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/CheckboxPagingC")
public class CheckboxPagingC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean completed = Boolean.parseBoolean(request.getParameter("completed"));
		boolean uncompleted = Boolean.parseBoolean(request.getParameter("uncompleted"));
		AskDAO.getAllQnCcheckbox(completed, uncompleted, request, response);
		
		int p = Integer.parseInt(request.getParameter("p"));
		System.out.println(p);
		
		AskDAO.QpagingAdmin(p, request);
		// QnCs를 JSON으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonQnCs = objectMapper.writeValueAsString(request.getAttribute("QnCs"));
		
		System.out.println("new QnCs (JSON): " + jsonQnCs);
		response.getWriter().write(jsonQnCs);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
