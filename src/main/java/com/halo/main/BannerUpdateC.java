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
		//getAll로 DTO깐거 가져옴
		MainpageDAO.getMdao().getAllHompage_common(request);
		//AdminC에 있던 menu 어트리뷰트(경로) 정의
		//Admin page 메뉴(index.jsp) 안고가기 => 디스페쳐
		request.setAttribute("menu", "/admin/homepageSetting/banner/bannerContent.jsp");
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//업뎃 메소드
		MainpageDAO.getMdao().updateBanner(request);
		response.sendRedirect("BannerUpdateC");
		
	
	
	}

}
