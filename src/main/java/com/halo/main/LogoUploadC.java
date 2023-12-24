package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogoUploadC")
public class LogoUploadC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//바꿀 로고 이미지파일 미리보기로 보여주기
		System.out.println("asd");
		MainpageDAO.getMdao().uploadLogo(request);
		System.out.println("fgh");
		//이미지 받고 어디로?
//		request.setAttribute("menu", "admin/homepageSetting/logo/logoContent");
		request.getRequestDispatcher("${pageContext.request.contextPath}/admin").forward(request, response);
	}

}
