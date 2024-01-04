package com.halo.user.qa.faq;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.admin.boardmanagement.frequenthyask.FAQDAO;

@WebServlet("/LoadFAQDetailContentC")
public class LoadFAQDetailContentC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FAQDAO.getFAQDetail(request, response);
		String jsonData = FAQDAO.FAQList(request, response); 
		FAQDAO.FAQList(request, response);
		
	    // 응답의 Content-Type 설정
	    response.setContentType("application/json");

	    // 생성한 JSON 데이터를 클라이언트로 전송
	    response.getWriter().write(jsonData);
	    System.out.println("LoadFAQDetailContentC:" +jsonData);
	}

}