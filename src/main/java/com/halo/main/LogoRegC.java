package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogoRegC")
public class LogoRegC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로고img 등록하는 일
//		MainpageDAO.regLogo(request);
		
		//싱글톤 수정
		MainpageDAO.getMdao().regLogo(request);
		
		//하고나서 
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
