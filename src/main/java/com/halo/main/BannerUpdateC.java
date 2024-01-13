package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BannerUpdateC")
public class BannerUpdateC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("seletedOption"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//getAll로 DTO깐거 가져옴
		MainpageDAO.getMdao().getAllHompage_common(request);
		//업뎃 메소드
		request.getParameter("selectedOption");
		request.getParameter("url");
		request.getParameter("pdName");
		MainpageDAO.getMdao().updateBanner(request);
		response.sendRedirect("BannerUploadC");
		System.out.println("업뎃 지나감~~");
	
	
	}

}
